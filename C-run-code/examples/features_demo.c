#include <stdio.h>
#include <time.h>

int main(int argc, char **argv) {
    printf("=== Features Demo ===\n");
    printf("Arguments received: %d\n", argc);
    
    for (int i = 0; i < argc; i++) {
        printf("  argv[%d] = %s\n", i, argv[i]);
    }
    
    time_t now = time(NULL);
    printf("\nCurrent time: %s", ctime(&now));
    
    return 0;
}

