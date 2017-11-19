#!/bin/bash

if [ $# -eq 0 ];then
	cat README.md
	exit 0
fi

obj="$(echo $1 | cut -d'.' -f 1 ).o"

nasm -f elf $1 && ld -m elf_i386 $obj -o a.out ; rm -f $obj
