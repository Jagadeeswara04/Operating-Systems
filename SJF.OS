#include <stdio.h>

int main() {
    int num;
    printf("Enter the number of processes: ");
    scanf("%d", &num);

    int et[num];
    for (int i = 0; i < numProcesses; i++) {
        printf("Enter the execution time for process %d: ", i + 1);
        scanf("%d", &et[i]);
    }
    int set = et[0];
    int sei = 0;
    for (int i = 1; i < numProcesses; i++) {
        if (executionTimes[i] < smallestExecutionTime) {
            smallestExecutionTime = executionTimes[i];
            smallestExecutionIndex = i;
        }
    }
    printf("Next process to execute: Process %d with execution time %d\n",
           smallestExecutionIndex + 1, smallestExecutionTime);

    return 0;
}
