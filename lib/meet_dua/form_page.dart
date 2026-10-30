import 'package:flutter/material.dart';

import 'catatan.dart';

/// Halaman form. Dibuat lengkap di pertemuan 3.
/// [awal] berisi catatan lama untuk Edit (pertemuan 4), kosong untuk Tambah.
class FormPage extends StatefulWidget {
  final Catatan? awal;

  const FormPage({super.key, this.awal});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Catatan')),
      body: const Center(child: Text('Form catatan dibuat di pertemuan 3.')),
    );
  }
}
