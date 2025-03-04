#!/bin/bash


cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -d',' -f7 | {
    sum=0
    count=0
    while read num; do
        sum=$((sum + num))
        count=$((count + 1))
    done
    if [[ $count -gt 0 ]]; then
        echo "Sum: $sum"
        echo "Average: $((sum / count))"
    fi
}
