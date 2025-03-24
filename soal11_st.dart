class Mahasiswa implements Comparable<Mahasiswa> {
  String id;
  String nama;

  Mahasiswa(this.id, this.nama);

  // Implementasi metode compareTo untuk perbandingan
  @override
  int compareTo(Mahasiswa other) {
    return id.compareTo(other.id); // Perbandingan berdasarkan id
  }

  @override
  String toString() {
    return '$id - $nama';
  }
}

class Latihan {
  static void bubbleSort<T extends Comparable<T>>(List<T> arr) {
    int n = arr.length;
    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        if (arr[j].compareTo(arr[j + 1]) > 0) {
          // Tukar posisi elemen
          T temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
        }
      }
    }
  }

  static void display<T>(List<T> data) {
    for (var item in data) {
      print(item);
    }
  }

  static void main() {
    List<Mahasiswa> arr8 = [
      Mahasiswa("02", "Budi"),
      Mahasiswa("01", "Andi"),
      Mahasiswa("04", "Udin"),
      Mahasiswa("03", "Candra")
    ];

    print('Data Sebelum Pengurutan:');
    display(arr8);

    // Menggunakan Stopwatch untuk menghitung waktu eksekusi
    Stopwatch stopwatch = Stopwatch()..start();
    bubbleSort(arr8);
    stopwatch.stop();

    print('Data Setelah Pengurutan:');
    display(arr8);

    // Menampilkan waktu eksekusi dalam milidetik
    print('Waktu: ${stopwatch.elapsedMilliseconds} ms');
  }
}

void main() {
  Latihan.main();
}
