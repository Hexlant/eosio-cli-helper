#!/bin/bash

default_line_fetch=50
target_dir="$(pwd)/nodeos/log"

last=$(ls -Ft "$target_dir" | grep -v '[/=|]$' | head -1)

echo ${#last}

if [ ${#last} -eq 0 ]; then
    echo "No file!"
    exit
fi

echo "$target_dir/$last"

tail -f -n $default_line_fetch "$target_dir/$last"
