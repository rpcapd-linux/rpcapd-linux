################################
# Makefile for the remote daemon
################################

CC      = gcc
CFLAGS  = -pthread -D_DEBUG -g -Wall -DHAVE_REMOTE -DHAVE_SNPRINTF 
#flags for debugging: -D_DEBUG -g -Wall

INCLUDE = -Ilibpcap/

LIB	= -lpcap -lcrypt
#Solaris: add '-lsocket'

LIBPATH	= -Llibpcap/

# Files that are needed to compile this project
FILES = rpcapd.o daemon.o utils.o fileconf.o pcap-remote.o sockutils.o pcap-new.o

# Makefile syntax:
# Project name : dependencies
#  command line

rpcapd: $(FILES)
	$(CC) $(CFLAGS) $(INCLUDE) -o rpcapd $(FILES) $(LIBPATH) $(LIB)

rpcapd.o: rpcapd.c
	$(CC) $(CFLAGS) $(INCLUDE) -c rpcapd.c

daemon.o: daemon.c
	$(CC) $(CFLAGS) $(INCLUDE) -c daemon.c

utils.o: utils.c
	$(CC) $(CFLAGS) $(INCLUDE) -c utils.c

fileconf.o: fileconf.c
	$(CC) $(CFLAGS) $(INCLUDE) -c fileconf.c

sockutils.o: libpcap/sockutils.c
	$(CC) $(CFLAGS) $(INCLUDE) -c libpcap/sockutils.c

pcap-remote.o: libpcap/pcap-remote.c
	$(CC) $(CFLAGS) $(INCLUDE) -c libpcap/pcap-remote.c

pcap-new.o: libpcap/pcap-new.c
	$(CC) $(CFLAGS) $(INCLUDE) -c libpcap/pcap-new.c

clean:
	rm -f *.o
	rm rpcapd

