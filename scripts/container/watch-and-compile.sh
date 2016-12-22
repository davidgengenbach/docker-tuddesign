#!/usr/bin/env bash

FILE="$1"
FOLDER=$(dirname "${FILE}")

DELAY_BETWEEN_COMPILES=0.4

compile() {
    echo "---------------------------------"
    echo "Compiling file"
    pdflatex --interaction=nonstopmode $FILE &>/dev/null
    pdflatex --interaction=nonstopmode $FILE &>/dev/null
}

compile

while inotifywait -e modify "$FOLDER"; do
    compile
    sleep $DELAY_BETWEEN_COMPILES
done
