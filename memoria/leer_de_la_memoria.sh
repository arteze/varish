#!/bin/bash

s="$(cat -)"
nombre="$(echo "$s" | head -n 1)"
echo $nombre
echo ""
salida=""
ls "/dev/shm/$nombre"* | while read fila; do
    printf "$fila" | cut -d "/" -f 4 | cut -d "_" -f 3-  | while read fila2; do
        printf "$fila2\n" | sed "s/_/\n/g"| while read fila3; do
            printf "\x$(printf "%x" $(printf "$fila3 " | sed -r "s/^0+//g"))"
        done
    done
done
