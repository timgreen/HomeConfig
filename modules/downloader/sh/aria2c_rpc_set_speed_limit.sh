#!/bin/bash

downloadLimit=$1
uploadLimit=$2
curl http://127.0.0.1:6800/jsonrpc -H "Content-Type: application/json" -H "Accept: application/json" --data '{"jsonrpc":"2.0","id":1,"method":"aria2.changeGlobalOption","params":[{"max-overall-download-limit":"'$downloadLimit'","max-overall-upload-limit":"'$uploadLimit'"}]}'

