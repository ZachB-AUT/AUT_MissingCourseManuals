.PHONY: all push build

all: typst_build push
	echo "Done!"

push:
	echo "Pushing to remote"
	git add .
	git commit -m "$(shell date)"
	git push

build:
	typst compile ./src/COMP604/main.typ ./dist/manuals/COMP604/COMP604_Missing_Manual.pdf
