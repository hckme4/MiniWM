CFLAGS += -std=c99 -Wall -Wextra -pedantic -Wold-style-declaration
CFLAGS += -Wmissing-prototypes -Wno-unused-parameter
PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin
CC     ?= gcc

all: miniwm

config.h:
	cp config.def.h config.h

miniwm: miniwm.c miniwm.h config.h Makefile
	$(CC) -O3 $(CFLAGS) -o $@ $< -lX11 $(LDFLAGS)

install: all
	install -Dm755 miniwm $(DESTDIR)$(BINDIR)/miniwm

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/miniwm

clean:
	rm -f miniwm *.o

.PHONY: all install uninstall clean
