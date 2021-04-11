#include <iostream>

extern "C" int solve6(int a, int b);

int main() {
	int a, b;
	std::cin >> a >> b;
	std::cout << solve6(a, b) << '\n';
	return 0;
}
