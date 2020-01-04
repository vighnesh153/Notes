#include <iostream>
#include <string>

using namespace std;

int main() {
  string s = "Vighnesh";
  cout << s << endl;
  // Output: Vighnesh

  // To copy a string
  string s1(s);
  string s1 = s;

  // To create a sub-string
  string s2(s, 2, 4); // Starting from index 2, take 4 characters
  string s2 = s.substr(2, 4);

  // Compare
  s1.compare(s2);
  // 0 => equal
  // -1 => s1 comes before s2 lexicographically
  // 1 => s1 comes after s2 lexicographically

  cout << s1 << endl;
  // Output: Vighnesh
}
