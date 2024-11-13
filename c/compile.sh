#!/bin/bash
for i in $(ls -d */ | sed 's|[/]||g')
do
    gcc -Wall -pedantic $i/src/*.c -o $i.out -lm
done
