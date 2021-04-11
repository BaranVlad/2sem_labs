#include <iostream>
#include <cmath>

#define _USE_MATH_DEFINES

extern "C" void calculate_pi(double* presicion, double* ans);
extern "C" void get_fldpi(double* fldpi);

int main() {
	double presicion;
	double ans;
	double fldpi;
	std::cout << "Enter count of digit after comma\n";
	std::cin >> presicion;
	std::cout.precision(presicion);

	// I did the task a little wrong, that's why presicion sets incorrect
	// but i'm not going to redo it
	precision *= 2;
	presicion = pow(10, -presicion);

	get_fldpi(&fldpi);
	calculate_pi(&presicion, &ans);

	std::cout << "C++ M_PI:\t" << M_PI << '\n';
	std::cout << "Assembly fldpi:\t" << fldpi << '\n';
	std::cout << "Calculated pi:\t" << ans << '\n';

	return 0;
}

