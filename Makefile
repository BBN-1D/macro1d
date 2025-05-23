# all of these can be over-ridden on the "make" command line if they don't suit your environment.
TOOL=macro1d
CFLAGS=-O2 -Wall -Wshadow -Wextra -pedantic -Woverflow -Wstrict-overflow
BIN=/usr/local/bin
INSTALL=install
CC=gcc

$(TOOL): $(TOOL).c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $(TOOL) $(TOOL).c $(LDLIBS)

.PHONY: clean install uninstall

clean:
	rm -f $(TOOL)

install: $(TOOL)
	$(INSTALL) -p -m u=rx,g=rx,o=rx $(TOOL) $(BIN)

uninstall:
	rm -f $(BIN)/$(TOOL)
