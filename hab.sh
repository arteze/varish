#/bin/sh

# Hex a Raw
# Ejemplo: 
# $1 es entrada.txt > 7f454c460201010000000000000000000
# $2 es salida.txt

echo -ne "$(cat $1 | sed -e 's/../\\x&/g')" > $2
