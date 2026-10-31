import 'package:flutter/material.dart';

import 'catatan.dart';

/// Halaman form untuk menambah catatan (judul dan isi; tanggal otomatis).
/// Parameter [awal] sudah disiapkan untuk Edit di pertemuan 4.
class FormPage extends StatefulWidget {
  final Catatan? awal;

  const FormPage({super.key, this.awal});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // TAHAP 2: dua controller, satu untuk judul dan satu untuk isi.
  final judulC = TextEditingController();
  final isiC = TextEditingController();

  @override
  void dispose() {
    judulC.dispose();
    isiC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Catatan')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: judulC,
              decoration: const InputDecoration(
                labelText: 'Judul catatan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: isiC,
              minLines: 5,
              maxLines: 8,
              decoration: const InputDecoration(
                labelText: 'Isi catatan',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              // Kirim Catatan baru kembali ke halaman daftar.
              // Tanggal diisi otomatis dengan waktu sekarang.
              onPressed: () {
                Navigator.pop(
                  context,
                  Catatan(judulC.text, isiC.text, DateTime.now()),
                );
              },
              child: const Text('Simpan'),
            ),

            // TUGAS : judul tidak boleh kosong.
            // Ganti onPressed di atas dengan:
            //
            // onPressed: () {
            //   if (judulC.text.trim().isNotEmpty) {
            //     Navigator.pop(
            //       context,
            //       Catatan(
            //         judulC.text.trim(),
            //         isiC.text.trim(),
            //         DateTime.now(),
            //       ),
            //     );
            //   }
            // },
          ],
        ),
      ),
    );
  }
}
