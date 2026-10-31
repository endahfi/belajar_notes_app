import 'package:flutter/material.dart';

import 'catatan.dart';

/// PERTEMUAN 2: Widget dasar dan UI daftar catatan.
///
/// Catatan punya judul, isi, dan tanggal (lihat catatan.dart).
/// Tahap 1 sampai 3 ditulis sebagai komentar di dalam build() agar kamu bisa
/// mencobanya satu per satu. Tahap 4 adalah hasil akhir yang aktif.
class HalamanDaftar extends StatefulWidget {
  const HalamanDaftar({super.key});

  @override
  State<HalamanDaftar> createState() => _HalamanDaftarState();
}

class _HalamanDaftarState extends State<HalamanDaftar> {
  // TAHAP 0: data berupa List<Catatan>, bukan lagi List teks.
  final List<Catatan> catatan = [
    Catatan(
      'Belajar Flutter',
      'Target hari ini: selesaikan widget dasar.',
      DateTime(2026, 10, 26),
    ),
    Catatan(
      'Rencana Minggu Ini',
      'Buat satu mini project dan rapikan portofolio.',
      DateTime(2026, 10, 25),
    ),
    Catatan(
      'Ide Proyek',
      'Aplikasi katalog resep dengan pencarian dan favorit.',
      DateTime(2026, 10, 22),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TAHAP 1: Eksperimen Padding, Column, Row, Text, Icon, SizedBox.
    // Ganti `body` di bawah dengan kode ini, lalu ubah angkanya:
    //
    // body: Padding(
    //   padding: const EdgeInsets.all(16),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       const Text('Belajar Flutter'),
    //       const SizedBox(height: 8),
    //       Row(children: const [
    //         Icon(Icons.event),
    //         Text(' 26 Okt 2026'),
    //       ]),
    //     ],
    //   ),
    // ),

    // TAHAP 2: ListView dengan ListTile yang ditulis satu per satu.
    //
    // body: ListView(
    //   children: const [
    //     ListTile(
    //       leading: Icon(Icons.note),
    //       title: Text('Belajar Flutter'),
    //       subtitle: Text('Target hari ini'),
    //     ),
    //     ListTile(title: Text('Ide Proyek')),
    //   ],
    // ),

    // TAHAP 3: ListView.builder yang membaca List `catatan`.
    // Judul dan isi diambil dari objek: catatan[i].judul dan catatan[i].isi.
    // Tanggal juga ada: catatan[i].tanggal (ditampilkan di tahap 4).
    //
    // body: ListView.builder(
    //   itemCount: catatan.length,
    //   itemBuilder: (context, i) {
    //     return ListTile(
    //       leading: const Icon(Icons.note),
    //       title: Text(catatan[i].judul),
    //       subtitle: Text(catatan[i].isi),
    //     );
    //   },
    // ),

    // TAHAP 4 (hasil akhir): ListView.builder + Card dan tombol tambah.
    return Scaffold(
      appBar: AppBar(title: const Text('Catatan Saya')),
      body: ListView.builder(
        itemCount: catatan.length,
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              // leading: Icon(Icons.note),
              title: Text(catatan[i].judul),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    catatan[i].isi,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(formatTanggal(catatan[i].tanggal)),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Belum berfungsi. Diisi di pertemuan 3.
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
