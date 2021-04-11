#include <iostream>

extern "C" void matrix_trans(int matrix1[100][100], int result[100][100],
							 int n, int m, int i_count);

int main() {
	int n, m;
	int matrix1[100][100];
	int result[100][100];

	std::cout << "Enter n, m\n";
	std::cin >> n >> m;
	std::cout << '\n';

	std::cout << "Enter matrix\n";
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			std::cin >> matrix1[i][j];	
		}
	}
	std::cout << '\n';

	matrix_trans(matrix1, result, n, m, 100);

	std::cout << "Transponent\n";
	for (int i = 0; i < m; i++) {
		for (int j = 0; j < n; j++) {
			std::cout << result[i][j] << ' ';
		}
		std::cout << '\n';
	}
	
	return 0;
}

