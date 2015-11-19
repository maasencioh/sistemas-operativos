
* funcion(void*x) {
    char t;
    read(pipefd[0], &t, 1);
    printf("entra hilo\n");
    fflush(stdout);
    sleep(4);
    printf("sale hilo\n");
    fflush(stdout);
    write(pipefd[1], &t, 1);
    return 0;
}

int main(int argc, char const *argv[]) {
    int pipefd[2], r, a, i, *z;
    r = pipe(pipefd);
    write(pipefd[1], 't', 1);
    pthread_t hilos[i];
    for (i = 0; i < NUMHILOS; i++) {
        r = pthread_create(&hilos[i], NULL, (void*)funcion, (void*)&a);
        // errors
    }
    for (i = 0; i < NUMHILOS; i++) {
        r = pthread_join(hilos[i], (void**)&z);
        // errors
    }
    return 0;
}
