import 'package:flutter/material.dart';

class PemupukanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemupukan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ini adalah halaman Syarat Tumbuh',
              style: TextStyle(fontSize: 20),
            ),
            // Tambahkan konten atau widget lainnya sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
