#!/bin/bash
curl -X POST --silent --insecure -u admin:W3lcome098! -H 'Content-Type: application/json' -d @https.json https://192.168.86.33/mgmt/shared/appsvcs/declare | jq
