#include <iostream>
#include <algorithm>

using namespace std;

struct Interval {
  int start;
  int end;
};

bool my_compare_func(Interval i1, Interval i2) {
  return i1.start < i2.start;
}

int main() {
  int arr[] = { 1, 4, 2, 5, 6, 3};

  // sort from where to where
  sort(arr + 2, arr + 6);

  // sort in descending order
  sort(arr, arr + 6, greater<int>());

  for (int i = 0; i < 6; i++) {
    cout << arr[i] << endl;
  }

  // Custom compare
  Interval intervals[] = { {6, 4}, {3, 7}, { 7, 4}, {1, 3} };
  sort(intervals, intervals + 4, my_compare_func);
  for (int i = 0; i < 4; i++) {
    cout << intervals[i].start << " " << intervals[i].end << endl;
  }
}
