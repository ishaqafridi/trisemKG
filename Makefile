.PHONY: install data build test lint owl clean all

install:
	pip install -e ".[all,dev]"

data:
	trisemkg synth --out data/raw --patients 200

build:
	trisemkg build --config configs/pipeline.yaml

owl:
	trisemkg owl

test:
	pytest -q

lint:
	ruff check src tests

clean:
	rm -rf output data/raw

all: install data build test
