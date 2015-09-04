#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

struct dogType {
	char nombre [32];
	int edad;
	char raza [16];
	int estatura;
	double peso;
	char sexo;
};

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
 * Funcion principal
 */
int main(int argc, char const *argv[]) {
	char command = 'c';
	while (command != 's') {

		// imprime menu
		menu();

		// solicita el comando a ejecutar
		printf("Comando>> ");
		do
			command = getchar();
		while (isspace(command));

		// elige funcion a realizar
		switch (command) {

			// ingresar registro
			case 'i':
				break;

			// ver registro
			case 'v':
				break;

			// borrar registro
			case 'o':
				break;

			// buscar registro
			case 'u':
				break;

			// salir
			case 's':
				printf("Gracias y hasta la vista!!!\n");
				break;

			// comando desconocido
			default:
				printf("Comando desconocido!\n");
				break;
		}
	}
	return 0;
}