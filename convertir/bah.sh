#!/bin/sh

# Ejemplo de salida: 7f454c460201010000000000000000000

hexdump -ve '1/1 "%.2x"' $1
echo ""
