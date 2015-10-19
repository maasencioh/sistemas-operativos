#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <strings.h>
#include <unistd.h>

#define PORT 3535
#define BACKLOG 2
#define FILE_NAME "dataDogs.dat"
#define LOG_NAME "serverDogs.log"

void create() {
    printf("create\n");
}

void list() {
    printf("list\n");
}

void erase() {
    printf("erase\n");
}

void search() {
    printf("search\n");
}

int main() {
    int serverfd, clientfd, r, opt = 1;
    struct sockaddr_in server, client;
    socklen_t tamano;
    char buffer[1];

    // crea el socket
    serverfd = socket(AF_INET, SOCK_STREAM, 0);
    if(serverfd < 0){
        perror("\n-->Error en socket():");
        exit(-1);
    }

    // configura el socket
    server.sin_family = AF_INET;
    server.sin_port = htons(PORT);
    server.sin_addr.s_addr = INADDR_ANY;
    bzero(server.sin_zero, 8);
    setsockopt(serverfd,SOL_SOCKET,SO_REUSEADDR,(const char *)&opt,sizeof(int));

    r = bind(serverfd, (struct sockaddr *)&server, sizeof(struct sockaddr));
    if(r < 0) {
        perror("\n-->Error en bind(): ");
        exit(-1);
    }

    r = listen(serverfd, BACKLOG);
    if(r < 0) {
        perror("\n-->Error en Listen(): ");
        exit(-1);
    }

    clientfd = accept(serverfd, (struct sockaddr *)&client, &tamano);
    if(clientfd < 0) {
        perror("\n-->Error en accept: ");
        exit(-1);
    }

    // prueba de coneccion
    r = send(clientfd, "exitosa", 8, 0);
    if(r < 0) {
        perror("\n-->Error en send(): ");
        exit(-1);
    }

    // recibe comandos
    do {
        r = recv(clientfd, buffer, 1, 0);
        switch (buffer[0]) {

			// ingresar registro
			case 'i':
				create();
				break;

			// ver registro
			case 'v':
				list();
				break;

			// borrar registro
			case 'o':
				erase();
				break;

			// buscar registro
			case 'u':
				search();
				break;
        }
    }
    while (buffer[0] != 'c');
    close(clientfd);
    close(serverfd);
}
