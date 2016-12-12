#!/usr/bin/env sh

TAG="davidgengenbach/latex-tuddesign"
docker run -it -v $(pwd)/workspace:/workspace $TAG bash