#include <iostream>
#include <set>

using namespace std;

int main() {
  // 'set' contains all unique values
  // any type can be used to create a set
  set<int> s;
  int arr[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 10 };

  // NOTE:
  // In C++, set is implemented using a balanced binary search tree. So, searching, erasing, inserting
  // for an element is log(N)

  for (int i = 0; i < 10; ++i) {
    s.insert(arr[i]);
  }

  // Accessing elements
  for (set<int>::iterator it = s.begin(); it != s.end(); ++it) {
    cout << *it << endl;
  }
  // alternatively
  for (const auto & it : s) {
      cout << it << endl;
  }

  // Check for existence of an element
  if (s.find(19) == s.end()) {
    cout << "Element not found" << endl;
  } else {
    cout << "Element found" << endl;
  }
}
