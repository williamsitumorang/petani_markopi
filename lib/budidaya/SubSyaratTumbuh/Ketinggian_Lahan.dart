import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'ketinggianModel.dart';

class KetinggianPage extends StatelessWidget {
  final String apiUrl = 'http://127.0.0.1:8000/api/budidaya';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ketinggian',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF65451F),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<KetinggianItem>>(
        future: fetchData(apiUrl),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            // Tampilkan data di sini
            final List<KetinggianItem> items = snapshot.data!;
            final KetinggianItem firstItem = items.first;

            return SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              firstItem.deskripsi,
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Deskripsi:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              firstItem.tahapan,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SUMBER ARTIKEL:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              firstItem.sumber_artikel,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16), // Memberikan ruang antara dua card

                    CarouselSlider.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          width: double.infinity,
                          height: 200,
                          child: Image.network(
                            items[0].gambar,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 200.0,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        autoPlay: true,
                      ),
                    ),
                    SizedBox(height: 16),

                    Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Credit Gambar:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              firstItem.credit_gambar,
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Future<List<KetinggianItem>> fetchData(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData =
            json.decode(utf8.decode(response.bodyBytes));

        // Tampilkan respons JSON ke konsol
        print(jsonData
            .map((item) => KetinggianItem.fromJSON(item).gambar)
            .toList());
        return jsonData.map((item) => KetinggianItem.fromJSON(item)).toList();
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception('Failed to load data. Error: $e');
    }
  }
}
