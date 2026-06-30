#include <ctime>
#include <unistd.h>
#include <sys/wait.h>
#include <cstdio>
#include <iostream>
#include <cstdlib>
#include <vector>
#include <cstdarg>
#include "prog.h"

#define MAX_INT_AS_STR_LEN 10
#define SIZE 32
#define CAP (128*128/SIZE)

FILE *m;
int everything[CAP];
int curr_index;

int rand_i() {
    return (int) (((float) rand()/(float) RAND_MAX) * 128 * 128);
}

void milky_twilight(int address, int numbr) {
	std::fseek(m, address + 31, SEEK_SET);
    int A[SIZE];
    for (int i = SIZE - 1; i >= 0; i--) {
		A[i] = numbr % 2;
		numbr /= 2;
        std::fprintf(m, "%d", A[i]);
        std::fseek(m, -2, SEEK_CUR);
	}
}

class var {
    private:
        int val         {};
        int index       {};
        int addr        {};
        
        char int_str[MAX_INT_AS_STR_LEN + 1]   {};

    public:

        var(const int value)
        : val   {value}, 
          index {curr_index},
          addr  {curr_index * SIZE}
          {
              milky_twilight(addr, val);
              everything[curr_index] = addr;
              curr_index += 1;
              init_str();
          }
         
        void init_str() {
            int temp = val;
            for (int i = MAX_INT_AS_STR_LEN - 1; i >= 0; i--) {
                int_str[i] = (temp % 10) + '0';
                temp /= 10;
            }
            int_str[MAX_INT_AS_STR_LEN] = '\0';
        }      
        
        int get_addr() const {
            return addr;
        }

        const char *as_str() {

            //std::printf("The (val) as str: %s\n", int_str);
            return const_cast<const char *>(int_str);
        }

        void print() const {
            std::printf("[INDEX]: %d\n[VAL]  : %d\n[ADDR] : %d\n", index, val, addr);
        }


};

void start_new_world() {
    program new_world {"./fill_mem"};
    new_world.set_args("./fill_mem");

    new_world.run();
}

void into(var& A, var& B) {
    program trial {"./banana"};
    trial.set_args("./banana", "-m", A.as_str(), B.as_str());
    
    //trial.show_me();
    trial.run();
}

void plus(var& A, var& B) {
    program edd {"./banana"};
    edd.set_args("./banana", "-e", A.as_str(), B.as_str());

    //edd.show_me();
    edd.run();
}

int main() {

    curr_index = 0;
    m = std::fopen("mem", "r+");
    
    start_new_world();

    var A {1};
    var B {2};
    var C {3};
    var D {4};
    var E {5};
   
    std::printf("(B)\n"); B.print();

    std::printf("\nAddress of A: %d\n", A.get_addr());


    std::printf("\n\nTrying to multiply: \n");
    std::printf("\n(D):\n"); D.print(); 
    std::printf("\n(E):\n"); E.print();
    //A.as_str();


    into(D, E);

    std::printf("\n\nTrying to add: \n");
    std::printf("\n(A): \n"); A.print();

    std::printf("\n(B): \n"); B.print();

    //plus(A, B);
    /*std::srand(time(0));

    int p = rand_i();

    std::printf("%d", p);*/
     
}
