#!/usr/bin/env bash
#You need to have aws-cli installed and configured
#Credits to Reddit user u/aa93 for the suggestions

mkdir code
aws lambda list-functions | \
grep FunctionName | \
cut -d '"' -f4 | \
while read -r name; do
    aws lambda get-function --function-name $name | jq -r '.Code.Location' | xargs wget -O ./code/$name.zip
done