.PHONY: all push build test

all: build push
	echo "Done!"

build:
	echo "Compiling typst documents"
	typst compile ./src/COMP604/main.typ ./dist/manuals/COMP604/COMP604_Missing_Manual.pdf
	typst compile ./src/COMP500/main.typ ./dist/manuals/COMP500/COMP500_Missing_Manual.pdf

push: build
	echo "Pushing to remote"
	git add .
	git commit -m "$(shell date)"
	git push

test: build
	echo "Running test server"
	python3 -m http.server --directory dist/ 8000
