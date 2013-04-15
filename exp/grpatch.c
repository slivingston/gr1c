/* grpatch.c -- main entry point for execution of patching routines.
 *
 *
 * SCL; 2012, 2013.
 */


#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "common.h"
#include "logging.h"
#include "ptree.h"
#include "solve.h"
#include "patching.h"
#include "automaton.h"
#include "solve_metric.h"
#include "gr1c_util.h"
extern int yyparse( void );
extern void yyrestart( FILE *new_file );


/**************************
 **** Global variables ****/

ptree_t *nonbool_var_list = NULL;

extern ptree_t *evar_list;
extern ptree_t *svar_list;
extern ptree_t *env_init;
extern ptree_t *sys_init;
ptree_t *env_trans = NULL;  /* Built from component parse trees in env_trans_array. */
ptree_t *sys_trans = NULL;
extern ptree_t **env_goals;
extern ptree_t **sys_goals;
extern int num_egoals;
extern int num_sgoals;

extern ptree_t **env_trans_array;
extern ptree_t **sys_trans_array;
extern int et_array_len;
extern int st_array_len;

extern ptree_t *gen_tree_ptr;

/**************************/


/* Output formats */
#define OUTPUT_FORMAT_TEXT 0
#define OUTPUT_FORMAT_TULIP 1
#define OUTPUT_FORMAT_DOT 2
#define OUTPUT_FORMAT_AUT 3
#define OUTPUT_FORMAT_TULIP0 4

/* Runtime modes */
#define GR1C_MODE_UNSET 0
#define GR1C_MODE_PATCH 4


int main( int argc, char **argv )
{
	FILE *fp;
	byte run_option = GR1C_MODE_UNSET;
	bool help_flag = False;
	bool ptdump_flag = False;
	bool logging_flag = False;
	byte format_option = OUTPUT_FORMAT_TULIP;
	unsigned char verbose = 0;
	int input_index = -1;
	int edges_input_index = -1;  /* If patching, command-line flag "-e". */
	int aut_input_index = -1;  /* For command-line flag "-a". */
	int output_file_index = -1;  /* For command-line flag "-o". */
	FILE *strategy_fp;
	char dumpfilename[64];

	FILE *clf_file = NULL;
	int clformula_index = -1;  /* For command-line flag "-f". */
	ptree_t *clformula = NULL;

	int i, j, var_index;
	ptree_t *tmppt;  /* General purpose temporary ptree pointer */

	DdManager *manager;
	DdNode *T = NULL;
	anode_t *strategy = NULL;
	int num_env, num_sys;
	int original_num_env, original_num_sys;

	char *metric_vars = NULL;
	int *offw = NULL, num_metric_vars;

	/* Look for flags in command-line arguments. */
	for (i = 1; i < argc; i++) {
		if (argv[i][0] == '-') {
			if (argv[i][1] == 'h') {
				help_flag = True;
			} else if (argv[i][1] == 'V') {
				printf( "grpatch (experiment-related program, distributed with gr1c v" GR1C_VERSION ")\n\n" GR1C_COPYRIGHT "\n" );
				return 0;
			} else if (argv[i][1] == 'v') {
				verbose = 1;
				j = 2;
				/* Only support up to "level 2" of verbosity */
				while (argv[i][j] == 'v' && j <= 2) {
					verbose++;
					j++;
				}
			} else if (argv[i][1] == 'l') {
				logging_flag = True;
			} else if (argv[i][1] == 'p') {
				ptdump_flag = True;
			} else if (argv[i][1] == 'm') {
				if (i == argc-1) {
					fprintf( stderr, "Invalid flag given. Try \"-h\".\n" );
					return 1;
				}
				metric_vars = strdup( argv[i+1] );
				i++;
			} else if (argv[i][1] == 't') {
				if (i == argc-1) {
					fprintf( stderr, "Invalid flag given. Try \"-h\".\n" );
					return 1;
				}
				if (!strncmp( argv[i+1], "txt", strlen( "txt" ) )) {
					format_option = OUTPUT_FORMAT_TEXT;
				} else if (!strncmp( argv[i+1], "tulip0", strlen( "tulip0" ) )) {
					format_option = OUTPUT_FORMAT_TULIP0;
				} else if (!strncmp( argv[i+1], "tulip", strlen( "tulip" ) )) {
					format_option = OUTPUT_FORMAT_TULIP;
				} else if (!strncmp( argv[i+1], "dot", strlen( "dot" ) )) {
					format_option = OUTPUT_FORMAT_DOT;
				} else if (!strncmp( argv[i+1], "aut", strlen( "aut" ) )) {
					format_option = OUTPUT_FORMAT_AUT;
				} else {
					fprintf( stderr, "Unrecognized output format. Try \"-h\".\n" );
					return 1;
				}
				i++;
			} else if (argv[i][1] == 'e') {
				if (i == argc-1) {
					fprintf( stderr, "Invalid flag given. Try \"-h\".\n" );
					return 1;
				}
				run_option = GR1C_MODE_PATCH;
				edges_input_index = i+1;
				i++;
			} else if (argv[i][1] == 'a') {
				if (i == argc-1) {
					fprintf( stderr, "Invalid flag given. Try \"-h\".\n" );
					return 1;
				}
				aut_input_index = i+1;
				i++;
			} else if (argv[i][1] == 'o') {
				if (i == argc-1) {
					fprintf( stderr, "Invalid flag given. Try \"-h\".\n" );
					return 1;
				}
				output_file_index = i+1;
				i++;
			} else if (argv[i][1] == 'f') {
				if (i == argc-1) {
					fprintf( stderr, "Invalid flag given. Try \"-h\".\n" );
					return 1;
				}
				run_option = GR1C_MODE_PATCH;
				clformula_index = i+1;
				i++;
			} else {
				fprintf( stderr, "Invalid flag given. Try \"-h\".\n" );
				return 1;
			}
		} else if (input_index < 0) {
			/* Use first non-flag argument as filename whence to read
			   specification. */
			input_index = i;
		}
	}

	if (edges_input_index >= 0 && clformula_index >= 0) {
		fprintf( stderr, "\"-e\" and \"-a\" flags cannot be used simultaneously.\n" );
		return 1;
	} else if (edges_input_index >= 0 && aut_input_index < 0) {
		fprintf( stderr, "\"-e\" flag can only be used with \"-a\"\n" );
		return 1;
	} else if (clformula_index >= 0 && aut_input_index < 0) {
		fprintf( stderr, "\"-f\" flag can only be used with \"-a\"\n" );
		return 1;
	}

	if (help_flag) {
		/* Split among printf() calls to conform with ISO C90 string length */
		printf( "Usage: %s [-hVvlp] [-m VARS] [-t TYPE] [-aeo FILE] [-f FORM] [FILE]\n\n"
				"  -h          this help message\n"
				"  -V          print version and exit\n"
				"  -v          be verbose; use -vv to be more verbose\n"
				"  -l          enable logging\n"
				"  -t TYPE     strategy output format; default is \"tulip\";\n"
				"              supported formats: txt, dot, aut, tulip, tulip0\n"
				"  -p          dump parse trees to DOT files, and echo formulas to screen\n", argv[0] );
		printf( "  -m VARS     VARS is a space-separated list of metric variables\n"
				"  -a FILE     automaton file in \"gr1c\" format;\n"
				"              if FILE is -, then read from stdin\n"
				"  -e FILE     patch, given game edge set change file; requires -a flag\n"
				"  -o FILE     output strategy to FILE, rather than stdout (default)\n"
				"  -f FORM     FORM is a Boolean (state) formula, currently only\n"
				"              used for appending a system goal; requires -a flag.\n" );
		return 1;
	}

	if (input_index < 0 && (run_option == GR1C_MODE_PATCH && !strncmp( argv[aut_input_index], "-", 1 ))) {
		printf( "Reading spec from stdin in some cases while patching is not yet implemented.\n" );
		return 1;
	}
	if (run_option == GR1C_MODE_UNSET) {
		fprintf( stderr, "%s requires a patching request. Try \"-h\".\n", argv[0] );
		return 1;
	}

	if (logging_flag) {
		openlogfile( NULL );  /* Use default filename prefix */
		/* Only change verbosity level if user did not specify it */
		if (verbose == 0)
			verbose = 1;
	} else {
		setlogstream( stdout );
		setlogopt( LOGOPT_NOTIME );
	}
	if (verbose > 0)
		logprint( "Running with verbosity level %d.", verbose );

	if (metric_vars != NULL && strlen(metric_vars) == 0) {
		free( metric_vars );
		metric_vars = NULL;
		if (verbose > 1)
			logprint( "Empty metric variable list given at command-line." );
	}

	if (clformula_index >= 0) {
		if (verbose > 1) {
			logprint( "Parsing command-line formula \"%s\"...", argv[clformula_index] );
		}

		clf_file = tmpfile();
		if (clf_file == NULL) {
			perror( "gr1c, tmpfile" );
			return -1;
		}
		fprintf( clf_file, "%s\n", argv[clformula_index] );
		if (fseek( clf_file, 0, SEEK_SET )) {
			perror( "gr1c, fseek" );
			return -1;
		}
		yyrestart( clf_file );
		yyparse();
		fclose( clf_file );

		clformula = gen_tree_ptr;
		gen_tree_ptr = NULL;

		if (ptdump_flag)
			tree_dot_dump( clformula, "clformula_ptree.dot" );
		if (verbose > 1) {
			logprint_startline();
			logprint_raw( "Command-line formula, printed from ptree: " );
			print_formula( clformula, getlogstream() );
			logprint_endline();
		}
	}

	/* If filename for specification given at command-line, then use
	   it.  Else, read from stdin. */
	if (input_index > 0) {
		fp = fopen( argv[input_index], "r" );
		if (fp == NULL) {
			perror( "gr1c, fopen" );
			return -1;
		}
		yyrestart( fp );
	} else {
		yyrestart( stdin );
	}

	/* Parse the specification. */
	evar_list = NULL;
	svar_list = NULL;
	gen_tree_ptr = NULL;
	if (verbose)
		logprint( "Parsing input..." );
	if (yyparse())
		return -1;
	if (verbose)
		logprint( "Done." );

	/* Close input file, if opened. */
	if (input_index > 0)
		fclose( fp );

	/* Treat deterministic problem in which ETRANS or EINIT is omitted. */
	if (evar_list == NULL) {
		if (et_array_len == 0) {
			et_array_len = 1;
			env_trans_array = malloc( sizeof(ptree_t *) );
			if (env_trans_array == NULL) {
				perror( "gr1c, malloc" );
				return -1;
			}
			*env_trans_array = init_ptree( PT_CONSTANT, NULL, 1 );
		}
		if (env_init == NULL)
			env_init = init_ptree( PT_CONSTANT, NULL, 1 );
	}

	/* Merge component safety (transition) formulas in certain
	   situations, or if DOT dumps of the parse trees were requested. */
	if (ptdump_flag || (clformula_index >= 0)) {
		if (et_array_len > 1) {
			env_trans = merge_ptrees( env_trans_array, et_array_len, PT_AND );
		} else if (et_array_len == 1) {
			env_trans = *env_trans_array;
		} else {
			fprintf( stderr, "Syntax error: GR(1) specification is missing environment transition rules.\n" );
			return -1;
		}
		if (st_array_len > 1) {
			sys_trans = merge_ptrees( sys_trans_array, st_array_len, PT_AND );
		} else if (st_array_len == 1) {
			sys_trans = *sys_trans_array;
		} else {
			fprintf( stderr, "Syntax error: GR(1) specification is missing system transition rules.\n" );
			return -1;
		}
	}

	/* Number of variables, before expansion of those that are nonboolean */
	original_num_env = tree_size( evar_list );
	original_num_sys = tree_size( svar_list );


	if (ptdump_flag) {
		tree_dot_dump( env_init, "env_init_ptree.dot" );
		tree_dot_dump( sys_init, "sys_init_ptree.dot" );
		tree_dot_dump( env_trans, "env_trans_ptree.dot" );
		tree_dot_dump( sys_trans, "sys_trans_ptree.dot" );

		if (num_egoals > 0) {
			for (i = 0; i < num_egoals; i++) {
				snprintf( dumpfilename, sizeof(dumpfilename),
						 "env_goal%05d_ptree.dot", i );
				tree_dot_dump( *(env_goals+i), dumpfilename );
			}
		}
		if (num_sgoals > 0) {
			for (i = 0; i < num_sgoals; i++) {
				snprintf( dumpfilename, sizeof(dumpfilename),
						 "sys_goal%05d_ptree.dot", i );
				tree_dot_dump( *(sys_goals+i), dumpfilename );
			}
		}

		var_index = 0;
		printf( "Environment variables (indices; domains): " );
		if (evar_list == NULL) {
			printf( "(none)" );
		} else {
			tmppt = evar_list;
			while (tmppt) {
				if (tmppt->value == 0) {  /* Boolean */
					if (tmppt->left == NULL) {
						printf( "%s (%d; bool)", tmppt->name, var_index );
					} else {
						printf( "%s (%d; bool), ", tmppt->name, var_index);
					}
				} else {
					if (tmppt->left == NULL) {
						printf( "%s (%d; {0..%d})", tmppt->name, var_index, tmppt->value );
					} else {
						printf( "%s (%d; {0..%d}), ", tmppt->name, var_index, tmppt->value );
					}
				}
				tmppt = tmppt->left;
				var_index++;
			}
		}
		printf( "\n\n" );

		printf( "System variables (indices; domains): " );
		if (svar_list == NULL) {
			printf( "(none)" );
		} else {
			tmppt = svar_list;
			while (tmppt) {
				if (tmppt->value == 0) {  /* Boolean */
					if (tmppt->left == NULL) {
						printf( "%s (%d; bool)", tmppt->name, var_index );
					} else {
						printf( "%s (%d; bool), ", tmppt->name, var_index );
					}
				} else {
					if (tmppt->left == NULL) {
						printf( "%s (%d; {0..%d})", tmppt->name, var_index, tmppt->value );
					} else {
						printf( "%s (%d; {0..%d}), ", tmppt->name, var_index, tmppt->value );
					}
				}
				tmppt = tmppt->left;
				var_index++;
			}
		}
		printf( "\n\n" );

		print_GR1_spec( evar_list, svar_list, env_init, sys_init, env_trans, sys_trans,
						env_goals, num_egoals, sys_goals, num_sgoals, stdout );
	}

	if (expand_nonbool_GR1( evar_list, svar_list, &env_init, &sys_init,
							&env_trans, &sys_trans,
							&env_goals, num_egoals, &sys_goals, num_sgoals,
							verbose ) < 0)
		return -1;
	nonbool_var_list = expand_nonbool_variables( &evar_list, &svar_list, verbose );

	tmppt = nonbool_var_list;
	while (tmppt) {
		if (clformula != NULL) {
			if (verbose > 1)
				logprint( "Expanding nonbool variable %s in command-line formula...", tmppt->name );
			clformula = expand_to_bool( clformula, tmppt->name, tmppt->value );
			if (verbose > 1)
				logprint( "Done." );
		}
		tmppt = tmppt->left;
	}

	if (verbose > 1)
		/* Dump the spec to show results of conversion (if any). */
		print_GR1_spec( evar_list, svar_list, env_init, sys_init, env_trans, sys_trans,
					   env_goals, num_egoals, sys_goals, num_sgoals, NULL );


	num_env = tree_size( evar_list );
	num_sys = tree_size( svar_list );

	/* Compute bitwise offsets for metric variables, if requested. */
	if (metric_vars != NULL)
		offw = get_offsets( metric_vars, &num_metric_vars );

	manager = Cudd_Init( 2*(num_env+num_sys),
						 0, CUDD_UNIQUE_SLOTS, CUDD_CACHE_SLOTS, 0 );
	Cudd_SetMaxCacheHard( manager, (unsigned int)-1 );
	Cudd_AutodynEnable( manager, CUDD_REORDER_SAME );

	if (!strncmp( argv[aut_input_index], "-", 1 )) {
		strategy_fp = stdin;
	} else {
		strategy_fp = fopen( argv[aut_input_index], "r" );
		if (strategy_fp == NULL) {
			perror( "gr1c, fopen" );
			return -1;
		}
	}

	if (edges_input_index >= 0) {  /* patch_localfixpoint() */
		fp = fopen( argv[edges_input_index], "r" );
		if (fp == NULL) {
			perror( "gr1c, fopen" );
			return -1;
		}

		if (verbose)
			logprint( "Patching given strategy..." );
		strategy = patch_localfixpoint( manager, strategy_fp, fp, verbose );
		if (verbose)
			logprint( "Done." );

		fclose( fp );
	} else if (clformula_index >= 0) {  /* add_metric_sysgoal() */

		if (verbose)
			logprint( "Patching given strategy..." );
		strategy = add_metric_sysgoal( manager, strategy_fp, original_num_env, original_num_sys, offw, num_metric_vars, clformula, verbose );
		if (verbose)
			logprint( "Done." );

	} else {
		fprintf( stderr, "Unrecognized patching request.  Try \"-h\".\n" );
		return 1;
	}
	if (strategy_fp != stdin)
		fclose( strategy_fp );
	if (strategy == NULL) {
		fprintf( stderr, "Failed to patch strategy.\n" );
		return -1;
	}

	T = NULL;  /* To avoid seg faults by the generic clean-up code. */

	if (strategy != NULL) {  /* De-expand nonboolean variables */
		tmppt = nonbool_var_list;
		while (tmppt) {
			aut_compact_nonbool( strategy, evar_list, svar_list, tmppt->name, tmppt->value );
			tmppt = tmppt->left;
		}

		num_env = tree_size( evar_list );
		num_sys = tree_size( svar_list );
	}

	if (strategy != NULL) {
		/* Open output file if specified; else point to stdout. */
		if (output_file_index >= 0) {
			fp = fopen( argv[output_file_index], "w" );
			if (fp == NULL) {
				perror( "gr1c, fopen" );
				return -1;
			}
		} else {
			fp = stdout;
		}

		if (verbose)
			logprint( "Dumping automaton of size %d...", aut_size( strategy ) );

		if (format_option == OUTPUT_FORMAT_TEXT) {
			list_aut_dump( strategy, num_env+num_sys, fp );
		} else if (format_option == OUTPUT_FORMAT_DOT) {
			if (nonbool_var_list != NULL) {
				dot_aut_dump( strategy, evar_list, svar_list,
							  DOT_AUT_ATTRIB, fp );
			} else {
				dot_aut_dump( strategy, evar_list, svar_list,
							  DOT_AUT_BINARY | DOT_AUT_ATTRIB, fp );
			}
		} else if (format_option == OUTPUT_FORMAT_AUT) {
			aut_aut_dump( strategy, num_env+num_sys, fp );
		} else if (format_option == OUTPUT_FORMAT_TULIP0) {
			tulip0_aut_dump( strategy, evar_list, svar_list, fp );
		} else { /* OUTPUT_FORMAT_TULIP */
			tulip_aut_dump( strategy, evar_list, svar_list, fp );
		}

		if (fp != stdout)
			fclose( fp );
	}

	/* Clean-up */
	if (metric_vars != NULL)
		free( metric_vars );
	if (offw != NULL)
		free( offw );
	delete_tree( clformula );
	delete_tree( evar_list );
	delete_tree( svar_list );
	delete_tree( env_init );
	delete_tree( sys_init );
	delete_tree( env_trans );
	delete_tree( sys_trans );
	for (i = 0; i < num_egoals; i++)
		delete_tree( *(env_goals+i) );
	if (num_egoals > 0)
		free( env_goals );
	for (i = 0; i < num_sgoals; i++)
		delete_tree( *(sys_goals+i) );
	if (num_sgoals > 0)
		free( sys_goals );
	if (T != NULL)
		Cudd_RecursiveDeref( manager, T );
	if (strategy)
		delete_aut( strategy );
	if (verbose)
		logprint( "Cudd_CheckZeroRef -> %d", Cudd_CheckZeroRef( manager ) );
	Cudd_Quit(manager);
	if (logging_flag)
		closelogfile();

	return 0;
}