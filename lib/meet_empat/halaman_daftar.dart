import 'package:flutter/material.dart';

import 'catatan.dart';
import 'detail_page.dart';
import 'form_page.dart';

/// PERTEMUAN 4: Update dan Delete. Aplikasi kini mendukung CRUD lengkap.
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

  // CREATE (pertemuan 3)
  Future<void> tambah() async {
    final baru = await Navigator.push<Catatan>(
      context,
      MaterialPageRoute(builder: (_) => const FormPage()),
    );
    if (baru != null) {
      setState(() => catatan.add(baru));
    }
  }

  // TAHAP 4 (Update): buka FormPage berisi catatan lama, lalu ganti isinya.
  Future<void> ubah(int i) async {
    final hasil = await Navigator.push<Catatan>(
      context,
      MaterialPageRoute(builder: (_) => FormPage(awal: catatan[i])),
    );
    if (hasil != null) {
      setState(() => catatan[i] = hasil);
    }
  }

  // TAHAP 5 (Delete): buang catatan pada index i.
  void hapus(int i) {
    setState(() => catatan.removeAt(i));
  }

  // TAHAP 6 (Delete dengan konfirmasi): hapus hanya jika pengguna memilih Hapus.
  Future<void> konfirmasiHapus(int i) async {
    final ya = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('Hapus catatan?'),
        content: Text('"${catatan[i].judul}" akan dihapus.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(c, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(c, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
    if (ya == true) {
      hapus(i);
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
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailPage(catatan[i])),
              ),
              // TAHAP 3: ikon ubah dan hapus di sisi kanan baris.
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => ubah(i),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => konfirmasiHapus(i),
                  ),
                ],
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
