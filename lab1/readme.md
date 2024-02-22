% Лабораторная работа № 1. Стековая виртуальная машина
% 22 февраля 2024 г.
% Сергей Виленский, ИУ9-62Б

# Цель работы
Целью данной работы является написание
интерпретатора ассемблера модельного
компьютера, который будет использоваться
в последующих лабораторных как целевой язык.

# Реализация

```asm
main CALL
HALT


:main                                       ; ret
    0 0                                     ; ret wordCount isWord
    :loop
        IN                                  ; ret wordCount isWord char

        DUP 10 CMP loop_exit JEQ            ; loop exit if '\n'
        DUP 13 CMP loop_exit JEQ            ; loop exit if '\r'

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
        :not_space                          ; ret wordCount isWord
            2 DROPN                         ; ret wordCount
            0                               ; ret wordCount isWord=0
        :if_exit                            ; ret wordCount isWord

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
```

# Тестирование

```
> iverilog -o lab1 lab1.vl
> vvp lab1
> 6 10 20 30 5 100 15  aA 1b  cAd,2eA.fj3;;hAi?g4k??lA!5mn  oA6 ?!!.pqrA!7stuA8vwxA9!yz
> 
> 20
```

# Вывод
В результате данной лабораторной работы
были обретены навыки написания
интерпретатора ассемблера модельного
компьютера, который будет использоваться
в последующих лабораторных как целевой язык,
а также написания программ на языке
модельного ассемблера.
