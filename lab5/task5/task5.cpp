#include <iostream>

extern "C" void upper_case(char* str);

int main() {
	char str[100];

	std::cout << "Enter string\n";
	std::cin.getline(str, 100);

	upper_case(str);
	std::cout << "Upper case string\n" << str;

	return 0;
}

