#include <iostream>
#include <unordered_map>

using namespace std;

int main() {
  // Key-value pair. Same as dictionary in Python
  unordered_map<int, int> frequency;
  int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2};

  // NOTE:
  // In C++, unordered_map is implemented using a HashTable. So, searching, erasing, inserting
  // for a key-value is O(1) in average case and O(N) in for worst case.

  for (int i = 0; i < 12; ++i) {
    // frequency.insert(make_pair(arr[i], 1))
    frequency[arr[i]]++;
  }

  frequency.erase(2);

  for (unordered_map<int, int>::iterator it = frequency.begin(); it != frequency.end(); ++it) {
    cout << it->first << ": " << it->second << endl;
    // cout << (*it).first << ": " << (*it).second << endl;   // (*it) will return a pair
  }
}
