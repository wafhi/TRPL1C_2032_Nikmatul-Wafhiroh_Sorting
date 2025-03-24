import 'dart:math';

void main() {
  List<int> datasetSizes = [
    50000, 100000, 150000, 200000, 250000,
    300000, 350000, 400000, 450000, 500000
  ];

  for (var size in datasetSizes) {
    List<int> data = generateRandomArray(size);

    print("\n--- Ukuran Data: $size ---");

    measureSortTime("Insertion", insertionSort, List<int>.from(data));
    measureSortTime("Selection", selectionSort, List<int>.from(data));
    measureSortTime("Bubble", bubbleSort, List<int>.from(data));
    measureSortTime("Shell", shellSort, List<int>.from(data));
    measureSortTime("Quick", quickSort, List<int>.from(data));
    measureSortTime("Merge", mergeSort, List<int>.from(data));
  }
}

List<int> generateRandomArray(int size) {
  Random random = Random();
  return List<int>.generate(size, (_) => random.nextInt(1000000));
}

void measureSortTime(String name, Function(List<int>) sortFunction, List<int> data) {
  DateTime start = DateTime.now();
  sortFunction(data);
  Duration elapsedTime = DateTime.now().difference(start);
  print("$name Sort: ${elapsedTime.inMilliseconds} ms");
}

// Implementasi Sorting

void insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
}

void selectionSort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    int minIdx = i;
    for (int j = i + 1; j < n; j++) {
      if (arr[j] < arr[minIdx]) {
        minIdx = j;
      }
    }
    int temp = arr[minIdx];
    arr[minIdx] = arr[i];
    arr[i] = temp;
  }
}

void bubbleSort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

void shellSort(List<int> arr) {
  int n = arr.length;
  for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
    for (int i = gap; i < n; i++) {
      int temp = arr[i];
      int j;
      for (j = i; j >= gap && arr[j - gap] > temp; j -= gap) {
        arr[j] = arr[j - gap];
      }
      arr[j] = temp;
    }
  }
}

void quickSort(List<int> arr, [int left = 0, int? right]) {
  right ??= arr.length - 1;
  if (left < right) {
    int pivotIndex = partition(arr, left, right);
    quickSort(arr, left, pivotIndex - 1);
    quickSort(arr, pivotIndex + 1, right);
  }
}

int partition(List<int> arr, int left, int right) {
  int pivot = arr[right];
  int i = left - 1;
  for (int j = left; j < right; j++) {
    if (arr[j] <= pivot) {
      i++;
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }
  int temp = arr[i + 1];
  arr[i + 1] = arr[right];
  arr[right] = temp;
  return i + 1;
}

void mergeSort(List<int> arr, [int left = 0, int? right]) {
  right ??= arr.length - 1;
  if (left < right) {
    int mid = (left + right) ~/ 2;
    mergeSort(arr, left, mid);
    mergeSort(arr, mid + 1, right);
    merge(arr, left, mid, right);
  }
}

void merge(List<int> arr, int left, int mid, int right) {
  List<int> leftArr = arr.sublist(left, mid + 1);
  List<int> rightArr = arr.sublist(mid + 1, right + 1);

  int i = 0, j = 0, k = left;

  while (i < leftArr.length && j < rightArr.length) {
    if (leftArr[i] <= rightArr[j]) {
      arr[k++] = leftArr[i++];
    } else {
      arr[k++] = rightArr[j++];
    }
  }

  while (i < leftArr.length) {
    arr[k++] = leftArr[i++];
  }

  while (j < rightArr.length) {
    arr[k++] = rightArr[j++];
  }
}
