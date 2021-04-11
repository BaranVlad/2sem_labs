#include <iostream>
#include <cmath>

extern "C" void get_ln2(double* p, double* ans);
extern "C" void get_fld_ln2(double* ans);

int main() {
	double p;
	double ln2;
	double fld_ln2;

	std::cout << "Enter count of digit after comma\n";
	std::cin >> p;
	std::cout.precision(p);
	p *= 2;
	p = pow(10, -p);

	get_fld_ln2(&fld_ln2);
	get_ln2(&p, &ln2);

	std::cout << "Assembly fldln2:\t" << fld_ln2 << '\n';
	std::cout << "Calculated ln2: \t" << ln2 << '\n';



	return 0;
}

