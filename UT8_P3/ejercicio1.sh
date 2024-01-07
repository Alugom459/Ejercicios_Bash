#!/bin/bash

last -i | awk '{print $1, $3}' | grep -E "([0-255]\.){3}[0-255]"

