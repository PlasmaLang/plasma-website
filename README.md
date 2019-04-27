# Plasma Language Website
## *a new programming language*

This is the source for the plasma website hosted at,
[https://plasmalang.org/](https://plasmalang.org/).
Go there for a general overview.

The main Plasma source repository is
[https://github.com/PlasmaLang/plasma](https://github.com/PlasmaLang/plasma).

## Build

We use the jekyll static site builder to build this site.  If you type
"make" and have the prerequsites it should work. type "make serve" to host
it locally for testing.

## Pre-requisites

 * make
 * asciidoc
 * imagemagick-6.q16
 * rsync
 * Jekyll

Get the easy packages on your Ubuntu/Debian-ish system:

```
sudo apt install make asciidoc imagemagick-6.q16 rsync
```

Install Jekyll:

https://jekyllrb.com/docs/installation/ubuntu/

```
sudo apt install ruby-full build-essential zlib1g-dev
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
exec bash
gem install bundler
```

Then move into the project directory and run:

```
bundle install
```

## Contributing

Please see [CONTRIBUTING.md](CONTRIBUTING.md) in this repository.

