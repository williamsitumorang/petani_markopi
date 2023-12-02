import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'after_login.dart';


class User {
  final String token;
  final String username;
  final String email;
  final int id; // Tambahkan id

  User({
    required this.token,
    required this.username,
    required this.email,
    required this.id,
  });
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int? petaniId;


  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      final String url = 'http://127.0.0.1:8000/api/login';

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Sedang login..."),
              ],
            ),
          );
        },
        barrierDismissible: false,
      );

      final Map<String, String> data = {
        'username': usernameController.text,
        'password': passwordController.text,
      };

      try {
        final response = await http.post(
          Uri.parse(url),
          body: data,
        );

        Navigator.of(context).pop();

        if (response.statusCode == 200) {
          final Map<String, dynamic> result = json.decode(response.body);

          if (result['success'] == true) {
            User user = User(
              token: result['data']['token'],
              username: result['data']['username'],
              email: result['data']['email'],
              id: result['data']['id'],
            );

            setState(() {
              petaniId = user.id; // Menyimpan id ke dalam petaniId
            });

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SuccessPage(user: user),
              ),
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text(result['message'] ??
                      'Terjadi kesalahan saat melakukan login.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        } else {
          final Map<String, dynamic> result = json.decode(response.body);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(result['message'] ??
                    'Terjadi kesalahan saat melakukan login.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } catch (e) {
        print('Error: $e');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Terjadi kesalahan saat melakukan login.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan nama pengguna (username)';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Kata Sandi'),
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return 'Kata sandi harus memiliki setidaknya 6 karakter';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
