#include <iostream>
#include <cstring>
#include <string>
#include <sstream>

extern "C" int array_sum(int* a, int an, 
						int* b, int bn, int* answer, int base);
extern "C" int array_mult(int* a, int an, 
						int* b, int bn, int* answer, int base);

int ReadNum(int number[]) {
	std::cout << "Enter a number:\n";
	std::string str_number;
	char digit;
	int n = 0;

	std::cin >> str_number;
	int len = str_number.size();
	std::stringstream ss(str_number);	
	while (ss >> digit) {
		if (isdigit(digit)) {
			number[len - n - 1] = digit - '0';
		} else if (islower(digit)) {
			number[len - n - 1] = 10 + digit - 'a';
		} else if (isupper(digit)) {
			number[len - n - 1] = 10 + digit - 'A';
		} else {
			std::cout << "Incorrect input\n";
			exit(1);
		}
		n++;	
	}

	return n;
}

void WriteNum(int number[], int n) {
	for (int i = n - 1; i >= 0; --i) {
		if (number[i] >= 10) {
			std::cout << (char)(number[i] - 10 + 'A');
		} else {
			std::cout << number[i];
		}
	}
	
}

int main() {
	int base;
	std::cout << "Enter base:\n";
	std::cin >> base;

	int num1[10000];	
	int n1 = ReadNum(num1);

	int num2[10000];	
	int n2 = ReadNum(num2);

	int sum_num[10000];	
	int n3 = array_sum(num1, n1, num2, n2, sum_num, base);

	int mult_num[10000];
	int n4 = array_mult(num1, n1, num2, n2, mult_num, base);

	std::cout << "Sum:" << '\n';
	WriteNum(sum_num, n3);	
	std::cout << '\n';
	
	std::cout << "Mult:" << '\n';
	WriteNum(mult_num, n4);	
	std::cout << '\n';

	return 0;
}
