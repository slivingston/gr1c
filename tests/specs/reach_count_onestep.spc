# For expected output after synthesis and calling list_aut_dump(), see
# tests/expected_outputs/reach_count_onestep.spc.listdump.out

ENV: ;
SYS: y [0,2];
ENVINIT: ;
ENVTRANS:;
ENVGOAL: ;

SYSINIT: ;
SYSTRANS: ;
SYSGOAL: <>(y = 1);
