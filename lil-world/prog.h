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

                //std::printf("%s\n", temp);
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
                waitpid(state, NULL, 0);
                return 0;
            }
            return -1;
        }
};
