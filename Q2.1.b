#include <stdio.h>
#include <time.h>
#include <stdlib.h>

double multiply_matrices(double **mat1, double **mat2, double **result, int size) {
    struct timespec start_time, end_time;
    timespec_get(&start_time, TIME_UTC);

    int row = 0;
    while (row < size) {
        int col = 0;
        while (col < size) {
            result[row][col] = 0.0;
            int index = 0;
            while (index < size) {
                result[row][col] += mat1[row][index] * mat2[index][col];
                index++;
            }
            col++;
        }
        row++;
    }

    timespec_get(&end_time, TIME_UTC);
    double elapsed = (end_time.tv_sec - start_time.tv_sec) + (end_time.tv_nsec - start_time.tv_nsec) / 1e9;
    return elapsed;
}

int main() {
    struct timespec start, end;
    timespec_get(&start, TIME_UTC);

    int matrix_sizes[] = {64, 128, 256, 512, 1024};
    double time_for_iteration[5];
    double time_for_multiplication[5];

    int iteration = 0;
    while (iteration < 5) {
        struct timespec start_time, end_time;
        timespec_get(&start_time, TIME_UTC);
        int N = matrix_sizes[iteration];

        double **matrix1 = (double **)malloc(N * sizeof(double *));
        double **matrix2 = (double **)malloc(N * sizeof(double *));
        double **result_matrix = (double **)malloc(N * sizeof(double *));
        int row = 0;
        while (row < N) {
            matrix1[row] = (double *)malloc(N * sizeof(double));
            matrix2[row] = (double *)malloc(N * sizeof(double));
            result_matrix[row] = (double *)malloc(N * sizeof(double));
            row++;
        }

        row = 0;
        while (row < N) {
            int col = 0;
            while (col < N) {
                matrix1[row][col] = (double)rand() / RAND_MAX;
                matrix2[row][col] = (double)rand() / RAND_MAX;
                col++;
            }
            row++;
        }

        time_for_multiplication[iteration] = multiply_matrices(matrix1, matrix2, result_matrix, N);
        timespec_get(&end_time, TIME_UTC);
        time_for_iteration[iteration] = (end_time.tv_sec - start_time.tv_sec) + (end_time.tv_nsec - start_time.tv_nsec) / 1e9;

        row = 0;
        while (row < N) {
            free(matrix1[row]);
            free(matrix2[row]);
            free(result_matrix[row]);
            row++;
        }
        free(matrix1);
        free(matrix2);
        free(result_matrix);

        iteration++;
    }

    timespec_get(&end, TIME_UTC);
    double total_elapsed_time = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;
    printf("Total time: %.6f seconds\n", total_elapsed_time);
    printf("Matrix size | Time for iteration | Time for multiplication\n");
    iteration = 0;
    while (iteration < 5) {
        printf("%d          | %.6f            | %.6f\n", matrix_sizes[iteration], time_for_iteration[iteration], time_for_multiplication[iteration]);
        iteration++;
    }

    return 0;
}
