#include <iostream>

extern "C" void solve_asm(unsigned long long* a, unsigned long long* b, unsigned long long* res);

int main() {
	unsigned long long a;
	unsigned long long b;
	unsigned long long res = 0;

	std::cout << "Enter two numbers" << '\n';
	std::cin >> a >> b;

	solve_asm(&a, &b, &res);

	std::cout << "Program answer\t" << res << '\n';
	std::cout << "Real answer   \t" << a + b << '\n';
	std::cout << "Hex answer    \t" << std::hex << res << '\n';

	return 0;
}
