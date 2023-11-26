import 'package:flutter/material.dart';

class KualitasTanahPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kualitas Tanah'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ini Kualitas Tanah',
              style: TextStyle(fontSize: 20),
            ),
            // Tambahkan konten atau widget lainnya sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
