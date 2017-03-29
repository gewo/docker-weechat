PREFIX ?= /usr/local
DESTDIR ?=
BINDIR ?= $(PREFIX)/bin
LIBDIR ?= $(PREFIX)/lib
MANDIR ?= $(PREFIX)/share/man

default: build

run: build
	docker run -it --rm -v $(HOME)/.weechat:/home/guest/.weechat weechat

build:
	docker build -t weechat .
	@touch $@

clean:
	-docker rmi weechat
	-rm -f build

install:
	@install -v -d "$(DESTDIR)$(BINDIR)/" && install -v -m 0755 weechat "$(DESTDIR)$(BINDIR)/weechat"
