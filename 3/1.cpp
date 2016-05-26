#include <iostream>
#include <valarray>

using namespace std;

//test function definition
double f(double x) {
  return 1 / (x*x);
}

double myQuadratur1D(double (*f)(double), valarray<double>& w, valarray<double>& p) {
  //calculate b-a and multiply weights
  w *= p[p.size()-1] - p[0];

  //multiply weights with function values and sum up
  return (w * p.apply(f)).sum();
}

void myQuadratur1DTest() {
  //define points and weights
  valarray<double> p1 { 0.5, 1 };
  valarray<double> w1 { 0.5, 0.5 };
  //execute function
  cout << myQuadratur1D(f, w1, p1) << endl;

  valarray<double> p2 { 0.5, 0.75, 1 };
  valarray<double> w2 { 1.0/6, 2.0/3, 1.0/6 };
  cout << myQuadratur1D(f, w2, p2) << endl;

  valarray<double> p3 { 0.5, 4.0/6, 5.0/6, 1 };
  valarray<double> w3 { 1.0/8, 3.0/8, 3.0/8, 1.0/8 };
  cout << myQuadratur1D(f, w3, p3) << endl;
}

int main() {
  myQuadratur1DTest();
  return 0;
}
