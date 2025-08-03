#!/usr/bin/env bash

set -e

echo "[\$*]:"
for arg in $*; do
  echo "$arg"
done

echo "[\"\$*\"]:"
for arg in "$*"; do
  echo "$arg"
done

echo "[\$@]:"
for arg in $@; do
  echo "$arg"
done

echo "[\"\$@\"]:"
for arg in "$@"; do
  echo "$arg"
done
