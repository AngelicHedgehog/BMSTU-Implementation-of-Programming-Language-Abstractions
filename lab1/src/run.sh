iverilog -o output $1
if [ $? -eq 0 ]; then
    vvp output
    rm output
fi
