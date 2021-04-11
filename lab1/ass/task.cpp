#include <iostream>

extern "C" int solve_asm(long long* a, int* b, int* ch, int* ost); 

int main() {
	long long a;
	int b;

	int ch;
	int ost;
	
	std::cout << "Enter numbers" << '\n';
	std::cin >> a >> b;

	solve_asm(&a, &b, &ch, &ost);
	std::cout << "Private:\t" << ch << '\n';
	std::cout << "Quotient:\t" << ost << '\n';
	return 0;
}
