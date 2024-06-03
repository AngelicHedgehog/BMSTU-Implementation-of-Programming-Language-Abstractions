iverilog -o output int.v
if [ $? -eq 0 ]; then
    vvp output
    rm output
fi
