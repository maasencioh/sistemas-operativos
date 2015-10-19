CC=gcc

server: p2-dogServer.c
	$(CC) -o server.o p2-dogServer.c

client: p2-dogClient.c
	$(CC) -o client.o p2-dogClient.c

all: p2-dogServer.c p2-dogClient.c
	$(CC) -o server.o p2-dogServer.c
	$(CC) -o client.o p2-dogClient.c

clear:
	rm *.o dataDogs.dat serverDogs.log
