#include <iostream>
#include <utility>

using namespace std;

int main() {
  // any type can be used to create a pair
  pair<int, char> p1;
  pair<int, char> p2(1, 'b');

  pair<int, char> p3 = make_pair(3, 'c');

  // Accessing
  cout << p2.first << endl;
  cout << p2.second << endl;
}
