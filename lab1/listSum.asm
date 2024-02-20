main CALL
HALT

:main                   ; ret
GETSP SETFP             ; ret
                        ; регистр FP теперь указывает на адрес возврата
read_int CALL           ; ret N
DUP                     ; ret N N
PUSHN                   ; ret N x0 ... xN-1
0                       ; ret N x0 ... xN-1 0

; Регистр FP указывает на слово, где лежит адрес возврата ret.
; Стек растёт в сторону младших адресов. Адрес слова, где лежит
; N --- FP-1, где лежит x0 --- FP-2, xi --- FP-2-i,
; FP-1-N, счётчик цикла i --- FP-2-N. Но счётчик лежит на вершине
; стека, поэтому к нему мы можем обращаться непосредственно.

:main_read_loop         ; ret N x0 ... xN-1 i
DUP                     ; ret N x0 ... xN-1 i i
GETFP 1 SUB LOAD        ; ret N x0 ... xN-1 i i N
CMP main_read_loop_exit JEQ
                        ; ret N x0 ... xN-1 i
; IN DROP                 ; пропускаем пробел
read_int CALL           ; ret N x0 ... xN-1 i xi
OVER                    ; ret N x0 ... xN-1 i xi i
GETFP 2 SUB             ; ret N x0 ... xN-1 i xi i &x0
SWAP SUB SWAP           ; ret N x0 ... xN-1 i &xi xi
SAVE                    ; ret N x0 ... xN-1 i
1 ADD                   ; ret N x0 ... xN-1 i+1
main_read_loop 0 RETN

:main_read_loop_exit    ; ret N x0 ... xN-1 N=i
DROP                    ; ret N x0 ... xN-1
0 0                     ; ret N x0 ... xN-1 0 0

:main_sum_loop          ; ret N x0 ... xN-1 sum i
DUP                     ; ret N x0 ... xN-1 sum i i
GETFP 1 SUB LOAD        ; ret N x0 ... xN-1 sum i i N
CMP main_sum_loop_exit JEQ
                        ; ret N x0 ... xN-1 sum i
GETFP 2 SUB             ; ret N x0 ... xN-1 sum i &x0
OVER SUB                ; ret N x0 ... xN-1 sum i &xi
LOAD                    ; ret N x0 ... xN-1 sum i xi
ROT                     ; ret N x0 ... xN-1 i xi sum
ADD                     ; ret N x0 ... xN-1 i sum+xi
SWAP 1 ADD              ; ret N x0 ... xN-1 sum+xi i+1
main_sum_loop 0 RETN

:main_sum_loop_exit     ; ret N x0 ... xN-1 sum N=i
GETFP 1 SUB             ; ret N x0 ... xN-1 sum N=i &N
                        ;     ^---------------------/
ROT                     ; ret N x0 ... xN-1 N &N sum
                        ;     ^---------------/
SAVE                    ; ret sum x0 ... xN-1 N
DROPN                   ; ret sum
write_int CALL          ; ret
0 SWAP 0 RETN           ; 0


:read_int               ; ret
0                       ; ret 0

:read_int_loop          ; ret x
IN DUP                  ; ret x c c
48                      ; ret x c c 48
CMP                     ; ret x c sgn
read_int_exit JLT
DUP 57 CMP              ; ret x c sgn
read_int_exit JGT
48 SUB                  ; ret x d=(c-'0')
SWAP                    ; ret d x
10 MUL                  ; ret d x*10
ADD                     ; ret x*10+d
read_int_loop 0 RETN

:read_int_exit          ; ret x c
DROP SWAP               ; x ret
0 RETN                  ; x


:write_int              ; x ret
SWAP                    ; ret x
DUP 10 MOD              ; ret x x%10
SWAP 10 DIV             ; ret x%10 x/10
DUP                     ; ret x%10 x/10 x/10
write_int_skip_prefix JEQ
                        ; ret x%10 x/10
write_int CALL          ; ret x%10
100500                  ; ret x%10 100500

:write_int_skip_prefix
                        ; ret x%10 ?
DROP                    ; ret x%10
48 ADD OUT              ; ret
0 RETN                  ; пусто
