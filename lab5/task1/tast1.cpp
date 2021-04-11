#include <iostream>

extern "C" bool is_polindrome(const char*);

int main() {
	char str[100];
	std::cout << "Enter string\n";
	std::cin >> str;
	std::cout << is_polindrome(str) << '\n';
	return 0;
}
