SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source $SCRIPT_DIR/.env

function curl_pushbullet {
    curl --header 'Content-Type: application/json' -u $PUSHBULLET_TOKEN: "https://api.pushbullet.com/v2/$@"
} 


if [[ "$#" -ne "2" ]] 
then 
    echo "Please give Title & Body for the message"
    exit 3
fi

curl_pushbullet pushes  --data-binary "{\"type\": \"note\", \"title\": \"$1\", \"body\": \"$2\"}"
