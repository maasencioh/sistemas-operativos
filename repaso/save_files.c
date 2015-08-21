#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * create payment structure
 */
struct payment {
	int day;
	int month;
	int year;
	float amount;
	char f_name[10];
	char l_name[10];
	float last_amount;
	float total_amount;
};

/**
 * fill the pay data with default values
 * @param {struct payment*} pay: pointer to fill
 */
void charge(struct payment *pay) {
	pay->day = 10;
	pay->month = 03;
	pay->year = 2015;
	pay->amount = 20;
	strcpy(pay->f_name, "Miguel");
	strcpy(pay->l_name, "Asencio");
	pay->last_amount = 40;
	pay->total_amount = 60;
}

/**
 * show the pay data
 * @param {struct payment*} pay: pointer to show
 */
void show(struct payment *pay) {
	printf("day: %d\n", pay->day);
	printf("month: %d\n", pay->month);
	printf("year: %d\n", pay->year);
	printf("new amount: %f\n", pay->amount);
	printf("first name: %s\n", pay->f_name);
	printf("last name: %s\n", pay->l_name);
	printf("last amount: %f\n", pay->last_amount);
	printf("total amount: %f\n", pay->total_amount);
}

/**
 * save the pay data in "data.txt"
 * @param {struct payment*} pay: pointer to save
 */
void save(struct payment *pay) {
	size_t err;

	// open the file
	FILE* pa = fopen("data.txt", "w+");
	if (pa == NULL) {
		perror("Couldn't open the file");
		exit(-1);
	}

	// write in the file
	err = fwrite(pay, sizeof(*pay), 1, pa);
	if (err == -1) {
		perror("Couldn't write in the file");
		exit(-1);
	}

	// close the file
	err = fclose(pa);
	if (err != 0) {
		perror("Couldn't close the file");
		exit(-1);
	}
}

/**
 * main function
 */
int main(int argc, char const *argv[]) {
	struct payment *pay;

	pay = malloc(sizeof(*pay));
	charge(pay);
	show(pay);
	save(pay);

	free(pay);
	fflush(stdout);
	return 0;
}