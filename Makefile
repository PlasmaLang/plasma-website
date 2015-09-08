# vim: noet sw=4 ts=4

all : \
	images/icons/blocked-21.png \
	images/icons/done-21.png \
	images/icons/todo-21.png \
	images/icons/wip-21.png

images/icons/todo-21.png: images-original/todo.png images/icons
	convert $< -resize 21x21 $@
images/icons/done-21.png: images-original/done.png images/icons
	convert $< -resize 21x21 $@
images/icons/blocked-21.png: images-original/blocked.png images/icons
	convert $< -resize 21x21 $@
images/icons/wip-21.png: images-original/wip.png images/icons
	convert $< -resize 21x21 $@

images/icons:
	mkdir -p $@



