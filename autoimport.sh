#!/bin/bash

# auto login
if [ -f autologin.sh ]; then
    ./autologin.sh
fi

# auto import dataset
find ./data -type f -iname "*.txt" -print0 | while IFS= read -r -d $'\0' line; do
    CONT=$(cat $line)
    ./bin/catswords-cli --message "$CONT" --network-id binance_safu
done
