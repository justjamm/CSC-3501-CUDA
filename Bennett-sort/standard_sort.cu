

#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <chrono>


int main(void) {

	int data_length = 0;
	std::cout << "Enter length of array: ";
	std::cin >> data_length;
	
	std::random_device rand;
	std::mt19937 gen(rand());
	std::uniform_int_distribution<> dis(1,999);

	long sum = 0;	
	for (int i = 1; i<6; i++) {

		std::vector<int> data(data_length);
		std::generate(data.begin(), data.end(), [&]() { return dis(gen); });

		auto start = std::chrono::high_resolution_clock::now();
		std::sort(data.begin(), data.end());
		auto end = std::chrono::high_resolution_clock::now();
		
		auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
		std::cout << i << ". " << duration.count() << " ms\n";
		

		sum += duration.count();
	}

	sum = sum / 5;
	std::cout << "Average: " << sum << " ms\n";
	return 0;
}
