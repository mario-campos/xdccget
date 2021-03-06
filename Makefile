CFLAGS =-std=gnu99 -D_FILE_OFFSET_BITS=64 -DENABLE_SSL -DENABLE_IPV6 -DHAVE_POLL -Wall -Wfatal-errors -Os -fstack-protector -I libircclient-include/
LIBS = -lssl -lcrypto -lpthread
PROG = xdccget

SRCS = xdccget.c \
       helper.c \
       argument_parser.c \
       libircclient-src/libircclient.c \
       sds.c

all: build

build: $(SRCS)
	$(CC) $(CFLAGS) -o $(PROG) $(SRCS) $(OBJ_FILES) $(LIBS)

install:
	cp ./$(PROG) /usr/bin/

clean:
	rm -f $(PROG)
