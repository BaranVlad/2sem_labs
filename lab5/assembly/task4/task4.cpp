#include <iostream>

extern "C" void del_symbols(char* str, char sym);

int main() {
	char str[100];
	char sym;
	std::cout << "Enter string and symbol\n";
	std::cin.getline(str, 100);
	std::cin >> sym;

	del_symbols(str, sym);

	std::cout << "New string:\n" << str;

	return 0;
}

