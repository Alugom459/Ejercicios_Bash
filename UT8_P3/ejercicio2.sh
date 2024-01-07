#!/bin/bash
find / -type f -perm -007 -exec readlink -f {} \; > archivos_peligrosos.txt
