GETSP _MEMORY_SIZE SWAP SAVE 
_main CALL 
GETRV HALT 
:_MEMORY_SIZE 0 
:_PROGRAM_SIZE PROGRAM_SIZE 

:_inc__ 
GETFP GETSP SETFP 
GETFP 2 ADD LOAD GETFP 2 ADD LOAD LOAD 1 ADD SAVE 
:__inc__ 
GETFP SETSP SETFP 
1 RETN 

:_dec__ 
GETFP GETSP SETFP 
GETFP 2 ADD LOAD GETFP 2 ADD LOAD LOAD 1 SUB SAVE 
:__dec__ 
GETFP SETSP SETFP 
1 RETN 

:_heap_order__ 
3 

:_heap_start__ 
0 

:_getHeapBlock__ 
GETFP GETSP SETFP 
_PROGRAM_SIZE LOAD GETFP 2 ADD LOAD 3 SUB ADD SETRV __getHeapBlock__ JMP 
:__getHeapBlock__ 
GETFP SETSP SETFP 
1 RETN 

:_getNextBlock__ 
GETFP GETSP SETFP 
GETFP 2 ADD LOAD 1 ADD LOAD SETRV __getNextBlock__ JMP 
:__getNextBlock__ 
GETFP SETSP SETFP 
1 RETN 

:_unlinkBlock__ 
GETFP GETSP SETFP 
2 PUSHN 
GETFP 1 SUB GETFP 2 ADD LOAD LOAD SAVE 
GETFP 2 SUB GETFP 2 ADD LOAD 1 ADD LOAD SAVE 
GETFP 1 SUB LOAD 
0 
CMP _true_if_0_unlinkBlock__ JNE 
_false_if_0_unlinkBlock__ JMP 
:_true_if_0_unlinkBlock__ 
GETFP 1 SUB LOAD 1 ADD GETFP 2 SUB LOAD SAVE 
_exit_if_0_unlinkBlock__ JMP 
:_false_if_0_unlinkBlock__ 
GETFP 2 ADD LOAD 2 ADD LOAD _getHeapBlock__ CALL GETRV GETFP 2 SUB LOAD SAVE 
:_exit_if_0_unlinkBlock__ 
GETFP 2 SUB LOAD 
0 
CMP _true_if_1_unlinkBlock__ JNE 
_exit_if_1_unlinkBlock__ JMP 
:_true_if_1_unlinkBlock__ 
GETFP 2 SUB LOAD GETFP 1 SUB LOAD SAVE 
:_exit_if_1_unlinkBlock__ 
GETFP 2 ADD LOAD 3 ADD 1 SAVE 
:__unlinkBlock__ 
GETFP SETSP SETFP 
1 RETN 

:_linkBlocks__ 
GETFP GETSP SETFP 
GETFP 2 ADD LOAD 
0 
CMP _true_if_0_linkBlocks__ JNE 
_exit_if_0_linkBlocks__ JMP 
:_true_if_0_linkBlocks__ 
GETFP 2 ADD LOAD 1 ADD GETFP 3 ADD LOAD SAVE 
:_exit_if_0_linkBlocks__ 
GETFP 3 ADD LOAD 
0 
CMP _true_if_1_linkBlocks__ JNE 
_exit_if_1_linkBlocks__ JMP 
:_true_if_1_linkBlocks__ 
GETFP 3 ADD LOAD GETFP 2 ADD LOAD SAVE 
:_exit_if_1_linkBlocks__ 
:__linkBlocks__ 
GETFP SETSP SETFP 
2 RETN 

:_insertBlock__ 
GETFP GETSP SETFP 
1 PUSHN 
GETFP 1 SUB GETFP 2 ADD LOAD 2 ADD LOAD _getHeapBlock__ CALL GETRV SAVE 
GETFP 1 SUB LOAD LOAD GETFP 2 ADD LOAD _linkBlocks__ CALL GETRV DROP 
GETFP 2 ADD LOAD 0 SAVE 
GETFP 2 ADD LOAD 3 ADD 0 SAVE 
GETFP 2 ADD LOAD 4 ADD 0 SAVE 
GETFP 1 SUB LOAD GETFP 2 ADD LOAD SAVE 
:__insertBlock__ 
GETFP SETSP SETFP 
1 RETN 

:_splitBlock__ 
GETFP GETSP SETFP 
3 PUSHN 
GETFP 2 ADD LOAD _unlinkBlock__ CALL GETRV DROP 
GETFP 1 SUB GETFP 2 ADD LOAD 2 ADD LOAD 1 SUB SAVE 
GETFP 2 SUB GETFP 2 ADD LOAD 1 GETFP 1 SUB LOAD LSHIFT ADD SAVE 
GETFP 2 ADD LOAD 2 ADD GETFP 1 SUB LOAD SAVE 
GETFP 2 SUB LOAD 2 ADD GETFP 1 SUB LOAD SAVE 
GETFP 2 SUB LOAD _insertBlock__ CALL GETRV DROP 
GETFP 2 ADD LOAD _insertBlock__ CALL GETRV DROP 
:__splitBlock__ 
GETFP SETSP SETFP 
1 RETN 

:_unionBlock__ 
GETFP GETSP SETFP 
1 PUSHN 
GETFP 2 ADD LOAD 3 ADD LOAD 
1 
CMP _true_if_0_unionBlock__ JEQ 
_exit_if_0_unionBlock__ JMP 
:_true_if_0_unionBlock__ 
0 SETRV __unionBlock__ JMP 
:_exit_if_0_unionBlock__ 
GETFP 2 ADD LOAD _heap_start__ LOAD SUB 1 GETFP 2 ADD LOAD 2 ADD LOAD LSHIFT BITAND 
0 
CMP _true_if_1_unionBlock__ JEQ 
_false_if_1_unionBlock__ JMP 
:_true_if_1_unionBlock__ 
GETFP 1 SUB GETFP 2 ADD LOAD 1 GETFP 2 ADD LOAD 2 ADD LOAD LSHIFT ADD SAVE 
_exit_if_1_unionBlock__ JMP 
:_false_if_1_unionBlock__ 
GETFP 1 SUB GETFP 2 ADD LOAD SAVE 
GETFP 2 ADD GETFP 2 ADD LOAD 1 GETFP 2 ADD LOAD 2 ADD LOAD LSHIFT SUB SAVE 
:_exit_if_1_unionBlock__ 
GETFP 1 SUB LOAD 3 ADD LOAD 
1 
CMP _true_if_2_unionBlock__ JEQ 
_bool_0_unionBlock__ JMP 
:_bool_0_unionBlock__ 
GETFP 2 ADD LOAD 2 ADD LOAD 
GETFP 1 SUB LOAD 2 ADD LOAD 
CMP _true_if_2_unionBlock__ JNE 
_exit_if_2_unionBlock__ JMP 

:_true_if_2_unionBlock__ 
0 SETRV __unionBlock__ JMP 
:_exit_if_2_unionBlock__ 
GETFP 2 ADD LOAD _unlinkBlock__ CALL GETRV DROP 
GETFP 1 SUB LOAD _unlinkBlock__ CALL GETRV DROP 
GETFP 2 ADD LOAD 2 ADD _inc__ CALL GETRV DROP 
GETFP 2 ADD LOAD _insertBlock__ CALL GETRV DROP 
GETFP 2 ADD LOAD _unionBlock__ CALL GETRV DROP 
:__unionBlock__ 
GETFP SETSP SETFP 
1 RETN 

:_allocBlock__ 
GETFP GETSP SETFP 
3 PUSHN 
GETFP 1 SUB 2 SAVE 
:_loop_while_0_allocBlock__ 
GETFP 2 ADD LOAD 
1 GETFP 1 SUB LOAD LSHIFT 4 SUB 
CMP _true_while_0_allocBlock__ JGT 
_exit_while_0_allocBlock__ JMP 
:_true_while_0_allocBlock__ 
GETFP 1 SUB _inc__ CALL GETRV DROP 
_loop_while_0_allocBlock__ JMP 
:_exit_while_0_allocBlock__ 
GETFP 2 SUB GETFP 1 SUB LOAD SAVE 
:_loop_while_1_allocBlock__ 
GETFP 2 SUB LOAD _getHeapBlock__ CALL GETRV LOAD 
0 
CMP _true_while_1_allocBlock__ JEQ 
_exit_while_1_allocBlock__ JMP 
:_true_while_1_allocBlock__ 
GETFP 2 SUB _inc__ CALL GETRV DROP 
GETFP 2 SUB LOAD 
_heap_order__ LOAD 
CMP _true_if_0_allocBlock__ JGT 
_exit_if_0_allocBlock__ JMP 
:_true_if_0_allocBlock__ 
0 SETRV __allocBlock__ JMP 
:_exit_if_0_allocBlock__ 
_loop_while_1_allocBlock__ JMP 
:_exit_while_1_allocBlock__ 
:_loop_while_2_allocBlock__ 
GETFP 2 SUB LOAD 
GETFP 1 SUB LOAD 
CMP _true_while_2_allocBlock__ JNE 
_exit_while_2_allocBlock__ JMP 
:_true_while_2_allocBlock__ 
GETFP 2 SUB LOAD _getHeapBlock__ CALL GETRV LOAD _splitBlock__ CALL GETRV DROP 
GETFP 2 SUB _dec__ CALL GETRV DROP 
_loop_while_2_allocBlock__ JMP 
:_exit_while_2_allocBlock__ 
GETFP 3 SUB GETFP 1 SUB LOAD _getHeapBlock__ CALL GETRV LOAD SAVE 
GETFP 3 SUB LOAD _unlinkBlock__ CALL GETRV DROP 
GETFP 3 SUB LOAD 5 ADD SETRV __allocBlock__ JMP 
:__allocBlock__ 
GETFP SETSP SETFP 
1 RETN 

:_deallocBlock__ 
GETFP GETSP SETFP 
GETFP 2 ADD GETFP 2 ADD LOAD 5 SUB SAVE 
GETFP 2 ADD LOAD _insertBlock__ CALL GETRV DROP 
GETFP 2 ADD LOAD _unionBlock__ CALL GETRV DROP 
:__deallocBlock__ 
GETFP SETSP SETFP 
1 RETN 

:_out__ 
GETFP GETSP SETFP 
GETFP 2 ADD LOAD OUT 
:__out__ 
GETFP SETSP SETFP 
1 RETN 

:_printInt__ 
GETFP GETSP SETFP 
GETFP 2 ADD LOAD 
10 
CMP _true_if_0_printInt__ JGE 
_exit_if_0_printInt__ JMP 
:_true_if_0_printInt__ 
GETFP 2 ADD LOAD 10 DIV _printInt__ CALL GETRV DROP 
:_exit_if_0_printInt__ 
GETFP 2 ADD LOAD 10 MOD 48 ADD _out__ CALL GETRV DROP 
:__printInt__ 
GETFP SETSP SETFP 
1 RETN 

:_newLine__ 
GETFP GETSP SETFP 
10 _out__ CALL GETRV DROP 
:__newLine__ 
GETFP SETSP SETFP 
JMP 

:_space__ 
GETFP GETSP SETFP 
32 _out__ CALL GETRV DROP 
:__space__ 
GETFP SETSP SETFP 
JMP 

:_printHeap__ 
GETFP GETSP SETFP 
GETFP GETSP SETFP 
1 PUSHN 
GETFP 1 SUB 3 SAVE 
:_loop_while_0_printHeap__ 
GETFP 1 SUB LOAD 
_heap_order__ LOAD 
CMP _true_while_0_printHeap__ JLE 
_exit_while_0_printHeap__ JMP 
:_true_while_0_printHeap__ 
GETFP GETSP SETFP 
2 PUSHN 
GETFP 2 SUB 0 SAVE 
GETFP 1 SUB GETFP LOAD 1 SUB LOAD _getHeapBlock__ CALL GETRV LOAD SAVE 
:_loop_while_1_printHeap__ 
GETFP 1 SUB LOAD 
0 
CMP _true_while_1_printHeap__ JNE 
_exit_while_1_printHeap__ JMP 
:_true_while_1_printHeap__ 
GETFP 2 SUB _inc__ CALL GETRV DROP 
GETFP 1 SUB GETFP 1 SUB LOAD _getNextBlock__ CALL GETRV SAVE 
_loop_while_1_printHeap__ JMP 
:_exit_while_1_printHeap__ 
GETFP 2 SUB LOAD _printInt__ CALL GETRV DROP 
_space__ CALL GETRV DROP 
GETFP SETSP SETFP 
GETFP 1 SUB _inc__ CALL GETRV DROP 
_loop_while_0_printHeap__ JMP 
:_exit_while_0_printHeap__ 
_newLine__ CALL GETRV DROP 
GETFP SETSP SETFP 
:__printHeap__ 
GETFP SETSP SETFP 
JMP 

:_main 
GETFP GETSP SETFP 
GETFP GETSP SETFP 
2 PUSHN 
GETFP 1 SUB 1 3 LSHIFT SAVE 
GETFP 2 SUB _MEMORY_SIZE LOAD _PROGRAM_SIZE LOAD 64 ADD SUB SAVE 
_heap_order__ LOAD _getHeapBlock__ CALL GETRV 0 SAVE 
:_loop_while_0_main 
GETFP 1 SUB LOAD 
GETFP 2 SUB LOAD 
CMP _true_while_0_main JLE 
_exit_while_0_main JMP 
:_true_while_0_main 
_heap_order__ LOAD _getHeapBlock__ CALL GETRV 0 SAVE 
_heap_order__ _inc__ CALL GETRV DROP 
GETFP 1 SUB GETFP 1 SUB LOAD 1 LSHIFT SAVE 
_loop_while_0_main JMP 
:_exit_while_0_main 
_heap_order__ _dec__ CALL GETRV DROP 
GETFP SETSP SETFP 
_heap_start__ _heap_order__ LOAD _getHeapBlock__ CALL GETRV 1 ADD SAVE 
_heap_start__ LOAD 2 ADD _heap_order__ LOAD SAVE 
_heap_start__ LOAD _insertBlock__ CALL GETRV DROP 
GETFP GETSP SETFP 
3 PUSHN 
_printHeap__ CALL GETRV DROP 
GETFP 2 SUB 500 _allocBlock__ CALL GETRV SAVE 
_printHeap__ CALL GETRV DROP 
GETFP 3 SUB 25 _allocBlock__ CALL GETRV SAVE 
_printHeap__ CALL GETRV DROP 
GETFP 1 SUB 5 _allocBlock__ CALL GETRV SAVE 
_printHeap__ CALL GETRV DROP 
GETFP 2 SUB LOAD _deallocBlock__ CALL GETRV DROP 
_printHeap__ CALL GETRV DROP 
GETFP 3 SUB LOAD _deallocBlock__ CALL GETRV DROP 
_printHeap__ CALL GETRV DROP 
GETFP 1 SUB LOAD _deallocBlock__ CALL GETRV DROP 
_printHeap__ CALL GETRV DROP 
GETFP SETSP SETFP 
0 SETRV __main JMP 
:__main 
GETFP SETSP SETFP 
JMP 


