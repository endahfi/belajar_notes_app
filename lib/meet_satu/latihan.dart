// PERTEMUAN 1: Latihan Dart dasar.
//
// Jalankan di terminal:   dart run latihan_dart.dart
// Atau salin ke dartpad.dev dan klik Run.
//
// Kerjakan tahap demi tahap. Setiap tahap punya fungsi sendiri,
// dan semuanya dipanggil dari main() di bagian bawah.

// TAHAP 1: Variabel dan tipe data
void tahap1Variabel() {
  String nama = 'Aisyah';
  int umur = 20;
  double ipk = 3.75;
  bool aktif = true;
  var hobi = ['coding', 'baca'];

  print('$nama, $umur tahun');
  print('IPK: $ipk, aktif: $aktif');
  print(hobi[0]);
  // Output:
  // Aisyah, 20 tahun
  // IPK: 3.75, aktif: true
  // coding
}

// TAHAP 2: Fungsi
String sapa(String nama) {
  return 'Halo, $nama!';
}

void tahap2Fungsi() {
  print(sapa('Aisyah'));
  // Output: Halo, Aisyah!
}

// TAHAP 3: Percabangan if, else if, else
void tahap3Percabangan() {
  int nilai = 82;

  if (nilai >= 90) {
    print('A');
  } else if (nilai >= 75) {
    print('B');
  } else {
    print('Perlu belajar lagi');
  }
  // Output: B
  // Latihan: ganti nilai menjadi 95 dan 60, tebak outputnya dulu.
}

// TAHAP 4: Perulangan for
void tahap4For() {
  for (var i = 1; i <= 3; i++) {
    print('Latihan ke-$i');
  }

  var buah = ['apel', 'jeruk'];
  for (var b in buah) {
    print(b);
  }
  // Output:
  // Latihan ke-1
  // Latihan ke-2
  // Latihan ke-3
  // apel
  // jeruk
}

// TAHAP 5: Perulangan while
void tahap5While() {
  int hitung = 3;

  while (hitung > 0) {
    print(hitung);
    hitung--;
  }
  print('Mulai!');
  // Output: 3, 2, 1, Mulai!
  // Latihan: apa yang terjadi jika baris hitung-- dihapus?
}

void main() {
  tahap1Variabel();
  tahap2Fungsi();
  tahap3Percabangan();
  tahap4For();
  tahap5While();
}
