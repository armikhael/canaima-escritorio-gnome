# Makefile

SHELL := sh -e

all: test build

test:

	@echo "Nada para probar!"

build:

	@echo "Nada para compilar!"

install:

	@mkdir -p $(DESTDIR)/usr/share/canaima-escritorio-gnome
	@cp -r pascua.jpg $(DESTDIR)/usr/share/canaima-escritorio-gnome/

uninstall:

	@echo "Nada para desinstalar!"

clean:

distclean:

reinstall: uninstall install