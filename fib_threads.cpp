#include <iostream>
#include <thread>
void fib(int *result, int n)
{
  int x, y;
  if (n < 2)
    *result = n;
  else
  {
    int x, y;
    std::thread t1(fib, &x, n - 1);
    // std::thread t2 (fib, &y, n-2);
    fib(&y, n - 2);
    t1.join();
    // t2.join();
    *result = x + y;
  }
}

int main()
{
  int N = 20;
  int *result = new int;
  fib(result, N);
  std::cout << "Fib(" << N << ") =" << *result;
}
