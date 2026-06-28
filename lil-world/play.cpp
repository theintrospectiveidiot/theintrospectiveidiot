#include <ctime>
#include <unistd.h>
#include <sys/wait.h>
#include <cstdio>
#include <iostream>
#include <cstdlib>
#include <vector>
#include <cstdarg>

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

#define set_args(...) set_args_vec(std::vector<const char *>{__VA_ARGS__}.size(), __VA_ARGS__)
#define MAX 128

class program {
    private:
        const char *bin_file {};
        const char *current_argv[MAX] {};
        const char *current_envp[MAX] {};

    public:
        program(const char *name)
        : bin_file {name} {}
        void set_args_vec(int size, ...) {
            va_list args;

            va_start(args, size);
            
            for (unsigned long i = 0; i < size; i++) {
                const char *temp = va_arg(args, const char *);

                std::printf("%s\n", temp);
                current_argv[i] = temp;
            }

            va_end(args);
            current_argv[size] = nullptr;
        }
        void show_me() {
            std::cout << "executing: [ ";
            const char **p = current_argv;
            while(*p) {
                std::cout << *p << " ";
                p++;
            }
            std::cout << "]\n";
        }
        int run() {

            pid_t state = fork();
            
            if(state == 0) {
                std::cout << "currently in child process and ";
                show_me();
                int r = execve(bin_file, const_cast<char *const *>(current_argv), const_cast<char *const *>(current_envp));

                perror("execve");   /* execve() returns only on error */
                return r;
            }
            else if(state > 0){
                wait(NULL);
                return 0;
            }
            return -1;
        }
};

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
            init_str();

            std::printf("The (val) as str: %s\n", int_str);
            return const_cast<const char *>(int_str);
        }

        void print() const {
            std::printf("[INDEX]: %d\n[VAL]  : %d\n[ADDR] : %d\n", index, val, addr);
        }


};

void into(var& A, var& B) {
    /* for A */

    const char *A_bin {A.as_str()};

    /* for B */

    const char *B_bin {B.as_str()};

    program trial {"./banana"};
    trial.set_args("./banana", "-m", A_bin, B_bin);
    trial.show_me();
    trial.run();
}

int main() {

    curr_index = 0;
    m = std::fopen("mem", "r+");

    var A {6};
    var B {4};
   
    std::printf("(B)\n"); B.print();

    std::printf("\nAddress of A: %d\n", A.get_addr());


    std::printf("\n\nTrying to multiply: \n");
    std::printf("\n(A):\n"); A.print(); 
    std::printf("\n(B):\n"); B.print();
    //A.as_str();


    into(A, B);

    /*std::srand(time(0));

    int p = rand_i();

    std::printf("%d", p);*/
     
}
