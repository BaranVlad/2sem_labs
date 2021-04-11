#include <iostream>

extern "C" int solve(int a);

int main() {
	int a;

	std::cin >> a;
	std::cout << solve(a) << '\n';

	return 0;
}
