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
		images/logo-128.jpeg \
		images/logo-64.png \
		images/logo-wide-600.jpeg \
		images/logotype.jpeg
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

images/logo-64.png: _images-original/logo.png images
	convert $< -resize 64x64 $@
favicon.ico: images/logo-64.png
	cp $< $@
images/logo-wide-600.jpeg: _images-original/logotype.png images
	convert $< -resize 600x160 $@
images/logo-128.jpeg: _images-original/logo.png images
	convert $< -resize 128x128 $@
images/logotype.jpeg: _images-original/logotype.png images
	convert $< -resize 900x239 $@

images/icons:
	mkdir -p $@

images:
	mkdir -p $@

.PHONY: docs
docs: docs/index.html \
	docs/C_style.html \
	docs/Mercury_style.html \
	docs/concept_map.html \
	docs/grades.html \
	docs/plasma_ref.html \
	docs/pz_format.html \
	docs/pz_machine.html \
	docs/references.html \
	docs/ideas.html \
	docs/types.html

docs/index.txt: ../plasma/docs/index.txt
	cp $< $@

docs/C_style.txt: ../plasma/docs/C_style.txt
	cp $< $@
docs/Mercury_style.txt: ../plasma/docs/Mercury_style.txt
	cp $< $@
docs/concept_map.txt: ../plasma/docs/concept_map.txt
	cp $< $@
docs/grades.txt: ../plasma/docs/grades.txt
	cp $< $@
docs/plasma_ref.txt: ../plasma/docs/plasma_ref.txt
	cp $< $@
docs/pz_format.txt: ../plasma/docs/pz_format.txt
	cp $< $@
docs/pz_machine.txt: ../plasma/docs/pz_machine.txt
	cp $< $@
docs/references.txt: ../plasma/docs/references.txt
	cp $< $@
docs/ideas.txt: ../plasma/docs/ideas.txt
	cp $< $@
docs/types.txt: ../plasma/docs/types.txt
	cp $< $@

%.html : %.txt docs/_asciidoc.conf
	asciidoc --conf-file docs/_asciidoc.conf -o $@ $<

.PHONY: clean
clean:
	rm -rf images _site docs/*.txt docs/*.html

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

