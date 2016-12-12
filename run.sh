#!/usr/bin/env sh

CMD="$1"

docker run -it -v $(pwd):/workspace tudlatex "$CMD"