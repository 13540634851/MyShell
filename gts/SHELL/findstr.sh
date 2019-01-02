#!/bin/sh
echo "find -name '$1' -exec grep --color -n '$2' {} +"
find -name "$1" -exec grep --color -n "$2" {} +



