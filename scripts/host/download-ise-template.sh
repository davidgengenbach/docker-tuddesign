#!/usr/bin/env sh

TEMPLATE_URL="http://www.ise.tu-darmstadt.de/media/ise/permanente_downloads/ISE_Latex-Vorlage_V1.zip"
FILENAME="ISE_Latex-Vorlage.zip"

wget -O "$FILENAME" "$TEMPLATE_URL"
unzip -d "workspace/" -o "$FILENAME"
rm -r "$FILENAME"
