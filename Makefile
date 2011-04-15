# Makefile

SHELL := sh -e

SCRIPTS =	"debian/preinst install" \
		"debian/postinst configure" \
		"debian/prerm remove" \
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
	#cp -r gnome-default-applications.xml $(DESTDIR)/usr/share/canaima-escritorio-gnome/

uninstall:

	rm -rf $(DESTDIR)/usr/share/canaima-escritorio-gnome/

clean:

distclean:

reinstall: uninstall install
