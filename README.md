# The When of Python

This repository contains the primary web content for the When of
Python project:

* `/catalogue` - The catalogue of Python features served at [whenof.python.nz](https://whenof.python.nz)
* `/blog` - The blog served at [whenof.python.nz/blog](https://whenof.python.nz/blog)

## Usage

* Install [Poetry](https://python-poetry.org/docs/#installation)
* Check poetry runs; if not, you might need to add \~/.local/bin to
  your BASH path e.g. put this line in `\~/.bashrc`:
  `export PATH=~/.local/bin:$PATH`
* `cd` into this directory
* Run `git submodule update --init`
* Run `make -C blog deps`
* Use `make preview` to preview the content at [localhost:3333](http://localhost:3333)
* Use `make github` to deploy all content to GitHub pages
