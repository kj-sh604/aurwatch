# aurwatch Makefile

PREFIX ?= $(HOME)/.local

install:
	mkdir -p $(PREFIX)/bin
	install -Dm755 aurwatch $(PREFIX)/bin/aurwatch

remove:
	rm -f $(PREFIX)/bin/aurwatch

.PHONY: install remove
