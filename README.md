# Why
Instead of downloading `TexMaker`/`TexLife`/..., getting frustated with the installation, learning all the words needed to install fonts for `latex`, cluttering your precious filesystem with GBs of latex-specific data you don't understand, you can just do the steps below and you have a working machine to compile a [TUD Design](http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/)-documents in an instant (not really, it has to download a lot of stuff at the beginning, but you'd have to install a lot of stuff anyway, so... "Einen Tod muss man sterben").


## Instructions

### Installation
Install [Docker](https://www.docker.com/)
```shell
./download-design.sh # or from here: http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/andere.html#andere
./build.sh
```

### Generate pdf
```shell
./run.sh bash
# This will open a bash terminal in the docker container.
# It will also mount this folder to "/workspace" in the docker container.
# So this readme here will be under "/workspace/README.md".
# The command to start compiling the latex is:
pdflatex --interaction=nonstopmode FILE.tex
```

## Acknowledgment
The base docker image is [narf/latex](https://hub.docker.com/r/narf/latex/).
