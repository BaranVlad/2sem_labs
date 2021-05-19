#include <iostream>

extern "C" int solve_asm(int a, int b, double* x);

int main() {
	int a, b;
	double x = 0;
	std::cout << "Enter two coff" << '\n';
	std::cin >> a >> b;
	
	int ans = solve_asm(a, b, &x);
	if (ans == 0) {
		std::cout << "x = " << x  << '\n';	
	} else if (ans == 1) {
		std::cout << "no solve" << '\n';
	} else if (ans == 2) {
		std::cout << "all numbers are solves" << '\n';
	}


	return 0;
}


