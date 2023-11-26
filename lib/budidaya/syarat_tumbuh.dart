// budidaya.dart
import 'package:flutter/material.dart';
import 'package:petani/budidaya/SubSyaratTumbuh/Ketinggian_Lahan.dart';
import 'package:petani/budidaya/SubSyaratTumbuh/curah_hujan.dart';
import 'package:petani/budidaya/SubSyaratTumbuh/kualitas_tanah.dart';

class SyaratTumbuhPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syarat Tumbuh'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk tombol pertama
                _navigateToSubPage(context, "Ketinggian Lahan");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                backgroundColor: Color(0xFF8E745C),
              ),
              child: Text(
                'Ketinggian Lahan',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk tombol kedua
                _navigateToSubPage(context, "Curah Hujan");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                backgroundColor: Color(0xFF8E745C),
              ),
              child: Text(
                'Curah Hujan',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk tombol ketiga
                _navigateToSubPage(context, "Kualitas Tanah");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                backgroundColor: Color(0xFF8E745C),
              ),
              child: Text(
                'Kualitas Tanah',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _navigateToSubPage(BuildContext context, String subPage) {
    // Implementasikan navigasi ke halaman yang sesuai berdasarkan tombol yang ditekan
    switch (subPage) {
      case "Ketinggian Lahan":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => KetinggianPage()),
        );
        break;

      case "Curah Hujan":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PohonPelindungPage()),
        );
        break;

      case "Kualitas Tanah":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => KualitasTanahPage()),
        );
        break;
      default:
    }
  }
}
