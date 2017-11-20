#!/bin/bash

if [ $# -eq 0 ]; then
	cat README.md
	exit 0
fi

if [ "$1" == "-d" ]; then
	file=$2
	arg=${@:3:20}
	debug="valgrind"
else
	file=$1
	arg=${@:2:20}
	debug=""
fi

obj="$(echo $file | cut -d'.' -f 1 ).o"

nasm -f elf $file && ld -m elf_i386 $obj -o a.out && $debug ./a.out $arg

ret=$?
rm -f $obj a.out
exit $ret
