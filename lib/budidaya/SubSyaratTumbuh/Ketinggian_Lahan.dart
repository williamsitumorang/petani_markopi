import 'package:flutter/material.dart';

class KetinggianPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ketinggian'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, // <-- Atur crossAxisAlignment menjadi start
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TUJUAN:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Memperhatikan ketinggian lahan perkebunan kopi sangat penting karena memiliki dampak signifikan pada karakteristik rasa dan kualitas biji kopi. Ketinggian yang lebih tinggi umumnya menghasilkan suhu yang lebih rendah, memungkinkan pertumbuhan biji kopi yang lebih lambat dan menciptakan rasa yang lebih kompleks. Varietas tertentu juga lebih baik tumbuh pada ketinggian tertentu, seperti Arabika yang lebih cocok untuk ketinggian yang lebih tinggi. Selain itu, ketinggian lahan juga mempengaruhi resistensi terhadap hama dan penyakit serta konsistensi kualitas biji kopi.',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'TAHAPAN:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Ketinggian minimum untuk menanam kopi adalah 500 meter di atas permukaan laut (mdpl), sedangkan ketinggian maksimum di mana kopi masih bisa tumbuh dan berbuah dengan baik adalah 2000 mdpl. Pemilihan ketinggian yang tepat sangat memengaruhi karakteristik rasa dan kualitas biji kopi. Ketinggian yang lebih tinggi, terutama antara 800 hingga 1.500 mdpl, cenderung menghasilkan kopi Arabika yang memiliki keasaman yang tinggi dan karakteristik rasa yang kompleks. Di sisi lain, ketinggian yang lebih rendah, khususnya di bawah 800 mdpl, dapat lebih cocok untuk budidaya kopi Robusta yang memiliki rasa yang lebih pahit. Oleh karena itu, pemahaman terhadap ketinggian yang tepat menjadi kunci untuk mencapai hasil terbaik sesuai dengan jenis kopi yang dibudidayakan.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16), // Memberikan ruang antara dua card

              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gambar:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Image.asset(
                        'assets/images/ketinggian.png',
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 8),
                      // Tambahkan konten atau widget lainnya sesuai kebutuhan
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16), // Memberikan ruang antara dua card

              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Link Video:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),

                      Text(
                        'https://youtu.be/d9ZEuYNnNtU?si=F2rv1Y0TL9p8nzzwffefefefefefefrge5rhte',
                        style: TextStyle(fontSize: 12),
                      ),
                      // Tambahkan konten atau widget lainnya sesuai kebutuhan
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
