#!/usr/bin/env sh

TAG="davidgengenbach/latex-tuddesign"

docker run --interactive --tty --volume $(pwd)/workspace:/workspace $TAG bash