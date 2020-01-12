/*
 *
 * Simple thread example: the main thread spawns another
 * thread to asynchronously perform a simple operation
 * (multiplying two numbers).
 *
 * This example highlights C++11's async() function,
 * and how we can easily retrieve the return value
 * of a thread.
 *
 */

#include <chrono>
#include <future>
#include <iostream>
#include <thread>
using namespace std;

int multiply(int a, int b) { return a * b; }

int main(int argc, char *argv[])
{
	auto a = async(multiply, 2, 3);

	int v = a.get();

	cout << "The thread returned " << v << endl;

	return 0;
}
