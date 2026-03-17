verify: format lint hooks

venv:
	@python -m venv .venv
	@echo 'run `. .venv/bin/activate` to develop'

install:
	pip install -r requirements-dev.txt
	pre-commit install

format:
	yamlfmt .
	mdformat .
	stylua -a .

lint:
	yamllint .
	pymarkdownlnt scan -r --respect-gitignore .
	shellcheck -x profile/.bash_aliases
	sed 's/.*= "!\(.*\)"/\1/;t;s/.*//' profile/.gitconfig | sed 's/\\"/"/g' | shellcheck -s sh -e SC2119,SC2120 -

hooks:
	pre-commit run --all-files

build:
	stow .
