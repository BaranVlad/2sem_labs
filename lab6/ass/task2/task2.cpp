#include <iostream>
#include <cmath>

extern "C" bool find_root(double* a, double* b, double* c,
						double* l, double* r, 
						double* precision, double* ans);

int main() {
	double a, b, c;
	double l, r;
	double precision;
	double ans;
	
	std::cout << "Input a, b, c coefficients" << '\n';
	std::cin >> a >> b >> c;
	std::cout << "Input left and right bounds of segment" << '\n';
	std::cin >> l >> r;
	std::cout << "Input presicion" << '\n';
	std::cin >> precision;
	precision = pow(10, -precision);

	if (!find_root(&a, &b, &c, &l, &r, &precision, &ans)) {
		std::cout << "No roots on this segment (or incorrect segment)\n";
	} else {
		std::cout << "Root x = " << ans << '\n';
	}

	return 0;
}

