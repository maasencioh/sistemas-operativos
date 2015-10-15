#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define PATH_TO_FILE "shared.txt"

int main() {
	pid_t p;
	size_t err;

	// create child
	p = fork();
	if (p == -1) {
		perror("Unable to create child");
		exit(-1);
	}

	// child
	if (p == 0) {

		// open file
		FILE* pfile = fopen(PATH_TO_FILE, "r+");
		if (pfile == NULL) {
			perror("Child couldn't open file");
			exit(-1);
		}
		
		// create space of the sended file
		char* read;
		read = malloc(sizeof("hola mundo"));

		// read the file
		err = fread(read, sizeof(*read), 1, pfile);
		if (err == -1) {
			perror("Couldn't read the file");
			exit(-1);
		}
		printf("%s\n", read);
		free(read);
		
		err = fclose(pfile);
		if (err != 0) {
			perror("Couldn't close the file");
			exit(-1);
		}
	}

	// parent
	else {

		// open the file
		FILE* pfile = fopen(PATH_TO_FILE, "w+");
		if (pfile == NULL) {
			perror("Parent couldn't open file");
			exit(-1);
		}
		
		// write in the file
		err = fwrite("hola mundo", sizeof("hola mundo"), 1, pfile);
		if (err == -1) {
			perror("Couldn't write in the file");
			exit(-1);
		}
		
		printf("done\n");
		
		err = fclose(pfile);
		if (err != 0) {
			perror("Couldn't close the file");
			exit(-1);
		}
		sleep(2);
	}
} 
