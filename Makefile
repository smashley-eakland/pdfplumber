.PHONY: venv tests check-black check-flake lint format
PYTHON := venv/bin/python
PIP = venv/bin/pip

venv:
	python3 -m venv venv
	${PIP} install --upgrade pip
	${PIP} install -r requirements.txt
	${PIP} install -r requirements-dev.txt
	${PIP} install -e .

tests:
	${PYTHON} -m pytest
	${PYTHON} -m coverage html

check-black:
	${PYTHON} -m black --check pdfplumber tests

check-isort:
	${PYTHON} -m isort --check-only pdfplumber tests

check-flake:
	${PYTHON} -m flake8 pdfplumber tests

lint: check-flake check-black check-isort

format:
	${PYTHON} -m black pdfplumber tests
	${PYTHON} -m isort pdfplumber tests
