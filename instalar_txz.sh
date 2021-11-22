#/bin/sh

if [[ "$1" != "" ]];then
  ruta=/tmp/paquete
  nombre="$(basename "$1")"
  mkdir -p $ruta
  tar -C $ruta -v -xf $1
  mkdir "$ruta/$nombre"
  mv "$ruta/install/"* "$ruta/$nombre"
  mv "$ruta/$nombre" "$ruta/install"
  cp -vrf $ruta/* /
  rm -vrf $ruta/*
  [[ "$2" == ""  ]] && (
    gxmessage -print "Se instaló $1" -center -borderless -sticky -timeout 2 -noescape -nofocus -ontop -buttons ""
  )
else
  echo "No hay archivo"
fi
