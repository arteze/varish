#!/bin/sh

# Reemplaza tabuladores por cuatro espacios.

function reemplazar_tabuladores_por_cuatro_espacios(){
  cat - | sed "s/\x9/    /g"
}

# buscar archivos rotos

function buscar_archivos_rotos(){
  cd "/b/" # Elegir una ruta preferida
  lista_archivos="$(find . -type f)"
  echo "$lista_archivos" | while read archivo;do
    roto="$(hexdump -n1 "$archivo" | grep "0000000 000")"
    if [[ $roto != "" ]];then
      echo "$archivo"
    fi
  done
}
