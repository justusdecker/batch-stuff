#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
    // Check if there are any command-line arguments
    if (argc < 2) {
        printf("Usage: %s [arguments]\n", argv[0]);
        return 1;
    }

    // Iterate through command-line arguments starting from the second one (argv[1])
    for (int i = 1; i < argc; i++) {
        // Check if the argument starts with ':'
        if (argv[i][0] == ':') {
            // Print the ANSI escape code, skipping the leading ':'
            printf("\033[%sm", &argv[i][1]);
        } else {
            // Print the argument itself, followed by a space
            printf("%s ", argv[i]);
        }
    }

    // Print a newline to ensure the output ends cleanly
    printf("\n");

    return 0;
}