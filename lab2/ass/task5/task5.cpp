#include <iostream>

extern "C" int solve5(int a);

int main() {
	int a;
	std::cin >> a;
	std::cout << solve5(a) << '\n';
	return 0;
}
