/* This program is using for calculating sum of two matrix */

#include <iostream>

extern "C" void matrix_sum(int matrix1[100][100], int matrix2[100][100],
	   						int result[100][100], int n, int m, int i_count);

int main() {
	int n, m;
	int matrix1[100][100];
	int matrix2[100][100];
	int result[100][100];

	std::cout << "Input matrises hegiht and width\n";
	std::cin >> n >> m;
	std::cout << '\n';

	std::cout << "Input first matrix\n";
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			std::cin >> matrix1[i][j];
		}
	}
	std::cout << '\n';

	std::cout << "Input second matrix\n";
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			std::cin >> matrix2[i][j];
		}
	}
	std::cout << '\n';

	matrix_sum(matrix1, matrix2, result, n, m, 100);

	std::cout << "Sum\n";
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			std::cout << result[i][j] << ' ';
		}
		std::cout << '\n';
	}
	
	return 0;
}
