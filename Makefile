GITHUB_PAGES_BRANCH=gh-pages

build:
	cd blog/ && poetry install --no-root && make publish && cd ..
	mkdir -p output
	rm -r output
	cp -R catalogue output
	cp -R blog/output output/blog/

preview: build
	python3 -m http.server --directory output --bind localhost 3333

github: build
	poetry run ghp-import -m "Generate Pelican site" -b $(GITHUB_PAGES_BRANCH) output
	git push origin $(GITHUB_PAGES_BRANCH)

.PHONY: build preview github
