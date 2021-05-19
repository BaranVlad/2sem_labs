#include <iostream>
#include <cmath>

extern "C" double apow(double* a, double* x);

int main() {
	double a;
	double x;

	std::cout.precision(10);
	std::cout << "Enter number and power\n";
	std::cin >> a >> x;

	std::cout << "C++ pow: \t" << std::pow(a, x) << '\n';
	std::cout << "Assembly:\t" << apow(&a, &x) << '\n';
	
	return 0;
}

