PERLTEX?=perltex
SRC?=src
MAIN?=src/main.tex
OUT?=doc.pdf
IMAGE?=tex
DOCKER?=podman

all: doc.pdf

.PHONY: docker
docker:
	${DOCKER} run -v "$$(pwd)":/wdir -it --rm ${IMAGE} doc.pdf

words:
	@for file in src/*.tex; do printf "\n$$file:" ; perl latexcount.pl $$file; done

.PHONY: docker-image
docker-image:
	${DOCKER} build -t ${IMAGE} .

.PHONY: doc.pdf
doc.pdf:
	${PERLTEX} --latex=pdflatex ${MAIN} -o ${OUT}

clean:
	rm -rf *.{log,lgpl,dvi,aux,xml,pdf,toc,out} *-blx.bib
