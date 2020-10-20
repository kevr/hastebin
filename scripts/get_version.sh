#!/bin/sh
git describe \
    | sed -r 's/-([0-9]+)-.*$/.\1/g' \
    | sed -r 's/^([0-9]+\.[0-9]+)$/\1.0/g' \
    2>/dev/null
