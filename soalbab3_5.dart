import 'dart:math';
import 'dart:io';

void main() {
  // Menu Algoritma Sorting
  print("ALGORITMA SORTING");
  print("1. Insertion");
  print("2. Selection");
  print("3. Bubble");
  print("4. Shell");
  print("5. Quick");
  print("6. Merge");
  stdout.write("Pilihan : ");
  int algoChoice = int.parse(stdin.readLineSync()!);

  // Menu Ascending/Descending
  print("\n1. Ascending");
  print("2. Descending");
  stdout.write("Pilihan : ");
  int orderChoice = int.parse(stdin.readLineSync()!);

  // Generate dataset acak
  List<int> data = generateRandomArray(100);
  if (orderChoice == 2) {
    data = data.reversed.toList(); // Membalikkan data jika Descending dipilih
  }

  // Pilih algoritma berdasarkan input
  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();

  switch (algoChoice) {
    case 1:
      insertionSort(data);
      break;
    case 2:
      selectionSort(data);
      break;
    case 3:
      bubbleSort(data);
      break;
    case 4:
      shellSort(data);
      break;
    case 5:
      quickSort(data);
      break;
    case 6:
      mergeSort(data);
      break;
    default:
      print("Pilihan tidak valid.");
      return;
  }

  stopwatch.stop();
  print("\nWaktu: ${stopwatch.elapsedMilliseconds} ms");

  // Menampilkan hasil sorting
  print("Data setelah disortir: ${data.take(10)}..."); // Menampilkan 10 elemen pertama saja
}

List<int> generateRandomArray(int size) {
  Random random = Random();
  return List<int>.generate(size, (_) => random.nextInt(1000000));
}

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
