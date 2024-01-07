#!/bin/bash


directorio_origen="/etc"
directorio_destino="/root"

archivo_copia="${directorio_destino}/copia_etc_$(date +'%Y%m%d%H%M%S').tgz"

tar -czf "${archivo_copia}" -C "${directorio_origen}" .



