.PHONY: all push

all: push
	echo "Pushing to remote"

push:
	git add .
	git commit -m "$(shell date)"
	git push
