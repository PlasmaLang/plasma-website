# vim: noet sw=4 ts=4

all : \
	images/icons/blocked-21.png \
	images/icons/done-21.png \
	images/icons/todo-21.png \
	images/icons/wip-21.png \
	images/logo-64.png \
	images/sun-200.png \
	images/sunt-200.png

images/icons/todo-21.png: images-original/todo.png images/icons
	convert $< -resize 21x21 $@
images/icons/done-21.png: images-original/done.png images/icons
	convert $< -resize 21x21 $@
images/icons/blocked-21.png: images-original/blocked.png images/icons
	convert $< -resize 21x21 $@
images/icons/wip-21.png: images-original/wip.png images/icons
	convert $< -resize 21x21 $@

images/logo-64.png: images-original/logo.png images
	convert $< -resize 64x64 $@
images/sun-200.png: images-original/sun.png images
	convert $< -resize 200x200 $@
images/sunt-200.png: images-original/sunt.png images
	convert $< -resize 200x200 $@

images/working.jpeg: images-original/working.jpeg images
	cp $< $@

images/icons:
	mkdir -p $@

images:
	mkdir -p $@

.PHONY: clean
clean:
	rm -rf images

