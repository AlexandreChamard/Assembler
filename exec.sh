#!/bin/bash

if [ $# -eq 0 ];then
	cat README.md
	exit 0
fi

obj="$(echo $1 | cut -d'.' -f 1 ).o"

if [ "$2" ];then
	debug="valgrind"
fi

nasm -f elf $1 && ld -m elf_i386 $obj -o a.out && $debug ./a.out ; rm -f a.out
