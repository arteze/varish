#/bin/sh

echo "Argumento: $1"
nombre=$(basename $1)
ruta=$(dirname $1)
rutas="/lib64
/usr/lib64
/usr/lib/x86_64-linux-gnu"
ruta=""

rc=0

ruta_final="$(echo "$rutas" | while read ruta_actual;do
    if [[ "$ruta_actual" != "" ]];then
        if [[ "$(ls -v $ruta_actual/$nombre)" != "" ]];then
            echo "$ruta_actual"
            break
        fi
    fi
done)"

echo "Ruta final: $ruta_final"
if [[ "$ruta_final" != "" ]];then
    mkdir -p $(dirname $1)
    ln -svf $(readlink -vf $(ls $ruta_final/$nombre)) $1
else
    echo "Ruta no encontrada."
fi
