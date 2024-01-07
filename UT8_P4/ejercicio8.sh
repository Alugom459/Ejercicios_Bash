#!/bin/bash
echo "$(date) $(who | cut -d' ' -f1 | sort -u | wc -l)" >> /tmp/usuarios
#Cron --> */2 * * * * /ruta/del/script/ej8.sh
