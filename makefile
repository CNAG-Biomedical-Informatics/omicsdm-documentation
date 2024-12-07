#!make
SHELL := /bin/bash


.PHONY: .venv
venv:
	python3 -m venv .venv && source .venv/bin/activate && pip3 install -r requirements.txt

serve:
	mkdocs serve -f mkdocs.yml

stop:
	fuser -k 8000/tcp

build:
	mkdocs build -f mkdocs.yml
