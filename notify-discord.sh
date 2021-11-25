#!/bin/bash
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source $SCRIPT_DIR/.env

function curl_discord {
    curl --location --request POST "$DISCORD_URL" \
         --header 'Content-Type: application/json' \
        --data-raw "{ \"content\": \"$@\" }"
} 


if [[ "$#" -ne "2" ]] 
then 
    echo "Please give Title & Body for the message"
    exit 3
fi

curl_discord "**$1**\\n$2"
