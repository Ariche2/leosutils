#!/bin/bash

for i in `seq 1 $1`; do
    time "${@:2}"
done 2>&1 |\
    grep ^real |\
    sed -r -e "s/.*real\t([[:digit:]]+)m([[:digit:]]+\.[[:digit:]]+)s/\1 \2/" |\
    awk '{sum += $1 * 60 + $2} END {print sum / NR}'
