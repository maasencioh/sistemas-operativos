#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int bigFor() {
	int i;
	double acc;
	for (i = 0; i < 1000000000; i++) {
		acc = acc + sin(i);
	}
}

int main(int argc, char const *argv[])
{
	pid_t p;
	p = fork();
	if (p == -1) {
		perror("Couldn't create a fork");
		exit(-1);
	}
	if (p == 0) {
		bigFor();
		printf("Soy el hijo\n");
	}
	else {
		sleep(10);
		bigFor();
		printf("Soy el padre\n");
	}
	return 0;
}