#include <stdio.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <unistd.h>
#include <stdlib.h>
#include <inttypes.h>

int main(int argc, char **argv) {

	// read the size to work with
	if (argc != 2) {
		perror("Should be ./shared.o <size>");
		exit(-1);
	}
	int size = (int) strtol(argv[1], NULL, 10);
	printf(">> Size: %d\n", size);

	// variable definition
	int id, r;
	char *ap;
	key_t key = 0x6060;//ftok("share.txt", 'R');
	pid_t pid;

	// creates shared memory identifier
	id = shmget(key, (sizeof(char) * size), IPC_CREAT|0666);
	if (id == -1) {
		perror("Unable to create memory space");
		exit(-1);
	}

	// maps the shared memory segment
	ap = shmat(id, 0, 0);
	if (ap ==  (char*)-1) {
		perror("Unable to map memory space");
		exit(-1);
	}
	
	// creates a child
	pid = fork();
	if (pid == -1) {
		perror("Unable to create child");
		exit(-1);
	}

	// child
	if (pid == 0) {
		int cond = 0;
		while(!cond) {
			for (int i = 0; i < size; ++i) {
				cond = cond || (ap[i] != 'a');
			}
			cond = !cond;
		}
	}

	// parent
	else {
		for (int i = 0; i < size; ++i) {
			ap[i] = 'a';
		}
	}

	// unmaps the shared memory segment
	r = shmdt(ap);
	if (r == -1) {
		perror("Unable to unmap memory space");
		exit(-1);
	}
}
