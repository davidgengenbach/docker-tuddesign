FROM narf/latex
MAINTAINER David Gengenbach <davidgengenbach@gmx.de>

ADD tuddesign/design/ /tmp/tuddesign
ADD tuddesign/fonts/ /tmp/fonts

RUN cp -RT /tmp/tuddesign/texmf /usr/share/texmf
RUN cp -RT /tmp/fonts/texmf /usr/share/texmf

RUN texhash && texhash /usr/share/
RUN updmap-sys --enable Map 5ch.map
RUN updmap-sys --enable Map 5fp.map
RUN updmap-sys --enable Map 5sf.map

RUN apt-get update && \
    apt-get install -y texlive-lang-german

RUN apt-get update && \
    apt-get install -y texlive-bibtex-extra

RUN apt-get update && \
    apt-get install -y inotify-tools

COPY scripts/container/compile.sh /
RUN chmod +x /compile.sh

COPY scripts/container/watch-and-compile.sh /
RUN chmod +x /watch-and-compile.sh

ENTRYPOINT []