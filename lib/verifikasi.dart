import 'package:flutter/material.dart';
import 'update_data.dart'; // Impor halaman update.dart jika belum diimpor

class VerifikasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Verifikasi'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/background.png'), // Sesuaikan dengan path gambar Anda
            fit: BoxFit
                .cover, // Memastikan bahwa gambar sesuai dengan ukuran halaman
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fasilitator',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Warna teks putih
                ),
              ),
              SizedBox(height: 16),
              
              Card(
                elevation: 4,
                color: Color(0xFF8E745C), // Warna card
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Membantu para petani kopi',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // Warna teks putih
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Memberikan informasi kepada para petani',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // Warna teks putih
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Memberikan pelatihan kepada petani kopi',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // Warna teks putih
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: FloatingActionButton(
          onPressed: () {
            // Aksi yang dijalankan saat tombol "Tambah" ditekan
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      UpdateDataPage()), // Ganti dengan nama halaman yang sesuai
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white, // Warna ikon putih
          ),
          backgroundColor: Color(0xFF8E745C), // Warna background tombol
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50), // Membuat bentuk lingkaran
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
