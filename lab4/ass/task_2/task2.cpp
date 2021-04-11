#include <iostream>

extern "C" void solve2a(int* a, int n);
extern "C" int solve2b(int* a, int n);

int main() {
	int n;
	std::cin >> n;
	int* a = new int[n];
	int* b = new int[n];

	for (int i = 0; i < n; i++) {
		std::cin >> a[i];
		b[i] = a[i];
	}

	solve2a(a, n);
	solve2b(b, n);
	
	for (int i = 0; i < n; i++) {
		std::cout << a[i] << ' ';
	}	
	std::cout << '\n';

	for (int i = 0; i < n; i++) {
		std::cout << b[i] << ' ';
	}	
	std::cout << '\n';

	
	delete[] a;
	delete[] b;

	return 0;
}
