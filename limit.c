#include <stdio.h>
#include <stdlib.h>

int main(int argc,char** argv){
	long long num = 76287755398823936LLU;
	double num_double = (double) num;
	long double num_long_double = (long double) num;
//	numd ++;
//	numd --;
	long long num2 = (long long)num_double;
	printf("size of long double :%d\n", sizeof(long double));
	printf("long long %llu\n", num);
	printf("double: %f\n", num_double);
	printf("long double: %llu\n", *((long long*)(&num_double)));
	printf("atof: %f", atof("76287755398823936"));
}
