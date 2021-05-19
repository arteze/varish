#!/bin/bash

datos="$(cat -)"
nombre="$(echo "$datos" | head -n 1)"
datos="$(printf "$datos" | tail -n +2 )"
echo "Nombre: " $nombre
echo "Datos: " $datos
echo ""
i=0
echo $datos | hexdump -v -e '25/1 "%03i " "\n"' | while read fila; do
    o="$(echo $nombre $i $fila|tr " " "_")"
    echo $o
    echo $o > "/dev/shm/$o"
    i=$((i+1))
done
echo ""
ls /dev/shm/$nombre
