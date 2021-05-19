#include <iostream>
#include <cmath>

extern "C" void sequence_1(double* x, double* y, double* ans);
extern "C" void sequence_2(double* x, double* y, double* ans);
extern "C" void sequence_3(double* x, double* y, double* ans);

int main() {
	double x, y;
	double ans = 0;
	std::cout.precision(10);
	std::cout << "Enter x, y\n";
	std::cin >> x >> y;
// 1
	double tg = tan(x/y);
	std::cout << "1)\n";
	std::cout << "C++ answer: " << x*x*tg + y*y*(1./tg) << '\n';
	
	sequence_1(&x, &y, &ans);
	std::cout << "Assembly answer: " << ans << "\n\n";
// 2
	std::cout << "2)\n";
	std::cout << "C++ answer: " << (x*y + y*log2(x)) / atan(x/y) << '\n';
	
	ans = 0;
	sequence_2(&x, &y, &ans);
	std::cout << "Assembly answer: " << ans << "\n\n";
// 3	
	std::cout << "3)\n";
	std::cout << "C++ answer: " << fabs(x - y) * std::cos(x/y + y/x) << '\n';
	
	ans = 0;
	sequence_3(&x, &y, &ans);
	std::cout << "Assembly answer: " << ans << "\n\n";

	return 0;
}


