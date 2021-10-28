THIS_FILE := $(lastword $(MAKEFILE_LIST))
CURRENT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))


.PHONY: dist
dist: ## generate distribution package
	$(MAKE) clean
	python setup.py sdist bdist_wheel

.PHONY: upload
upload: ## upload distribution package to PyPi
	$(MAKE) dist
	python -m twine upload dist/*

.PHONY: upgrade-dist-tools
upgrade-dist-tools: ## upgrade packages necessary for testing, building, packaging and uploading to PyPi
	python -m pip install --upgrade pip setuptools wheel tqdm twine pytest mkdocs mkdocstrings

.PHONY: prepare-release
prepare-release: ## prepare everythign for relaese
	pipenv lock --requirements > requirements.txt
	pipenv-setup sync

.PHONY: install-requirements
install-requirements: ## install requirements
	pip install -r requirements.txt

.PHONY: clean
clean: ## cleans the project directory
	@rm -rf dist/
	@rm -rf build/

.PHONY: help
help: ## this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

.DEFAULT_GOAL := help
