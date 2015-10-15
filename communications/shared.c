#include <stdio.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <unistd.h>
#include <stdlib.h>

int main(){

	int a=16,id,r,*ap;
	key_t key=321;
	pid_t pid;

	id=shmget(key,sizeof(int),IPC_CREAT|0666);
	//validar error
	if(id==(-1)){
		perror("no pudeasereje");
		exit (-1);
			}
	ap=shmat(id,(void*)NULL,0);
	//validar error
	if(*ap==(-1)){
		perror("no pude");
		exit (-1);
			}
	
	
	pid=fork();
	
	//validar//
	if (pid==0)
		{
			printf("%i \n",*ap);
		}
		else
		{
		*ap=16;
		}
	shmdt(ap);
}
