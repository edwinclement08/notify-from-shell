#!/bin/bash
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source $SCRIPT_DIR/.env

function curl_discord {
    curl --location --request POST "$DISCORD_URL" \
         --header 'Content-Type: application/json' \
        --data-raw "{ \"content\": \"$@\" }"
} 


if [[ "$#" -eq "3" ]] 
then 	
	source $SCRIPT_DIR/.env-$1 
	curl_discord "**$2**\\n$3"
elif [[ "$#" -eq "2" ]]  
then
	curl_discord "**$1**\\n$2"
else
	echo "Please give Title & Body for the message"
	exit 3
fi

