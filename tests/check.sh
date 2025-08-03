#!/bin/sh

TESTS="lia swp tad"
DIR=`dirname "$0"`
MACRO1="../macro1d"

result=0

fail() {
    result="1"
    echo "FAIL: $1"
}

check() {
    echo "Checking: $1"
    cp "$1.lst" "tmp.lst"
    "$MACRO1" "$1.mac"
    cmp "$1.lst" "tmp.lst" || fail "$1"
    rm -f "tmp.lst"
}

cd "$DIR"
for i in $TESTS; do
    check "$i"
done

test "$result" = "0" && echo "PASSED"

exit "$result"
