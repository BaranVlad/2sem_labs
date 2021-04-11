#include <iostream>

extern "C" int solve4(int a);

int main() {
	int a;
	std::cin >> a;
	std::cout << solve4(a) << '\n';
	return 0;
}
