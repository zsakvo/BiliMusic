class LyricUtils {
  static int findPositionIndex(List<double> sortedArray, int target) {
    int left = 0;
    int right = sortedArray.length - 1;
    int result = sortedArray.length;

    while (left <= right) {
      int mid = (left + right) ~/ 2;
      if (sortedArray[mid] == target) {
        return mid;
      } else if (sortedArray[mid] > target) {
        result = mid;
        right = mid - 1;
      } else {
        left = mid + 1;
      }
    }

    return result > 1 ? result - 1 : 0;
  }
}
