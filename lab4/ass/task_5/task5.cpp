/* program multiply two matrices */

#include <iostream>

extern "C" void matrix_mult(int matrix1[100][100], int matrix2[100][100],
							int result[100][100], int n, int k, int m,
						   	int i_count);

int main() {
	int n, k, m;
	int matrix1[100][100];
	int matrix2[100][100];
	int result[100][100];

	std::cout << "Enter n, k, m\n";
	std::cin >> n >> k >> m;
	std::cout << '\n';

	std::cout << "Enter first matrix (" << n << 'x' << k << ")\n";
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < k; j++) {
			std::cin >> matrix1[i][j];	
		}
	}
	std::cout << '\n';

	std::cout << "Enter first matrix (" << k << 'x' << m << ")\n";
	for (int i = 0; i < k; i++) {
		for (int j = 0; j < m; j++) {
			std::cin >> matrix2[i][j];
		}
	}
	std::cout << '\n';

	matrix_mult(matrix1, matrix2, result, n, k, m, 100);

	std::cout << "Mult\n";
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			std::cout << result[i][j] << ' ';	
		}
		std::cout << '\n';
	}

	return 0;
}
