# Makefile

SHELL := sh -e

all: test build

test:

	@echo "Nada para probar!"

build:

	@echo "Nada para compilar!"

install:

	@mkdir -p $(DESTDIR)/usr/share/canaima-escritorio-gnome
	@mkdir -p $(DESTDIR)/usr/share/applications
	@mkdir -p $(DESTDIR)/etc/xdg/autostart
	@mkdir -p $(DESTDIR)/usr/share/sounds/freedesktop/stereo
	@cp -r favorites/*.desktop $(DESTDIR)/usr/share/applications
	@cp -r pascua.jpg $(DESTDIR)/usr/share/canaima-escritorio-gnome
	@cp sounds/libcanberra-login-sound.desktop $(DESTDIR)/etc/xdg/autostart
	@cp sounds/desktop-login.oga $(DESTDIR)/usr/share/sounds/freedesktop/stereo

uninstall:

	@echo "Nada para desinstalar!"

clean:

distclean:

reinstall: uninstall install
