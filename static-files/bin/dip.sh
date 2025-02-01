#!/usr/bin/env bash

set -e

output=$(docker ps | grep -v CONTAINER)

while IFS= read -r line; do
  id=$(echo "$line" | cut -d' ' -f 1)
  image=$(echo "$line" | tr -s ' ' | cut -d' ' -f 2)
  ip=$(docker inspect $id | gron | grep "IPAddress" | grep "Networks" | cut -d'"' -f2)
  name=$(echo "$line" | tr -s ' ' | rev | cut -d ' ' -f 1 | rev)

  echo "$id: $ip - $name - $image"
done <<< "$output"

#printf "$output"
