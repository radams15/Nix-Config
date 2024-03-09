FROM fedora:latest

RUN dnf in -y texlive texlive-perltex make

RUN dnf in -y texlive-svg texlive-lastpage texlive-exsheets

RUN dnf in -y  julietaula-montserrat-fonts

RUN dnf in -y texlive-mwe texlive-textpos texlive-minted

RUN echo 'xelatex -shell-escape $@' > /bin/shell_xelatex && chmod +x /bin/shell_xelatex

RUN dnf in -y python3-pygments which

RUN dnf in -y texlive-tikzpagenodes texlive-appendix

WORKDIR /wdir

ENTRYPOINT ["make"]
