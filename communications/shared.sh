#!/bin/sh

gcc shared.c -o shared.o

for i in 1000 10000 100000 1000000 10000000 100000000 1000000000; do
	time ./shared.o $i
	if [[ $? = 0 ]]; then
		ipcrm -M 0x6060
	fi
echo " "
done