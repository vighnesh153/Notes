#include <iostream>
#include <algorithm>

using namespace std;


int main() {
  int arr[] = { 1, 4, 2, 5, 6, 3};
  sort(arr, arr + 6);

  for (int i = 0; i < 6; ++i) {
    cout << arr[i] << endl;
  }

  // Returns 1 if exist else 0
  cout << "Found 1? " << binary_search(arr, arr + 6, 1) << endl;
  cout << "Found 2? " << binary_search(arr, arr + 6, 2) << endl;
  cout << "Found 3? " << binary_search(arr, arr + 6, 3) << endl;
  cout << "Found 4? " << binary_search(arr, arr + 6, 4) << endl;
  cout << "Found 5? " << binary_search(arr, arr + 6, 5) << endl;
  cout << "Found 6? " << binary_search(arr, arr + 6, 6) << endl;
  cout << "Found 7? " << binary_search(arr, arr + 6, 7) << endl;

  // lower_bound returns a pointer to the location where the element should be.
  // To get index, we should subtract the address of the first element so that
  // we get the offset
  cout << "Found 0 at: " << lower_bound(arr, arr + 6, 0) - arr << endl; // Returns 0  because it should exist at position 0 in given array
  cout << "Found 1 at: " << lower_bound(arr, arr + 6, 1) - arr << endl;
  cout << "Found 2 at: " << lower_bound(arr, arr + 6, 2) - arr << endl;
  cout << "Found 3 at: " << lower_bound(arr, arr + 6, 3) - arr << endl;
  cout << "Found 4 at: " << lower_bound(arr, arr + 6, 4) - arr << endl;
  cout << "Found 5 at: " << lower_bound(arr, arr + 6, 5) - arr << endl;
  cout << "Found 6 at: " << lower_bound(arr, arr + 6, 6) - arr << endl;
  cout << "Found 7 at: " << lower_bound(arr, arr + 6, 7) - arr << endl; // Returns 6 because it should exist at position 6 in given array
  cout << "Found 8 at: " << lower_bound(arr, arr + 6, 8) - arr << endl; // Returns 6 because it should exist at position 6 in given array
  // NOTE: lower_bound returns the first index from left where the element should exist
  // NOTE: Similarly, upper_bound returns the first index from right where the element should exist
}
