#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <ctype.h>

#define PORT 3535

/**
 * Imprime el menu
 */
void menu() {
	printf("\n");
	printf("MENU: \n");
	printf("[i]: Ingresar registro\n");
	printf("[v]: Ver registro\n");
	printf("[o]: Borrar registro\n");
	printf("[u]: Buscar registro\n");
	printf("[s]: Salir\n");
	fflush(stdout);
}

/**
 * Cast string a minuscula
 */
void lowstr(char *s) {
	char  *p;
	for (p = s; *p != '\0'; p++)
		*p = (char) tolower(*p);
}

void create() {}

void list() {}

void erase() {}

void search() {}

/**
 * Funcion principal
 */
int main(int argc, char *argv[]) {
    int clientfd, r;
    struct sockaddr_in client;
    struct hostent *he;
    char char_buffer[32];
    int int_buffer[1];
    double double_buffer[1];

    // abre el socket
    clientfd = socket(AF_INET, SOCK_STREAM, 0);
    if(clientfd < 0) {
        perror("Couldn't socket()");
        exit(-1);
    }
    client.sin_family = AF_INET;
    client.sin_port = htons(PORT);
    inet_aton(argv[1], &client.sin_addr);

    // conecta al servidor
    r = connect(clientfd, (struct sockaddr *)&client, (socklen_t)sizeof(struct sockaddr));
    if(r < 0) {
        perror("Couldn't connect()");
        exit(-1);
    }

    // espera coneccion
    r = recv(clientfd, char_buffer, 32, 0);
    char_buffer[r] = 0;
    printf("Coneccion: %s\n", char_buffer);

    // menu loop
    char command = 'x';
	while (command != 's') {

		// imprime menu
		menu();

		// solicita el comando a ejecutar
		printf("Comando>> ");
		do
			command = getchar();
		while (isspace(command));

		// elige funcion a realizar
		switch (tolower(command)) {

			// ingresar registro
			case 'i':
                r = send(clientfd, "i", 1, 0);
                if(r < 0) {
                    perror("Couldn't send()");
                    exit(-1);
                }
				create();
				break;

			// ver registro
			case 'v':
                r = send(clientfd, "v", 1, 0);
                if(r < 0) {
                    perror("Couldn't send()");
                    exit(-1);
                }
				list();
				break;

			// borrar registro
			case 'o':
                r = send(clientfd, "o", 1, 0);
                if(r < 0) {
                    perror("Couldn't send()");
                    exit(-1);
                }
				erase();
				break;

			// buscar registro
			case 'u':
                r = send(clientfd, "u", 1, 0);
                if(r < 0) {
                    perror("Couldn't send()");
                    exit(-1);
                }
				search();
				break;

			// salir
			case 's':
				printf("\nGracias y hasta la vista!!!\n");

                // apaga el servidor
                r = send(clientfd, "c", 1, 0);
                if(r < 0) {
                    perror("Couldn't send()");
                    exit(-1);
                }

                // cierra el cliente
                close(clientfd);
				break;

			// comando desconocido
			default:
				printf("Comando desconocido!\n");
				break;
		}
	}
}
