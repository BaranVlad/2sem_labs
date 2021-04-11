#include <iostream>

extern "C" int max_num_count(const char* str);

int main() {
	char str[100];
	std::cout << "Enter string\n";
	std::cin.getline(str, 100);
	std::cout << "Max digit in a row is " << max_num_count(str);

	return 0;
}

