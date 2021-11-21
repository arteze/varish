#/bin/sh

ruta=/tmp/paquete
mkdir -p $ruta
tar -C $ruta -v -xf $1
cp -vrf $ruta/* /
rm -vrf $ruta/*
[[ "$2" == ""  ]] && gxmessage -print "Se instaló $1" -center -borderless -sticky -timeout 2 -noescape -nofocus -ontop -buttons ""
