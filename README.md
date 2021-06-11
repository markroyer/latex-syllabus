# latex-syllabus

![Build](https://github.com/markroyer/latex-syllabus/actions/workflows/ci.yml/badge.svg)

A simple latex course syllabus.

This project is provided in the hopes that it may be useful to other
people that are looking to create a syllabus.  This example syllabus
contains many standard components including a semester calendar.

## Setup

### Option 1: Docker

Install Docker https://www.docker.com/

### Option 2: Debian

If you are using Debian make sure the `texlive` and `inkscape` packages are installed.

## Usage

### Option 1: Docker

You can build the syllabus by typing

```
make startdocker-build
```

in the root of the repository. The file `syllabus.pdf` is the
generated output.

### Option 2: Debian

Typing

```
make
```

in the root of the repository builds the pdf.

## Cleanup

Typing

```
make clean
```

removes tex-generated files.

Typing

```
make squeaky-clean
```

removes **every** generated file.

## License

The project is licensed under the terms of the
[GPL3](https://www.gnu.org/licenses/gpl-3.0.en.html) license.

<!--  LocalWords:  texlive pdf GPL
 -->
