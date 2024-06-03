GETSP _MEMORY_SIZE SWAP SAVE 
_main CALL 
GETRV HALT 
:_MEMORY_SIZE 0 
:_PROGRAM_SIZE PROGRAM_SIZE 

:_out 
GETFP GETSP SETFP 
GETFP 2 ADD LOAD OUT 
:__out 
GETFP SETSP SETFP 
1 RETN 

:_getFP 
GETFP GETSP SETFP 
GETFP SETRV __getFP JMP 
:__getFP 
GETFP SETSP SETFP 
JMP 

:_printInt 
GETFP GETSP SETFP 
GETFP 2 ADD LOAD 
10 
CMP _true_if_0_printInt JGE 
_exit_if_0_printInt JMP 
:_true_if_0_printInt 
GETFP 2 ADD LOAD 10 DIV _printInt CALL GETRV DROP 
:_exit_if_0_printInt 
GETFP 2 ADD LOAD 10 MOD 48 ADD _out CALL GETRV DROP 
:__printInt 
GETFP SETSP SETFP 
1 RETN 

:_newLine 
GETFP GETSP SETFP 
10 _out CALL GETRV DROP 
:__newLine 
GETFP SETSP SETFP 
JMP 

:_Animal__setName 
GETFP GETSP SETFP 
GETFP 2 ADD LOAD 1 ADD GETFP 3 ADD LOAD SAVE 
:__Animal__setName 
GETFP SETSP SETFP 
2 RETN 

:_Animal__getName 
GETFP GETSP SETFP 
GETFP 2 ADD LOAD 1 ADD LOAD SETRV __Animal__getName JMP 
:__Animal__getName 
GETFP SETSP SETFP 
1 RETN 

:_Animal__getType 
GETFP GETSP SETFP 
1 SETRV __Animal__getType JMP 
:__Animal__getType 
GETFP SETSP SETFP 
1 RETN 

:_Animal_vtbl__ 
0 _Animal__setName _Animal__getName _Animal__getType 

:_Cat__setBreed 
GETFP GETSP SETFP 
GETFP 2 ADD LOAD 2 ADD GETFP 3 ADD LOAD SAVE 
:__Cat__setBreed 
GETFP SETSP SETFP 
2 RETN 

:_Cat__getBreed 
GETFP GETSP SETFP 
GETFP 2 ADD LOAD 2 ADD LOAD SETRV __Cat__getBreed JMP 
:__Cat__getBreed 
GETFP SETSP SETFP 
1 RETN 

:_Cat__getType 
GETFP GETSP SETFP 
2 SETRV __Cat__getType JMP 
:__Cat__getType 
GETFP SETSP SETFP 
1 RETN 

:_Cat_vtbl__ 
_Animal_vtbl__ _Animal__setName _Animal__getName _Cat__getType _Cat__setBreed _Cat__getBreed 

:_main 
GETFP GETSP SETFP 
GETFP GETSP SETFP 
5 PUSHN 
GETFP 2 SUB _Animal_vtbl__ SAVE 
GETFP 5 SUB _Cat_vtbl__ SAVE 
GETFP GETSP SETFP 
1 PUSHN 
GETFP 1 SUB GETFP LOAD 2 SUB SAVE 
1501 GETFP 1 SUB LOAD GETFP 1 SUB LOAD LOAD 1 ADD 0 ADD LOAD CALL GETRV SETRV GETFP SETSP SETFP 
GETRV DROP 
GETFP GETSP SETFP 
1 PUSHN 
GETFP 1 SUB GETFP LOAD 2 SUB SAVE 
GETFP 1 SUB LOAD GETFP 1 SUB LOAD LOAD 1 ADD 1 ADD LOAD CALL GETRV SETRV GETFP SETSP SETFP 
GETRV _printInt CALL GETRV DROP 
_newLine CALL GETRV DROP 
GETFP GETSP SETFP 
1 PUSHN 
GETFP 1 SUB GETFP LOAD 2 SUB SAVE 
GETFP 1 SUB LOAD GETFP 1 SUB LOAD LOAD 1 ADD 2 ADD LOAD CALL GETRV SETRV GETFP SETSP SETFP 
GETRV _printInt CALL GETRV DROP 
_newLine CALL GETRV DROP 
GETFP GETSP SETFP 
1 PUSHN 
GETFP 1 SUB GETFP LOAD 5 SUB SAVE 
100500 GETFP 1 SUB LOAD GETFP 1 SUB LOAD LOAD 1 ADD 0 ADD LOAD CALL GETRV SETRV GETFP SETSP SETFP 
GETRV DROP 
GETFP GETSP SETFP 
1 PUSHN 
GETFP 1 SUB GETFP LOAD 5 SUB SAVE 
1007 GETFP 1 SUB LOAD GETFP 1 SUB LOAD LOAD 1 ADD 3 ADD LOAD CALL GETRV SETRV GETFP SETSP SETFP 
GETRV DROP 
GETFP GETSP SETFP 
1 PUSHN 
GETFP 1 SUB GETFP LOAD 5 SUB SAVE 
GETFP 1 SUB LOAD GETFP 1 SUB LOAD LOAD 1 ADD 1 ADD LOAD CALL GETRV SETRV GETFP SETSP SETFP 
GETRV _printInt CALL GETRV DROP 
_newLine CALL GETRV DROP 
GETFP GETSP SETFP 
1 PUSHN 
GETFP 1 SUB GETFP LOAD 5 SUB SAVE 
GETFP 1 SUB LOAD GETFP 1 SUB LOAD LOAD 1 ADD 4 ADD LOAD CALL GETRV SETRV GETFP SETSP SETFP 
GETRV _printInt CALL GETRV DROP 
_newLine CALL GETRV DROP 
GETFP GETSP SETFP 
1 PUSHN 
GETFP 1 SUB GETFP LOAD 5 SUB SAVE 
GETFP 1 SUB LOAD GETFP 1 SUB LOAD LOAD 1 ADD 2 ADD LOAD CALL GETRV SETRV GETFP SETSP SETFP 
GETRV _printInt CALL GETRV DROP 
_newLine CALL GETRV DROP 
GETFP GETSP SETFP 
2 PUSHN 
GETFP 1 SUB GETFP LOAD 2 SUB SAVE 
:_loop_while_0_main 
GETFP 1 SUB LOAD 
0 
CMP _bool_0_main JNE 
_exit_while_0_main JMP 
:_bool_0_main 
GETFP 1 SUB LOAD 
_Animal_vtbl__ 
CMP _true_while_0_main JNE 
_exit_while_0_main JMP 

:_true_while_0_main 
GETFP 1 SUB GETFP 1 SUB LOAD LOAD SAVE 
_loop_while_0_main JMP 
:_exit_while_0_main 
GETFP 1 SUB LOAD 
0 
CMP _true_if_1_main JNE 
_false_if_1_main JMP 
:_true_if_1_main 
GETFP 2 SUB 1 SAVE 
_exit_if_1_main JMP 
:_false_if_1_main 
GETFP 2 SUB 0 SAVE 
:_exit_if_1_main 
GETFP 2 SUB LOAD SETRV GETFP SETSP SETFP 
GETRV 
1 
CMP _exit_if_0_main JEQ 
_true_if_0_main JMP 
:_true_if_0_main 
6661 _printInt CALL GETRV DROP 
_newLine CALL GETRV DROP 
:_exit_if_0_main 
GETFP GETSP SETFP 
2 PUSHN 
GETFP 1 SUB GETFP LOAD 5 SUB SAVE 
:_loop_while_1_main 
GETFP 1 SUB LOAD 
0 
CMP _bool_1_main JNE 
_exit_while_1_main JMP 
:_bool_1_main 
GETFP 1 SUB LOAD 
_Animal_vtbl__ 
CMP _true_while_1_main JNE 
_exit_while_1_main JMP 

:_true_while_1_main 
GETFP 1 SUB GETFP 1 SUB LOAD LOAD SAVE 
_loop_while_1_main JMP 
:_exit_while_1_main 
GETFP 1 SUB LOAD 
0 
CMP _true_if_3_main JNE 
_false_if_3_main JMP 
:_true_if_3_main 
GETFP 2 SUB 1 SAVE 
_exit_if_3_main JMP 
:_false_if_3_main 
GETFP 2 SUB 0 SAVE 
:_exit_if_3_main 
GETFP 2 SUB LOAD SETRV GETFP SETSP SETFP 
GETRV 
1 
CMP _true_if_2_main JEQ 
_exit_if_2_main JMP 
:_true_if_2_main 
6662 _printInt CALL GETRV DROP 
_newLine CALL GETRV DROP 
:_exit_if_2_main 
GETFP GETSP SETFP 
2 PUSHN 
GETFP 1 SUB GETFP LOAD 2 SUB SAVE 
:_loop_while_2_main 
GETFP 1 SUB LOAD 
0 
CMP _bool_2_main JNE 
_exit_while_2_main JMP 
:_bool_2_main 
GETFP 1 SUB LOAD 
_Cat_vtbl__ 
CMP _true_while_2_main JNE 
_exit_while_2_main JMP 

:_true_while_2_main 
GETFP 1 SUB GETFP 1 SUB LOAD LOAD SAVE 
_loop_while_2_main JMP 
:_exit_while_2_main 
GETFP 1 SUB LOAD 
0 
CMP _true_if_5_main JNE 
_false_if_5_main JMP 
:_true_if_5_main 
GETFP 2 SUB 1 SAVE 
_exit_if_5_main JMP 
:_false_if_5_main 
GETFP 2 SUB 0 SAVE 
:_exit_if_5_main 
GETFP 2 SUB LOAD SETRV GETFP SETSP SETFP 
GETRV 
1 
CMP _true_if_4_main JEQ 
_exit_if_4_main JMP 
:_true_if_4_main 
6663 _printInt CALL GETRV DROP 
_newLine CALL GETRV DROP 
:_exit_if_4_main 
GETFP GETSP SETFP 
2 PUSHN 
GETFP 1 SUB GETFP LOAD 5 SUB SAVE 
:_loop_while_3_main 
GETFP 1 SUB LOAD 
0 
CMP _bool_3_main JNE 
_exit_while_3_main JMP 
:_bool_3_main 
GETFP 1 SUB LOAD 
_Cat_vtbl__ 
CMP _true_while_3_main JNE 
_exit_while_3_main JMP 

:_true_while_3_main 
GETFP 1 SUB GETFP 1 SUB LOAD LOAD SAVE 
_loop_while_3_main JMP 
:_exit_while_3_main 
GETFP 1 SUB LOAD 
0 
CMP _true_if_7_main JNE 
_false_if_7_main JMP 
:_true_if_7_main 
GETFP 2 SUB 1 SAVE 
_exit_if_7_main JMP 
:_false_if_7_main 
GETFP 2 SUB 0 SAVE 
:_exit_if_7_main 
GETFP 2 SUB LOAD SETRV GETFP SETSP SETFP 
GETRV 
1 
CMP _exit_if_6_main JEQ 
_true_if_6_main JMP 
:_true_if_6_main 
6664 _printInt CALL GETRV DROP 
_newLine CALL GETRV DROP 
:_exit_if_6_main 
GETFP SETSP SETFP 
0 SETRV __main JMP 
:__main 
GETFP SETSP SETFP 
JMP 


