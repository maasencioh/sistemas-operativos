#include <stdio.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <unistd.h>
#include <stdlib.h>

int main() {
	int a = 16, id, r, *ap;
	key_t key = 321;
	pid_t pid;

	// creates shared memory identifier
	id = shmget(key, sizeof(int), IPC_CREAT|0666);
	if (id == -1) {
		perror("Unable to create memory space");
		exit(-1);
	}

	// maps the shared memory segment
	ap = shmat(id, (void*)NULL, 0);
	if (*ap == -1) {
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
		printf("%i \n", *ap);
	}

	// parent
	else {
		*ap = 16;
	}

	// unmaps the shared memory segment
	r = shmdt(ap);
	if (r == -1) {
		perror("Unable to unmap memory space");
		exit(-1);
	}
}
