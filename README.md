# Why
Instead of downloading `TexMaker`/`TexLive`/..., getting frustated with the installation, learning all the words needed to install fonts for `latex`, cluttering your precious filesystem with GBs of latex-specific data you don't understand, you can just do the steps below and you have a working machine to compile [TUD Design](http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/)-LaTeX-documents in an instant (not really, it has to download a lot of stuff at the beginning, but you'd have to install a lot of stuff anyway, so... "Einen Tod muss man sterben").

**Remark:** If you use `LaTeX` and the TUD Design a lot, you should probably install `LaTeX` on your own machine instead of using this `Docker`-image. This way you can have live-preview and all the other nice features.

## Instructions

### Installation
Install [Docker](https://www.docker.com/)
```shell
# Download the design
# You can also download it manually from:
# http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/andere.html#andere)
./scripts/host/download-design.sh
# Build the container
# (Unfortunately the image has to be built because the TUD design is not public - so I can't upload it)
./scripts/host/build.sh
# This takes a while, it downloads all the neccessary stuff and creates an docker image
```

### Generate pdf
```shell
# Put your FILE.tex file that you want to compile into the "workspace" folder

# Open a terminal in the docker container (HOST):
./scripts/host/terminal.sh
# (This will mount the "workspace" folder in this repo to "/workspace" in the docker container)

# Now change to the workspace inside the docker container
cd /workspace

# The command to start compiling the latex is:
pdflatex --interaction=nonstopmode FILE.tex
# Twice to update the ToC (why? I really don't know or care)
pdflatex --interaction=nonstopmode FILE.tex
# Now your pdf is in the same folder (in the "workspace" folder on your host/container)
# (There are a lot of other files in the same folder as well (FILE.log, FILE.aux, ...))

# If you want to watch the tex-file, so it recompiles on change, you can do this
/watch-and-compile FILE.tex
# or
/watch-and-compile /workspace/FILE.tex
# (This also recompiles when files in the folder of the tex-file are changed)
```
or
```shell
./scripts/host/compile.sh FILE.tex FILE.pdf
# FILE.pdf is the generated PDF
# (you can't see the logs and so on with this approach)
```

Congratulations! You successfully downloaded a lot of stuff and used _cutting-edge_ technology to generate a PDF that looks like the CI of your university. Talk about wasting resources :smile:

## Acknowledgment
The base docker image and the `scripts/container/compile.sh` script in particular are from [narf/latex](https://hub.docker.com/r/narf/latex/).
