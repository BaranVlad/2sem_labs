#include <iostream>

extern "C" int solve_asm(int a);

int main() {
	int a;
	std::cout << "Enter number" << '\n';
	std::cin >> a;
	std::cout << "Answer is" << solve_asm(a) << '\n';
	
	return 0;
}
