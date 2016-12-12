#!/usr/bin/env sh

echo "CAUTION: You have to be in the university network (by vpn or wlan) to downlaod the design!"
echo

cleanup() {
    rm -rf tmp
}

FONT_URL="http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/latex/tudfonts-tex/tudfonts-tex_0.0.20090806.zip"
DESIGN_URL="http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/latex/latex-tuddesign/latex-tuddesign_1.0.20140928.zip"

FONT_FILE="tmp/font.zip"
DESIGN_FILE="tmp/design.zip"
mkdir -p tmp

echo "Downloading..."
echo
wget -O "$FONT_FILE" "$FONT_URL"
wget -O "$DESIGN_FILE" "$DESIGN_URL"

mkdir -p tuddesign

unzip -o "$FONT_FILE" -d tuddesign/fonts || cleanup
unzip -o "$DESIGN_FILE" -d tuddesign/design || cleanup

cleanup

echo
echo "A lot of output for nothing ;)"
echo "fonts and design are now downloaded. Now you can build the docker image!"