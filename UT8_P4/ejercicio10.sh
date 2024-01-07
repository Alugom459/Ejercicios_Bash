#!/bin/bash

dia_semana=$(date +%u)

fecha=$(date +%m_%d_%Y)

origen_home="/home"
origen_etc="/etc"
origen_root="/root"
destino_completa="/copia_seguridad/completa"
destino_incremental="/copia_seguridad_incremental/$fecha"

if [ $dia_semana -eq 7 ]; then
    tar -czvf "$destino_completa/home_etc_root_$fecha.tar.gz" "$origen_home" "$origen_etc" "$origen_root"
else
    tar -czvf "$destino_incremental/etc_$fecha.tar.gz" "$origen_etc"
fi

date +"%T" > "$destino_completa/fecha.txt"

