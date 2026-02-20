verify: format lint hooks

venv:
	@python -m venv .venv
	@echo 'run `. .venv/bin/activate` to develop'

install:
	pip install -r requirements-dev.txt
	pre-commit install

format:
	pre-commit run --all-files yamlfmt
	mdformat .

lint:
	yamllint .
	pymarkdownlnt scan .
	shellcheck -x profile/.bash_aliases
	sed 's/.*= "!\(.*\)"/\1/;t;s/.*//' profile/.gitconfig | sed 's/\\"/"/g' | shellcheck -s sh -

hooks:
	pre-commit run --all-files

build:
	stow .
