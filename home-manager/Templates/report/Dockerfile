FROM fedora:latest

RUN dnf in -y texlive texlive-perltex make

WORKDIR /wdir

ENTRYPOINT ["make"]