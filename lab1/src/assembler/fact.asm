main CALL
HALT


:main           ; ret
read_int CALL   ; ret x
factorial CALL  ; ret x!
write_int CALL  ; ret
0 SWAP          ; 0 ret
0 RETN          ; 0


:read_int       ; ret
0               ; ret 0

:read_int_loop  ; ret x
IN DUP          ; ret x c c
48              ; ret x c c 48
CMP             ; ret x c sgn
read_int_exit JLT
DUP 57 CMP      ; ret x c sgn
read_int_exit JGT
48 SUB          ; ret x d=(c-'0')
SWAP            ; ret d x
10 MUL          ; ret d x*10
ADD             ; ret x*10+d
read_int_loop 0 RETN

:read_int_exit  ; ret x c
DROP SWAP       ; x ret
0 RETN          ; x


:factorial      ; n ret
SWAP            ; ret n
DUP factorial_non_zero JNE
DROP 1 SWAP     ; 1 ret
0 RETN          ; 1


:factorial_non_zero
DUP 1 SUB       ; ret n (n-1)
factorial CALL  ; ret n (n-1)!
MUL SWAP        ; n*(n-1)! ret
0 RETN          ; n*(n-1)!


:write_int      ; x ret
SWAP            ; ret x
DUP 10 MOD      ; ret x x%10
SWAP 10 DIV     ; ret x%10 x/10
DUP             ; ret x%10 x/10 x/10
write_int_skip_prefix JEQ
                ; ret x%10 x/10
write_int CALL  ; ret x%10
100500          ; ret x%10 100500

:write_int_skip_prefix
                ; ret x%10 ?
DROP            ; ret x%10
48 ADD OUT      ; ret
0 RETN          ; пусто
