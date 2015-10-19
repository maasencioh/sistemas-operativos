#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <strings.h>
#include <unistd.h>
#include <time.h>

#define PORT 3535
#define BACKLOG 2
#define FILE_NAME "dataDogs.dat"
#define LOG_NAME "serverDogs.log"

char* create() {
    printf("create\n");
    return "1";
}

char* list() {
    printf("list\n");
    return "1";
}

char* erase() {
    printf("erase\n");
    return "1";
}

char* search() {
    printf("search\n");
    return "1";
}

int main() {
    int serverfd, clientfd, r, opt = 1;
    struct sockaddr_in server, client;
    socklen_t tamano;
    char buffer[1];

    // crea el socket
    serverfd = socket(AF_INET, SOCK_STREAM, 0);
    if(serverfd < 0){
        perror("Couldn't socket()");
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
        perror("Couldn't bind()");
        exit(-1);
    }

    r = listen(serverfd, BACKLOG);
    if(r < 0) {
        perror("Couldn't Listen()");
        exit(-1);
    }

    clientfd = accept(serverfd, (struct sockaddr *)&client, &tamano);
    if(clientfd < 0) {
        perror("Couldn't accept");
        exit(-1);
    }

    // prueba de coneccion
    r = send(clientfd, "exitosa", 8, 0);
    if(r < 0) {
        perror("Couldn't send()");
        exit(-1);
    }
    printf("Connected\n");
    char* addr = inet_ntoa(client.sin_addr);

    // abre el log
    size_t err;
	FILE* pa = fopen(LOG_NAME, "a");
	if (pa == NULL) {
		perror("Couldn't open the file");
		exit(-1);
	}

    // recibe comandos
    char log_msg[80];
    time_t rawtime;
    struct tm * timeinfo;
    do {
        r = recv(clientfd, buffer, 1, 0);
        switch (buffer[0]) {
			// ingresar registro
			case 'i':
                // escribir en el archivo
                time (&rawtime);
                timeinfo = localtime (&rawtime);
                strftime (log_msg,80,"%F-%T Cliente ",timeinfo);
                strcat(log_msg, addr);
                strcat(log_msg, " insercion ");
                strcat(log_msg, create());
                strcat(log_msg, "\n");
                printf("%s\n", log_msg);
                err = fwrite(log_msg, sizeof(log_msg), 1, pa);
            	if (err == -1) {
            		perror("Couldn't write in the file");
            		exit(-1);
            	}
				break;

			// ver registro
			case 'v':
                // escribir en el archivo
                time (&rawtime);
                timeinfo = localtime (&rawtime);
                strftime (log_msg,80,"%F-%T Cliente ",timeinfo);
                strcat(log_msg, addr);
                strcat(log_msg, " lectura ");
                strcat(log_msg, list());
                strcat(log_msg, "\n");
                printf("%s\n", log_msg);
                err = fwrite(log_msg, sizeof(log_msg), 1, pa);
                if (err == -1) {
                    perror("Couldn't write in the file");
                    exit(-1);
                }
				break;

			// borrar registro
			case 'o':
                // escribir en el archivo
                time (&rawtime);
                timeinfo = localtime (&rawtime);
                strftime (log_msg,80,"%F-%T Cliente ",timeinfo);
                strcat(log_msg, addr);
                strcat(log_msg, " borrado ");
                strcat(log_msg, erase());
                strcat(log_msg, "\n");
                printf("%s\n", log_msg);
                err = fwrite(log_msg, sizeof(log_msg), 1, pa);
                if (err == -1) {
                    perror("Couldn't write in the file");
                    exit(-1);
                }
				break;

			// buscar registro
			case 'u':
                // escribir en el archivo
                time (&rawtime);
                timeinfo = localtime (&rawtime);
                strftime (log_msg,80,"%F-%T Cliente ",timeinfo);
                strcat(log_msg, addr);
                strcat(log_msg, " busqueda ");
                strcat(log_msg, search());
                strcat(log_msg, "\n");
                printf("%s\n", log_msg);
                err = fwrite(log_msg, sizeof(log_msg), 1, pa);
                if (err == -1) {
                    perror("Couldn't write in the file");
                    exit(-1);
                }
				break;
        }
    }
    while (buffer[0] != 'c');

    // cierra el archivo
	err = fclose(pa);
	if (err != 0) {
		perror("Couldn't close the file");
		exit(-1);
	}

    // cierra el servidor
    close(clientfd);
    close(serverfd);
    printf("Closed\n");
}
