for ref_file in $1/*.ref; do
    rlc.bat $ref_file -o a.exe
    ./a.exe
    rm a.exe
    echo
    echo
done
