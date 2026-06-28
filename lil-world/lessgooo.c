#include<stdio.h>

void carry(int *a,int *b)
{
if(*a>=10){*b += *a / 10;
          *a = *a % 10;}
}

void edd(int s,int A[],int B[],int C[]) {
	int a = 0;
	for(int i=0;i<s;i++) {
		C[i] += A[i] + B[i];
		carry(&C[i],&C[i+1]);
    }
}

void bitwise(int s,int A[],int B[], int C[]) {

int SIZE = s;

int p = 0;

for(int i=0;i<SIZE;i++)
{
for(int j=0;j<SIZE;j++){ p = (A[j])*(B[i]);
                         C[i + j] += p%10;
           	    	     carry(&C[i+j],&C[i+j+1]);
		                 C[i + j + 1] += p/10;
		                 //printf("p = %d*%d = %d\t",A[j],B[i],p);
		                 //for(int k=(SIZE*2)-1;k>=0;k--)
		                	//printf("%d",C[k]);
		                //printf("%c%c",32,32);
                        }
//printf("\n");
}
}
