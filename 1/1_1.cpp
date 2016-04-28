#include <iostream>
#include <iomanip>
#include <cmath>
using namespace std;

double factorial(int n) {
  if(n == 0) return 1;
  return n * factorial(n-1);
}

double approximate(double argument, int iterations) {
  double sum = 0;
  for(int k = 0; k <= iterations; k++) {
    sum += pow(argument, k) / factorial(k);
  }
  return sum;
}

int main() {
  for(int i = 3; i <= 30; i+=3) {
    cout << std::setprecision(12) << std::setw(20)  << approximate(-5.5, i) << endl;
  }
  cout << endl;
  for(int i = 3; i <= 30; i+=3) {
    cout << std::setprecision(12) << std::setw(20)  << 1/approximate(5.5, i) << endl;
  }
  cout << endl;
  for(int i = 3; i <= 30; i+=3) {
    cout << std::setprecision(12) << std::setw(20)  << pow(approximate(-0.5, i), 11) << endl;
  }
  return 0;
}
