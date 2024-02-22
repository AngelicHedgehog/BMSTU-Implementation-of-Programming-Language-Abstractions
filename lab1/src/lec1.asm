; Напишем программу, которая считывает число
; и распечатывает кквадрат числа

ReadNumber CALL
;DUP MUL
WriteNumber CALL
0 HALT

:ReadNumber ; ... -> ... x
0                                   ; ret 0
:ReadNumber_NextChar                ; ret 0
ReadChar CALL                       ; 
DUP 48 CMP ReadNumber_Return JLT
DUP 57 CMP ReadNumber_Return JGT
48 SUB
SWAP 10 MUL ADD
ReadChar CALL DROP
ReadNumber_NextChar JMP
:ReadNumber_Return
SWAP JMP

:last_char 1 NEG                    ; ret -1

:PeekChar ; ... -> ... ch           ; ret
last_char LOAD                      ; ret 1
DUP PeekChar_Return JGE             ; ret 1 1
ReadChar CALL
:PeekChar_Return
SWAP JMP

:ReadChar ; ... -> ... ch
IN ;last_char OVER SAVE
SWAP JMP

:WriteNumber ; ... x -> ...
SWAP
DUP WriteNumber_Zero JEQ
DUP WriteNumber_Unsigned JGT
45 OUT NEG
:WriteNumber_Unsigned
WriteNumber_UnsignedRec CALL JMP
:WriteNumber_Zero
DROP 48 OUT JMP

:WriteNumber_UnsignedRec ; ... x -> ...
SWAP
DUP WriteNumber_UnsignedRec_Return JEQ
DUP 10 DIV WriteNumber_UnsignedRec CALL
10 MOD 48 ADD OUT JMP
:WriteNumber_UnsignedRec_Return
DROP JMP
