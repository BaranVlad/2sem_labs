#include <iostream>
#include <cmath>
#define _USE_MATH_DEFINES

extern "C" double integral(double* l, double* r);

int main() {
	double l, r;
	l = 0;
	r = 2 * M_PI;

	std::cout << "Calculated integral:\n" << integral(&l, &r);

	return 0;	
}

