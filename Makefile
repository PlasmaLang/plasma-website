# vim: noet sw=4 ts=4

.PHONY : all
all : _site

_site : \
		_vendor \
		docs \
		favicon.ico \
		images/icons/blocked-21.png \
		images/icons/done-21.png \
		images/icons/maybe-21.png \
		images/icons/todo-21.png \
		images/icons/wip-21.png \
		images/logo-128.png \
		images/logo-64.png \
		images/logotype-600.png \
		images/sun-200.png \
		images/sunt-200.png
	bundle exec jekyll build

.PHONY : serve
serve : _site
	bundle exec jekyll serve --drafts

_vendor : Gemfile
	bundle install --path _vendor/bundle

images/icons/todo-21.png: _images-original/todo.png images/icons
	convert $< -resize 21x21 $@
images/icons/done-21.png: _images-original/done.png images/icons
	convert $< -resize 21x21 $@
images/icons/blocked-21.png: _images-original/blocked.png images/icons
	convert $< -resize 21x21 $@
images/icons/wip-21.png: _images-original/wip.png images/icons
	convert $< -resize 21x21 $@
images/icons/maybe-21.png: _images-original/maybe.png images/icons
	convert $< -resize 21x21 $@

images/logo-64.png: _images-original/logo-v1.png images
	convert $< -resize 64x64 $@
favicon.ico: images/logo-64.png
	cp $< $@
images/sun-200.png: _images-original/sun.png images
	convert $< -resize 200x200 $@
images/sunt-200.png: _images-original/sunt.png images
	convert $< -resize 200x200 $@
images/logotype-600.png: _images-original/logotype-v1.png images
	convert $< -resize 600x315 $@
images/logo-128.png: _images-original/logo-v1.png images
	convert $< -resize 128x128 $@

images/icons:
	mkdir -p $@

images:
	mkdir -p $@

.PHONY: docs
docs: docs/index.html \
	docs/getting_started.html \
	docs/plasma_ref.html \
	docs/contributing.html \
	docs/notes_references.html \
	docs/notes_grades.html \
	docs/dev_howto_make_pr.html \
	docs/dev_compiler_internals.html \
	docs/dev_style_mercury.html \
	docs/dev_style_c.html \
	docs/dev_maintainers.html \
	docs/dev_bugtracking.html \
	docs/design_principles.html \
	docs/design_concept_map.html \
	docs/design_types.html \
	docs/design_ideas.html \
	docs/pz_machine.html \
	docs/pz_format.html

docs/%.txt: ../plasma/docs/%.txt
	cp $< $@

%.html : %.txt docs/_asciidoc.conf
	asciidoc --conf-file docs/_asciidoc.conf -o $@ $<

.PHONY: clean
clean:
	rm -rf images _site docs/*.txt docs/*.html Gemfile.lock

.PHONY: upload
upload: all
	rsync -crv \
		--exclude Gemfile \
		--exclude Gemfile.lock \
		--exclude README.md \
		--exclude LICENSE.md \
		--exclude CONTRIBUTING.md \
		--exclude Makefile \
		--exclude images-original \
		--del _site/ champagne:/srv/www/plasmalang/

