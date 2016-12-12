#!/usr/bin/env bash
# From: https://raw.githubusercontent.com/natlownes/docker-latex/master/process.bash

cd /tmp

jobname=`uuidgen`

cat /dev/fd/0>/tmp/$jobname.latex

pdflatex --interaction=nonstopmode /tmp/$jobname.latex &>/dev/null
# Two time to add table of contents
pdflatex --interaction=nonstopmode /tmp/$jobname.latex &>/dev/null

cat /tmp/$jobname.pdf
