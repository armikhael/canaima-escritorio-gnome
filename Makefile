# Makefile

SHELL := sh -e

SCRIPTS = debian/postinst debian/postrm

all: build

test:

	@printf "Comprobando sintaxis de los scripts de shell ["
	@for SCRIPT in $(SCRIPTS); do \
		sh -n $${SCRIPT}; \
		checkbashisms -f -x $${SCRIPT} || true; \
		printf "."; \
	done
	@printf "]\n"

build:

	@echo "Nada para compilar!"

install:

	@mkdir -p $(DESTDIR)/usr/share/canaima-escritorio-gnome
	@mkdir -p $(DESTDIR)/usr/share/sounds/freedesktop/stereo
	@mkdir -p $(DESTDIR)/etc/xdg/autostart
	@cp pascua.jpg $(DESTDIR)/usr/share/canaima-escritorio-gnome/
	@cp config/* $(DESTDIR)/usr/share/canaima-escritorio-gnome/
	@cp libcanberra-login-sound.desktop $(DESTDIR)/etc/xdg/autostart/
	@cp desktop-login.oga $(DESTDIR)/usr/share/sounds/freedesktop/stereo/

uninstall:

	@rm -rf $(DESTDIR)/usr/share/canaima-escritorio-gnome/
	@rm -rf $(DESTDIR)/etc/xdg/autostart/libcanberra-login-sound.desktop
	@rm -rf $(DESTDIR)/usr/share/sounds/freedesktop/stereo/desktop-login.oga

clean:

distclean:

reinstall: uninstall install
