import 'package:flutter/material.dart';

import 'catatan.dart';

/// Halaman detail. Dibuat lengkap di pertemuan 3.
class DetailPage extends StatelessWidget {
  final Catatan catatan;

  const DetailPage(this.catatan, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: const Center(child: Text('Detail catatan dibuat di pertemuan 3.')),
    );
  }
}
