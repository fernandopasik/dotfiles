verify: format hooks

venv:
	@python -m venv .venv
	@echo 'run `. .venv/bin/activate` to develop'

install:
	pip install -r requirements-dev.txt
	pre-commit install

format:
	pre-commit run --all-files yamlfmt

lint:
	yamllint .

hooks:
	pre-commit run --all-files
