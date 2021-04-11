#include <iostream>

extern "C" int solve_asm(long long* a, int* b); 

int main() {
	long long a;
	int b;
	std::cin >> a >> b;
	std::cout << solve_asm(&a, &b) << '\n';
	return 0;
}
