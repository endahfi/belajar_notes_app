import 'package:flutter/material.dart';

import 'catatan.dart';
import 'detail_page.dart';
import 'form_page.dart';

/// PERTEMUAN 3: setState, navigasi, Create, dan Read.
class HalamanDaftar extends StatefulWidget {
  const HalamanDaftar({super.key});

  @override
  State<HalamanDaftar> createState() => _HalamanDaftarState();
}

class _HalamanDaftarState extends State<HalamanDaftar> {
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

  // TAHAP 1 (demo setState, sementara): tambahkan field dan ubah tombol +.
  //
  // int jumlah = 0;
  // appBar: AppBar(title: Text('Catatan: $jumlah')),
  // onPressed: () => setState(() => jumlah++),
  //
  // Hapus setState dan lihat angka tidak berubah. Setelah paham, hapus demo ini.

  // TAHAP 3 (Create): buka FormPage, tunggu Catatan baru, lalu tambahkan ke List.
  Future<void> tambah() async {
    final baru = await Navigator.push<Catatan>(
      context,
      MaterialPageRoute(builder: (_) => const FormPage()),
    );
    if (baru != null) {
      setState(() => catatan.add(baru));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catatan Saya')),
      body: ListView.builder(
        itemCount: catatan.length,
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.note),
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
              // TAHAP 4 (Read): ketuk untuk membuka halaman detail.
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailPage(catatan[i])),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: tambah,
        child: const Icon(Icons.add),
      ),
    );
  }
}
