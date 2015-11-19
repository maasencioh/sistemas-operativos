#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

int main(int argc, char const *argv[]) {
    // takes the size
    if (argc != 2) {
		perror("Need one argument");
		exit(1);
	}
	int size = (int) strtol(argv[1], NULL, 10) * 1000000000;

    // creates space of memory
    char* memory;
    memory = malloc(size * sizeof(char));
    if (memory == NULL) {
        perror("Space not avaible");
        exit(1);
    }

    // fills the memory
    for (long int i = 0; i < size; i++) {
        memory[i] = 'a';
    }

    // free the memory
    free(memory);

    return 0;
}
