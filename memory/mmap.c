#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <time.h>
#include <unistd.h>

#define FILE_LENGTH 400

int main(int argc, char const *argv[]) {
    int fd, i;
    void* file_memory;

    i = truncate(argv[1], 400);
    if (i == -1) {
        perror("Error truncate");
        exit(1);
    }

    fd = open(argv[1], O_RDWR | O_CREAT | O_APPEND, S_IRUSR | S_IWUSR);
    if (fd == -1) {
        perror("Error open");
        exit(1);
    }

    file_memory = mmap(0, FILE_LENGTH, PROT_WRITE, MAP_SHARED, fd, 0);
    if (file_memory == MAP_FAILED) {
        perror("Error mmap");
        exit(1);
    }

    for (i = 0; i < 100; i++) {
        sprintf((char*) file_memory + (i*4), "\n%03d", i);
    }

    i = munmap (file_memory, FILE_LENGTH);
    if (i == -1) {
        perror("Error munmap");
        exit(1);
    }

    close(fd);
    return 0;
}
