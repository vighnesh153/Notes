#include <iostream>
#include <vector>

using namespace std;

int main() {
  vector<int> arr(5);

  for (int i = 0; i < arr.size(); ++i) {
    arr[i] = i + 1;
    // arr.push_back(i + 1);
  }

  // Another way to iterate over a vector using a iterator.
  for (vector<int>::iterator iterator = arr.begin(); iterator != arr.end(); ++iterator) {
    int elem = *iterator;
    cout << elem << endl;
  }
}
