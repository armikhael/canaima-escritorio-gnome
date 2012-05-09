# Makefile

SHELL := sh -e

SCRIPTS  =	"debian/postinst configure" \
		"debian/postrm remove" \

all: build

test:

	@echo -n "\n===== Comprobando posibles errores de sintaxis en los scripts de mantenedor =====\n"

	@for SCRIPT in $(SCRIPTS); \
	do \
		echo -n "$${SCRIPT}\n"; \
		bash -n $${SCRIPT}; \
	done

	@echo -n "¡TODO BIEN!\n=================================================================================\n\n"

build:

	@echo "Nada para compilar!"

install:

	mkdir -p $(DESTDIR)/usr/share/canaima-escritorio-gnome/
	cp -r pascua.jpg $(DESTDIR)/usr/share/canaima-escritorio-gnome/
	mkdir -p $(DESTDIR)/etc/xdg/autostart/
	cp -r desktop/libcanberra-login-sound.desktop $(DESTDIR)/etc/xdg/autostart/
	mkdir -p $(DESTDIR)/usr/share/sounds/freedesktop/stereo/
	cp -r sounds/desktop-login.oga $(DESTDIR)/usr/share/sounds/freedesktop/stereo/

uninstall:

	rm -rf $(DESTDIR)/usr/share/canaima-escritorio-gnome/
	rm -rf $(DESTDIR)/etc/xdg/autostart/
	rm -rf $(DESTDIR)/usr/share/sounds/freedesktop/stereo/

clean:

distclean:

reinstall: uninstall install
