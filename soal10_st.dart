class Mahasiswa implements Comparable<Mahasiswa> {
  String nrp;
  String nama;

  Mahasiswa(this.nrp, this.nama);

  @override
  int compareTo(Mahasiswa other) {
    // Implementasi perbandingan berdasarkan nrp
    return this.nrp.compareTo(other.nrp);
  }

  @override
  String toString() {
    // Representasi string dari objek Mahasiswa
    return 'Mahasiswa(nrp: $nrp, nama: $nama)';
  }
}

void main() {
  // Contoh penggunaan kelas Mahasiswa
  Mahasiswa m1 = Mahasiswa('123456', 'Budi');
  Mahasiswa m2 = Mahasiswa('654321', 'Andi');

  print(m1); // Output: Mahasiswa(nrp: 123456, nama: Budi)
  print(m2); // Output: Mahasiswa(nrp: 654321, nama: Andi)

  // Menggunakan perbandingan
  if (m1.compareTo(m2) < 0) {
    print('${m1.nama} memiliki NRP yang lebih kecil dari ${m2.nama}');
  } else if (m1.compareTo(m2) > 0) {
    print('${m1.nama} memiliki NRP yang lebih besar dari ${m2.nama}');
  } else {
    print('${m1.nama} dan ${m2.nama} memiliki NRP yang sama');
  }
}
