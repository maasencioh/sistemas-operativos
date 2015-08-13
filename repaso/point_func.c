#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

int main(int argc, char const *argv[]) {
	struct payment *pay;
	pay = malloc(sizeof(*pay));
	charge(pay);
	show(pay);
	free(pay);
	fflush(stdout);
	return 0;
}