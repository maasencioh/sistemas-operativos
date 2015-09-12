#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

#define FILE_NAME "dataDogs.dat"

/**
 * Definicion estructura
 */
struct dogType {
	int id;
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
 * Ingresar registro:
 * Al ingresar pide uno a uno, los campos de un registro.
 */
void create() {
	// crea puntero
	struct dogType *dog;

	// asigna espacio de memoria
	dog = malloc(sizeof(*dog));

	// llena los campos
	printf("Ingrese el nombre: ");
	if (scanf("%s", dog->nombre) < 0) {
		perror("Couldn't read the string");
		exit(-1);
	}

	printf("Ingrese la edad: ");
	if (scanf("%u", &(dog->edad)) < 0) {
		perror("Couldn't read the string");
		exit(-1);
	}

	printf("Ingrese la raza: ");
	if (scanf("%s", dog->raza) < 0) {
		perror("Couldn't read the string");
		exit(-1);
	}

	printf("Ingrese la estatura: ");
	if (scanf("%u", &(dog->estatura)) < 0) {
		perror("Couldn't read the string");
		exit(-1);
	}

	printf("Ingrese el peso: ");
	if (scanf("%lf", &(dog->peso)) < 0) {
		perror("Couldn't read the string");
		exit(-1);
	}

	printf("Ingrese el sexo[m/f]: ");
	if (scanf(" %c", &(dog->sexo)) < 0) {
		perror("Couldn't read the string");
		exit(-1);
	}

	// abre el archivo
	size_t err;
	FILE* pa = fopen(FILE_NAME, "r");
	if (pa == NULL) {
		pa = fopen(FILE_NAME, "w+");
		if (pa == NULL) {
			perror("Couldn't open the file");
			exit(-1);
		}
	}

	// busca el maximo id
	struct dogType *dataDogs;
	dataDogs = malloc(sizeof(*dataDogs));
	size_t max_id = 0;
	do {
		err = fread(dataDogs, sizeof(*dataDogs), 1, pa);
		if (dataDogs->id >= max_id)
			max_id = dataDogs->id;
	}
	while (err != 0);
	if (feof(pa) == 0) {
		perror("Couldn't read the file");
		exit(-1);
	}
	dog->id = max_id + 1;
	free(dataDogs);

	// cierra el archivo
	err = fclose(pa);
	if (err != 0) {
		perror("Couldn't close the file");
		exit(-1);
	}

	// abre el archivo
	FILE* pb = fopen(FILE_NAME, "a");
	if (pb == NULL) {
		perror("Couldn't open the file");
		exit(-1);
	}

	// escribir en el archivo
	err = fwrite(dog, sizeof(*dog), 1, pb);
	if (err == -1) {
		perror("Couldn't write in the file");
		exit(-1);
	}

	// libera memoria de puntero
	printf("\nDatos guardados con id: %d\n", dog->id);
	free(dog);
	fflush(stdout);
}

/**
 * Ver registro:
 * Al ingresar muestra el numero de registros presentes
 *     y solicita el numero del registro a ver.
 * Verifica que el numero sea valido.
 */
void list() {
	// abre el archivo
	size_t err;
	FILE *pa = fopen(FILE_NAME, "r");
	if (pa == NULL)
		printf("El archivo no existe");
	else {
		// lista id y nombre
		struct dogType *dataDogs;
		dataDogs = malloc(sizeof(*dataDogs));
		printf("Lista de animales:\n");
		do {
			err = fread(dataDogs, sizeof(*dataDogs), 1, pa);
			if (err != 0)
				printf("Id: %d Nombre: %s\n", dataDogs->id, dataDogs->nombre);
		}
		while (err != 0);
		if (feof(pa) == 0) {
			perror("Couldn't read the file");
			exit(-1);
		}
		int *id;
		id = malloc(sizeof(*id));
		printf("\nSeleccione el id: ");
		if (scanf("%u", id) < 0) {
			perror("Couldn't read the string");
			exit(-1);
		}

		// abre el archivo
		FILE *pb = fopen(FILE_NAME, "r");
		if (pb == NULL) {
			perror("Couldn't open the file");
			exit(-1);
		}

		// busca id
		do {
			err = fread(dataDogs, sizeof(*dataDogs), 1, pb);
			if (dataDogs->id > *id) {
				printf("Id no encontrado\n");
				break;
			}
			else if (dataDogs->id == *id) {
				printf("Nombre: %s\n", dataDogs->nombre);
				printf("Edad: %u\n", dataDogs->edad);
				printf("Raza: %s\n", dataDogs->raza);
				printf("Estatura: %u\n", dataDogs->estatura);
				printf("Peso: %le\n", dataDogs->peso);
				printf("Sexo: %c\n", dataDogs->sexo);
				break;
			}
		}
		while (err != 0);
		if ((feof(pb) == 0) && (dataDogs->id < *id)) {
			perror("Couldn't list the file");
			exit(-1);
		}
		else if (dataDogs->id != *id) {
			printf("Id no encontrado\n");
		}

		// libera memoria de puntero
		free(dataDogs);
		fflush(stdout);
	}

	// cierra el archivo
	err = fclose(pa);
	if (err != 0) {
		perror("Couldn't close the file");
		exit(-1);
	}
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
				create();
				break;

			// ver registro
			case 'v':
				list();
				break;

			// borrar registro
			case 'o':
				break;

			// buscar registro
			case 'u':
				break;

			// salir
			case 's':
				printf("\nGracias y hasta la vista!!!\n");
				break;

			// comando desconocido
			default:
				printf("Comando desconocido!\n");
				break;
		}
	}
	return 0;
}