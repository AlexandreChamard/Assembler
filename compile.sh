#!/bin/bash

if [ $# -eq 0 ]; then
	cat README.md
	exit 0
fi

name="a.out"
flag_name_active=0
obj=""

for i in $@; do
	if [ $i == '-o' ]; then
		flag_name_active=1
		continue
	fi

	if [ $flag_name_active -eq 1 ]; then
		name=$i
		flag_name_active=0
		continue
	fi

	nasm -f elf $i
	obj="$obj $(echo $i | cut -d'.' -f 1 ).o"
done

ld -m elf_i386 $obj -o $name
rm $obj
