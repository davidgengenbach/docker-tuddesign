#!/usr/bin/env bash

TEX_IN_FILE=$1
PDF_OUT=$2
TAG="davidgengenbach/latex-tuddesign"

print_usage() {
    printf "Usage: $0 TEX_IN_FILE PDF_OUT\n"
    exit 1
}

check_parameter() {
    if [ "$1" == "" ]; then
        print_usage
    fi
}

check_parameter $TEX_IN_FILE
check_parameter $PDF_OUT

docker run --interactive $TAG /compile.sh < $TEX_IN_FILE > $PDF_OUT