#!/usr/bin/env bash

set -e

input=${1:-Please specify a uri.}

echo "$input" \
  | sed "s#[?&]#\n#g" \
  | sed 's#=# = #g'
