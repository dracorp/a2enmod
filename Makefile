SHELL 		:= /bin/bash
DESTDIR 	= 
SYSCONFDIR 	?= $(DESTDIR)/etc
PREFIX 		?= $(DESTDIR)/usr
SBINDIR 	= $(PREFIX)/sbin
MANDIR 		= $(PREFIX)/share/man/man8

apache_conf = $(SYSCONFDIR)/httpd/conf

all:

install:
	install -dm755 $(apache_conf)/mods-enabled
	install -dm755 $(apache_conf)/mods-available
	install -dm755 $(apache_conf)/sites-enabled
	install -dm755 $(apache_conf)/sites-available
# install a2enmod and create symlinks
	install -Dm755 a2enmod $(SBINDIR)/a2enmod
	ln -sf a2enmod $(SBINDIR)/a2ensite
	ln -sf a2enmod $(SBINDIR)/a2dismod
	ln -sf a2enmod $(SBINDIR)/a2dissite
# fix path
#	./fix.path.sh
# install available modules
	cp -f mods-available/* $(apache_conf)/mods-available/
# install man pages
	install -dm755 $(MANDIR)
	cp -f man/* $(MANDIR)/
# install other configuration files
	cp conf/* -fr $(apache_conf)/
