#!/usr/bin/env sh

DIR_DESIGN="tuddesign/design/texmf"
DIR_FONTS="tuddesign/fonts/texmf"

exit_if_folder_nonexistent() {
    FOLDER=$1
    printf "Checking for folder: $FOLDER..."
    if [ ! -d "$FOLDER" ]; then
        echo -e "\nNeeded folder: $FOLDER (please see README.md)"
        exit 1
    fi
    echo -e "\tOK"
}

exit_if_folder_nonexistent $DIR_DESIGN
exit_if_folder_nonexistent $DIR_FONTS

echo "Removing old docker image"
docker rmi --force tudlatex

echo "Building new docker image"
docker build . -t tudlatex