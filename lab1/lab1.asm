main CALL
HALT


:main                                       ; ret
    0 0                                     ; ret wordCount isWord
    :loop
        IN                                  ; ret wordCount isWord char

        DUP 10 CMP loop_exit JEQ            ; loop exit if 10 ('\n')
        DUP 13 CMP loop_exit JEQ            ; loop exit if 13 ('\r')

        DUP 32 CMP not_space JEQ            ; skip if ' '
        DUP 9 CMP not_space JEQ             ; skip if '\t'
        DUP 44 CMP not_space JEQ            ; skip if ','
        DUP 46 CMP not_space JEQ            ; skip if '.'
        DUP 59 CMP not_space JEQ            ; skip if ';'
        DUP 63 CMP not_space JEQ            ; skip if '?'
        DUP 33 CMP not_space JEQ            ; skip if '!'
            DROP                            ; ret wordCount isWord
            DUP 0 CMP not_first_char JNE    ; skip if char not first in wordCount
                DROP                        ; ret wordCount
                1 ADD                       ; ret wordCount+1
                1                           ; ret wordCount+1 isWord=1
            :not_first_char
                if_exit JMP
        :not_space
            2 DROPN                         ; ret wordCount
            0                               ; ret wordCount isWord=0
        :if_exit

        loop JMP
    :loop_exit                              ; ret wordCount isWord char
    2 DROPN                                 ; ret wordCount
    write_int CALL                          ; ret
    0 SWAP                                  ; 0 ret
    0 RETN                                  ; 0

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


