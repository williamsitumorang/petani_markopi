// budidaya.dart
import 'package:flutter/material.dart';
import 'budidaya/syarat_tumbuh.dart'; // Sesuaikan dengan path yang benar
import 'budidaya/pola_tanam.dart'; // Sesuaikan dengan path yang benar
import 'budidaya/pohon_pelindung.dart'; // Sesuaikan dengan path yang benar
import 'budidaya/pembibitan.dart'; // Sesuaikan dengan path yang benar
import 'budidaya/pemupukan.dart'; // Sesuaikan dengan path yang benar
import 'budidaya/pemangkasan.dart'; // Sesuaikan dengan path yang benar
import 'budidaya/hamadanpenyakit.dart'; // Sesuaikan dengan path yang benar
import 'budidaya/sanitasi_kebun.dart'; // Sesuaikan dengan path yang benar

class BudidayaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budidaya'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk tombol pertama
                _navigateToSubPage(context, "Syarat Tumbuh");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                backgroundColor: Color(0xFF8E745C),
              ),
              child: Text(
                'Syarat Tumbuh',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk tombol kedua
                _navigateToSubPage(context, "Pola Tanam");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                backgroundColor: Color(0xFF8E745C),
              ),
              child: Text(
                'Pola Tanam',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk tombol ketiga
                _navigateToSubPage(context, "Pohon Pelindung");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                backgroundColor: Color(0xFF8E745C),
              ),
              child: Text(
                'Pohon Pelindung',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk tombol keempat
                _navigateToSubPage(context, "Pembibitan");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                backgroundColor: Color(0xFF8E745C),
              ),
              child: Text(
                'Pembibitan',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk tombol kelima
                _navigateToSubPage(context, "Pemupukan");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                backgroundColor: Color(0xFF8E745C),
              ),
              child: Text(
                'Pemupukan',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk tombol keenam
                _navigateToSubPage(context, "Pemangkasan");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                backgroundColor: Color(0xFF8E745C),
              ),
              child: Text(
                'Pemangkasan',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk tombol ketujuh
                _navigateToSubPage(context, "Hama dan Penyakit");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                backgroundColor: Color(0xFF8E745C),
              ),
              child: Text(
                'Hama dan Penyakit',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk tombol kedelapan
                _navigateToSubPage(context, "Sanitasi Kebun");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                backgroundColor: Color(0xFF8E745C),
              ),
              child: Text(
                'Sanitasi Kebun',
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
      case "Syarat Tumbuh":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SyaratTumbuhPage()),
        );
        break;
      case "Pola Tanam":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PolaTanamPage()),
        );
        break;
      case "Pohon Pelindung":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PohonPelindungPage()),
        );
        break;
      case "Pembibitan":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PembibitanPage()),
        );
        break;
      case "Pemupukan":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PemupukanPage()),
        );
        break;
      case "Pemangkasan":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PemangkasanPage()),
        );
        break;
      case "Hama dan Penyakit":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HamaPenyakitPage()),
        );
        break;
      case "Sanitasi Kebun":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SanitasiKebunPage()),
        );
        break;
      default:
      // Navigasi default jika caption tidak sesuai
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => DefaultPage()),
      // );
    }
  }
}

// Implementasikan halaman-halaman untuk masing-masing sub page sesuai dengan kebutuhan
// class SyaratTumbuhPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Syarat Tumbuh'),
//       ),
//       body: Center(
//         child: Text('Isi halaman Syarat Tumbuh'),
//       ),
//     );
//   }
// }

// Implementasikan halaman-halaman lainnya seperti PolaTanamPage, PohonPelindungPage, dst.
