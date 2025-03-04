#!/bin/bash


if [[ $# -lt 1 || $# -gt 2 ]]; then
    echo "Usage: ./mean.sh <column> [file.csv]" 1>&2
    exit 1
fi
column=$1
file=${2:-/dev/stdin} 


if ! [[ "$column" =~ ^[0-9]+$ ]] || ! [[ "$column" -ge 1 ]]; then
    echo "Error: Column number must be a positive integer." 1>&2
    exit 1
fi


tail -n +2 "$file" | cut -d ',' -f "$column" | awk '
{
    sum += $1
    count += 1
}
END {
    if (count > 0) {
        print sum / count
    } else {
        print "Error: No valid data found." > "/dev/stderr"
        exit 1
    }
}'
