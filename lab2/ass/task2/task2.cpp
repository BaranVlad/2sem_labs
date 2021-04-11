#include <iostream>

extern "C" int solve(int a, int b, int c, int* x1, int* x2);

int main() {
	int a, b, c;
	int x1, x2;

	std::cin >> a >> b >> c;
	solve(a, b, c, &x1, &x2);
	std::cout << x1 << " " << x2 << '\n';

	return 0;
}
