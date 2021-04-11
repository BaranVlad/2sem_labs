#include <iostream>

extern "C" int solve1(int* a, int n);

int main() {
	int n;
	std::cin >> n;

	int* a = new int[n];
	for (int i = 0; i < n; i++) {
		std::cin >> a[i];
	}

	std::cout << solve1(a, n) << '\n';

	delete[] a;
	return 0;
}
