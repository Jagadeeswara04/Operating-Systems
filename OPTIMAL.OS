#include <stdio.h>
#include <stdbool.h>

bool isPageInMemory(int page, int *memory, int numFrames) 
{
    for (int i = 0; i < numFrames; i++) 
	{
        if (memory[i] == page)
   	    {  
            return true;
        }
    }
    return false;
}

int findPageWithLongestFuture(int *pages, int numPages, int *memory, int numFrames, int start) {
    int index = -1;
    int farthest = start;
    for (int i = 0; i < numFrames; i++) {
        int j;
        for (j = start; j < numPages; j++) {
            if (memory[i] == pages[j]) {
                if (j > farthest) {
                    farthest = j;
                    index = i;
                }
                break;
            }
        }
        if (j == numPages) {
            return i;
        }
    }
    return (index == -1) ? 0 : index;
}

int pageReplacementOptimal(int *pages, int numPages, int numFrames) {
    int memory[numFrames];
    int faults = 0;

    for (int i = 0; i < numFrames; i++) {
        memory[i] = -1; // Initialize memory slots to -1 (empty)
    }

    for (int i = 0; i < numPages; i++) {
        printf("Referencing Page %d: ", pages[i]);

        if (!isPageInMemory(pages[i], memory, numFrames)) {
            int pageToReplace = findPageWithLongestFuture(pages, numPages, memory, numFrames, i + 1);
            memory[pageToReplace] = pages[i];
            faults++;
            printf("Page Fault (Page %d replaced)\n", memory[pageToReplace]);
        } else {
            printf("No Page Fault\n");
        }
    }

    return faults;
}

int main() {
    int numFrames = 3;
    int numPages = 9;
    int pages[] = {4, 7, 6, 1, 7, 6, 2, 7, 2};

    int faults = pageReplacementOptimal(pages, numPages, numFrames);
    printf("\nTotal Page Faults: %d\n", faults);

    return 0;
}
