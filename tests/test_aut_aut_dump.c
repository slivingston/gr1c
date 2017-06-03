/* Unit tests for aut_aut_dump()
 *
 * SCL; 2017
 */

#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#include "common.h"
#include "tests_common.h"
#include "automaton.h"


#define REF_GR1CAUT_SINGLE_LOOP \
"1\n" \
"0 0 0 0 1 0 -1 0\n"


#define STRING_MAXLEN 1024
int main(void)
{
    int fd;
    FILE *fp;
    char filename[STRING_MAXLEN];
    char instr[STRING_MAXLEN];
    anode_t *head = NULL;
    const int state_len = 3;
    vartype state[] = {0, 0, 0};

    head = insert_anode( NULL, 0, -1, True, state, state_len );
    head->trans = malloc( sizeof(anode_t *) );
    assert( head->trans );
    head->trans_len = 1;
    *(head->trans) = head;

    strcpy( filename, "dumpXXXXXX" );
    fd = mkstemp( filename );
    if (fd == -1) {
        perror( __FILE__ ", mkstemp" );
        abort();
    }
    fp = fdopen( fd, "w+" );
    if (fp == NULL) {
        perror( __FILE__ ", fdopen" );
        abort();
    }

    assert( !aut_aut_dumpver( head, state_len, fp, 1 ) );

    if (fseek( fp, 0, SEEK_SET )) {
        perror( __FILE__ ", fseek" );
        abort();
    }
    /* NB, assumed width may cause problems if we start using Unicode. */
    if (fread( instr, sizeof(char), strlen(REF_GR1CAUT_SINGLE_LOOP)+1, fp )
        < strlen(REF_GR1CAUT_SINGLE_LOOP)) {
        ERRPRINT( "output of aut_aut_dump is too short." );
        abort();
    }
    if (strncmp( instr, REF_GR1CAUT_SINGLE_LOOP,
                 strlen(REF_GR1CAUT_SINGLE_LOOP) )) {
        ERRPRINT( "output of aut_aut_dump does not match expectation" );
        ERRPRINT1( "%s", instr  );
        ERRPRINT1( "%s", REF_GR1CAUT_SINGLE_LOOP );
        abort();
    }

    fclose( fp );
    if (remove( filename )) {
        perror( __FILE__ ", remove" );
        abort();
    }

    return 0;
}
