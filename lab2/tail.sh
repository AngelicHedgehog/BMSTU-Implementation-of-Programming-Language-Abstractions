rlc.bat tail.ref -o a.exe
./a.exe -2 First.ref tail.ref tail.sh
echo "----------"
./a.exe First.ref tail.ref tail.sh
rm a.exe
