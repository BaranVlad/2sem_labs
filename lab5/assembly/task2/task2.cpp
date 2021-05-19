#include <iostream>

extern "C" void sort_sentence(const char*, char*);

int main() {
	char sentence[100];
	char sorted[100];
	std::cout << "Enter sentence\n";
	std::cin.getline(sentence, 100);

	sort_sentence(sentence, sorted);

	std::cout << sorted;

	return 0;
}

