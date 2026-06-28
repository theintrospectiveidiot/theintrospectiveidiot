#include<stdio.h>
#include<string.h>
#include<time.h>
#include"lessgooo.h"



int main(int argc,char* argv[]) {
    if(strcmp(argv[1],"--iamdumb") == 0) {
    	printf("Okay, let's make it easy for you.\nUse -e when you wanna add 2 numbers.\nUse -m when you want the product of 2 numbers.\nSo, your command should be something like './banana -e/m ABCD 0GHY'\nAlso, make sure that you provide the same number of digits for the both the numbers.\nIf they are of different orders of 10, then put zeroes infront of the smaller number to make them of the same no. of digits. Please!!\n(:^ o ^:)\n");
    }
   
	else if(argc < 4) {
		printf("Not enough arguments.\nAdd '--iamdumb' for help.\n(:^v^:)\n");
		return 1;
	}
	else if(argc > 4) {
		printf("Too many arguments\nAdd '--iamdumb' for help.\n(:^v^:)\n");
		return 1;
	}
	else if(argv[1][0] != '-') {
		printf("Wrong syntax.\nAdd '--iamdumb' for help.\n(:^v^:)\n");
	}
	else {
    clock_t start,end;
	int s = strlen(argv[2]);
    int A[s],B[s],C[2*s];
	for(int i=0;i<s;i++) {
		A[i] = argv[2][s-i-1] - '0';
		B[i] = argv[3][s-i-1] - '0';
	}
	for(int i=0;i<2*s;i++) {
		C[i] = 0;
	}
	start = clock();
	
    if(argv[1][1] == 'm')
    bitwise(s,A,B,C);

    else if(argv[1][1] == 'e')
    edd(s,A,B,C);

    else {printf("Command %s not found.\nAdd '--iamdumb' for help.\n(:^v^:)\n",argv[1]);
          return 1;}
	
	end = clock();
    double time = (double)(end - start)/CLOCKS_PER_SEC;
	for(int i=(2*s)-1;i>=0;i--)
	printf("%d%c",C[i],(i == 0) ? 10:32);
    printf("\nTime Taken = %f ms\n",time*1000);
    }
}
