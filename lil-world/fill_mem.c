#include <stdio.h>

int main() {
    FILE *f = fopen("mem", "w");

    for (int i = 0; i < 128; i++) {
        for (int j = 0; j < 128; j++) {
            fprintf(f, "%d", 0);
        }
        fprintf(f, "\n");
    }
}
