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
	@mkdir -p $(DESTDIR)/etc/skel/.config
	@mkdir -p $(DESTDIR)/etc/sysctl.d
	@cp pascua.jpg $(DESTDIR)/usr/share/canaima-escritorio-gnome/
	@cp -r alternatives $(DESTDIR)/usr/share/canaima-escritorio-gnome/
	@cp libcanberra-login-sound.desktop $(DESTDIR)/etc/xdg/autostart/
	@cp desktop-login.oga $(DESTDIR)/usr/share/sounds/freedesktop/stereo/
	@cp config/canaima-escritorio-gnome.conf $(DESTDIR)/etc/sysctl.d/
	@cp config/user-dirs.dirs $(DESTDIR)/etc/skel/.config/
	@cp config/user-dirs.locale $(DESTDIR)/etc/skel/.config/

uninstall:

	@rm -rf $(DESTDIR)/usr/share/canaima-escritorio-gnome/
	@rm -rf $(DESTDIR)/etc/xdg/autostart/libcanberra-login-sound.desktop
	@rm -rf $(DESTDIR)/usr/share/sounds/freedesktop/stereo/desktop-login.oga

clean:

distclean:

reinstall: uninstall install
