import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double halfScreenHeight = screenHeight / 2;

    return Scaffold(
      body: Column(
        children: [
          // Bagian atas (setengah bagian gambar)
          Container(
            width: double.infinity,
            height: halfScreenHeight, // Memenuhi setengah bagian atas layar
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/petani1.jpg',
                ),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: halfScreenHeight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Color(0xFF65451F),
                      ],
                      stops: [0.0, 0.5, 1.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        // Kembali ke halaman sebelumnya
                        Navigator.pop(context);
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 28.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'William Situmorang',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Petani Kopi Arabica',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bagian bawah (setengah bagian deskripsi)
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF65451F),
                    const Color.fromARGB(
                        255, 49, 47, 47), // Warna latar belakang deskripsi
                  ],
                  stops: [0.0, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft, // Atur posisi teks ke kiri atas
                child: Text(
                  'Deskripsi Profil Anda\nTambahkan deskripsi profil Anda di sini.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white, // Warna teks deskripsi
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
