#include <iostream>

extern "C" int solve_asm(int a);

int main() {
	int a;
	std::cin >> a;
	std::cout << solve_asm(a) << '\n';
	
	return 0;
}
