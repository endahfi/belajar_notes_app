const _bulan = [
  'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
  'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des',
];

/// Mengubah tanggal menjadi teks, contoh: "26 Okt 2026".
String formatTanggal(DateTime t) => '${t.day} ${_bulan[t.month - 1]} ${t.year}';

/// Satu catatan: punya judul, isi, dan tanggal.
///
/// Class adalah cetakan data. Setiap `Catatan(...)` yang dibuat adalah
/// satu objek dengan judul, isi, dan tanggalnya sendiri.
class Catatan {
  final String judul;
  final String isi;
  final DateTime tanggal;

  const Catatan(this.judul, this.isi, this.tanggal);
}
