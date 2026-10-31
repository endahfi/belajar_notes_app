import 'package:flutter/material.dart';

import 'catatan.dart';

/// Form untuk Tambah dan Edit.
/// [awal] kosong (null) untuk Tambah, berisi catatan lama untuk Edit.
class FormPage extends StatefulWidget {
  final Catatan? awal;

  const FormPage({super.key, this.awal});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // TAHAP 2: controller kini berisi teks awal. `late` membuatnya dibuat saat
  // pertama dipakai, sehingga widget.awal sudah tersedia.
  late final judulC = TextEditingController(text: widget.awal?.judul ?? '');
  late final isiC = TextEditingController(text: widget.awal?.isi ?? '');

  String? pesanError;

  // Tugas pertemuan 3: judul tidak boleh kosong.
  void simpan() {
    final judul = judulC.text.trim();
    if (judul.isEmpty) {
      setState(() => pesanError = 'Judul tidak boleh kosong');
      return;
    }
    // Saat Edit, tanggal asli dipertahankan. Saat Tambah, pakai waktu sekarang.
    final tanggal = widget.awal?.tanggal ?? DateTime.now();
    Navigator.pop(context, Catatan(judul, isiC.text.trim(), tanggal));
  }

  @override
  void dispose() {
    judulC.dispose();
    isiC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TAHAP 1: judul menyesuaikan mode Tambah atau Edit.
        title: Text(widget.awal == null ? 'Tambah Catatan' : 'Edit Catatan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: judulC,
              decoration: InputDecoration(
                labelText: 'Judul catatan',
                border: const OutlineInputBorder(),
                errorText: pesanError,
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
              onPressed: simpan,
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
