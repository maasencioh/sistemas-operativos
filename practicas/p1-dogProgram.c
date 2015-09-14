#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>

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
 *
 */
void lowstr(char *s) {
 	char  *p;
	for (p = s; *p != '\0'; p++) 
		*p = (char) tolower(*p);
}


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

	// cierra el archivo
	err = fclose(pb);
	if (err != 0) {
		perror("Couldn't close the file");
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
 * y solicita el numero del registro a ver.
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
		free(id);
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
 * Borrar registro:
 * Al ingresar muestra el número de registros presentes y
 * solicita el número del registro a borrar.
 * El registro es borrado del archivo,
 * por lo que el archivo debe reducir su tamaño.
 */
void erase() {
	unsigned int valorEliminar;
	const char *tmpName = "result.dat";
	printf("\nSeleccione el id: ");
	if (scanf("%u", &valorEliminar) < 0) {
		perror("Couldn't read the string");
		exit(-1);
	}
	
	FILE *pf, *pfResult;
	int encontrado = 0;
	struct dogType *dataDogs;
	dataDogs = malloc(sizeof(*dataDogs));
	size_t err;

	// Abrir el archivo en modo actualización
	pf = fopen(FILE_NAME, "r");
	if (pf == NULL) {
		perror(FILE_NAME);
		exit(1);
	}

	// Crear un segundo archivo
	pfResult = fopen(tmpName, "w");
	if (pfResult == NULL) {
		perror("temp.dat");
		exit(1);
	}

	// Reescribir los elementos, excepto el buscado
	int count = 0;
	do {
		err = fread(dataDogs, sizeof(*dataDogs), 1, pf);
		if ((dataDogs->id != valorEliminar) && (err != 0)) {
			err = fwrite(dataDogs, sizeof(*dataDogs), 1, pfResult);
			if (err == -1) {
				perror("Couldn't write in the file");
				exit(-1);
			}
		}
		else if (dataDogs->id == valorEliminar)
			encontrado = 1;
	}
	while (err != 0);
	if (feof(pf) == 0) {
		perror("Couldn't read the file");
		exit(-1);
	}

	free(dataDogs);
	fclose(pf);
	fclose(pfResult);

	if (encontrado) {
		err = rename(tmpName, FILE_NAME);
		if (err == -1) {
			perror("Couldn't delete the file");
			exit(-1);
		}
		printf("El elemento ha sido borrado\n");
	}
	else {
		err = remove(tmpName);
		if (err == -1) {
			perror("Couldn't delete the file");
			exit(-1);
		}
		printf("Elemento no encontrado\n");
	}
}

/**
 * Buscar registro.
 * Solicita una cadena de caracteres a buscar en los campos nombre de los registros.
 * Muestra todos los registros que coincidan completamente con el nombre.
 * No se distingue mayúsculas de minúsculas.
 */
void search() {
	// abre el archivo
	size_t err;
	int find = 0;
	struct dogType *dataDogs;
	dataDogs = malloc(sizeof(*dataDogs));
	FILE *pa = fopen(FILE_NAME, "r");
	if (pa == NULL)
		printf("El archivo no existe");
	else {
		// solicita el nombre
		char name[32];
		printf("\nSeleccione el nombre: ");
		if (scanf("%s", name) < 0) {
			perror("Couldn't read the string");
			exit(-1);
		}

		// abre el archivo
		FILE *pb = fopen(FILE_NAME, "r");
		if (pb == NULL) {
			perror("Couldn't open the file");
			exit(-1);
		}

		// busca nombre
		char *str1, *str2;
		str1 = malloc(sizeof(*str1));
		str2 = malloc(sizeof(*str2));
		while(1) {
			err = fread(dataDogs, sizeof(*dataDogs), 1, pb);
			if (err == 0)
				break;
			lowstr(dataDogs->nombre);
			lowstr(name);
			if (strstr(dataDogs->nombre, name) != NULL) {
				printf("Id: %d, Nombre: %s\n", dataDogs->id, dataDogs->nombre);
				find = 1;
			}
		}
		if ((feof(pb) == 0)) {
			perror("Couldn't list the file");
			exit(-1);
		}
		if (find == 0) {
			printf("Nombre no encontrado\n");
		}

		// libera memoria de puntero
		free(str1);
		free(str2);
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
		switch (tolower(command)) {

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