import 'package:flutter/material.dart';

import 'catatan.dart';

/// Halaman detail: menampilkan judul, tanggal, dan isi satu catatan.
class DetailPage extends StatelessWidget {
  final Catatan catatan;

  const DetailPage(this.catatan, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              catatan.judul,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 4),
            Text(
              formatTanggal(catatan.tanggal),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              catatan.isi,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
