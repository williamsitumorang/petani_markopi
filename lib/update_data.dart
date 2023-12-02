import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UpdateDataPage extends StatefulWidget {
  @override
  _UpdateDataPageState createState() => _UpdateDataPageState();
}

class _UpdateDataPageState extends State<UpdateDataPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController pengalamanController = TextEditingController();
  TextEditingController ktpController = TextEditingController();
  TextEditingController selfieController = TextEditingController();
  TextEditingController sertifikatController = TextEditingController();

  Future<void> unggahGambar(String jenis) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (jenis == 'KTP') {
          ktpController.text = pickedFile.path!;
        } else if (jenis == 'SELFIE') {
          selfieController.text = pickedFile.path!;
        } else if (jenis == 'SERTIFIKAT') {
          sertifikatController.text = pickedFile.path!;
        }
      });
    }
  }

  Future<void> kirimPengajuan() async {
    final String apiUrl =
        'http://127.0.0.1:8000/api/pengajuan'; // Ganti URL_API dengan URL API Anda

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'deskripsi_pengalaman': pengalamanController.text,
          'foto_ktp': ktpController.text,
          'foto_selfie': selfieController.text,
          'foto_sertifikat': sertifikatController.text,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> result = json.decode(response.body);

        if (result['status'] == 'success') {
          print('Pengajuan berhasil dikirim');
          // Tambahkan logika atau feedback pengguna di sini
        } else {
          print('Gagal mengirim pengajuan: ${result['error']}');
          // Tambahkan logika atau feedback pengguna di sini
        }
      } else {
        print('Gagal mengirim pengajuan: ${response.reasonPhrase}');
        // Tambahkan logika atau feedback pengguna di sini
      }
    } catch (error) {
      print('Error: $error');
      // Tambahkan logika atau feedback pengguna di sini
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Markopi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Form Tambah Pengajuan Admin',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Text('1. Unggah Gambar Kartu Tanda Penduduk'),
            ElevatedButton(
              onPressed: () {
                unggahGambar('KTP');
              },
              child: Text(
                'Unggah Gambar KTP',
                style: TextStyle(
                  color: const Color.fromARGB(255, 249, 249, 249),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF8E745C),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 8),
            Text('2. Upload Gambar Diri'),
            ElevatedButton(
              onPressed: () {
                unggahGambar('SELFIE');
              },
              child: Text(
                'Masukkan Gambar Anda',
                style: TextStyle(
                  color: const Color.fromARGB(255, 249, 249, 249),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF8E745C),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 8),
            Text('3. Masukkan Pengalaman Anda'),
            Card(
              elevation: 4,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: pengalamanController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Harap masukkan teks';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Pengalaman Anda',
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text('4. Unggah gambar Sertifikat Anda'),
            ElevatedButton(
              onPressed: () {
                unggahGambar('SERTIFIKAT');
              },
              child: Text(
                'Unggah Sertifikat',
                style: TextStyle(
                  color: const Color.fromARGB(255, 249, 249, 249),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF8E745C),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: kirimPengajuan,
              child: Text(
                'Kirim Pengajuan',
                style: TextStyle(
                  color: const Color.fromARGB(255, 249, 249, 249),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF8E745C),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
