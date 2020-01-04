#include <iostream>
#include <map>

using namespace std;

int main() {
  // Key-value pair. Same as dictionary in Python
  map<int, int> frequency;
  int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2};

  // NOTE:
  // In C++, map is implemented using a balanced binary search tree. So, searching, erasing, inserting
  // for a key-value is log(N)

  for (int i = 0; i < 12; ++i) {
    // frequency.insert(make_pair(arr[i], 1))
    frequency[arr[i]]++;
  }

  frequency.erase(2);

  for (map<int, int>::iterator it = frequency.begin(); it != frequency.end(); ++it) {
    cout << it->first << ": " << it->second << endl;
    // cout << (*it).first << ": " << (*it).second << endl;   // (*it) will return a pair
  }
}
