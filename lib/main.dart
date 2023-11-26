import 'package:flutter/material.dart';
import 'package:petani/kedaikopi.dart';
import 'package:petani/komunitaspetani.dart';
import 'budidaya.dart';
import 'pascapanen.dart';
import 'kedaikopi.dart';
import 'panen.dart';
import 'penjualan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(101, 69, 31, 1),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'MARKOPI',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF65451F),
          leading: Icon(Icons.menu, color: Colors.white),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        body: MyHomePage(),
      ),
      routes: {
        '/budidaya': (context) => BudidayaPage(),
        '/pascapanen': (context) => PascaPanenPage(),
        '/kedaikopi': (context) =>
            KedaiKopiPage(), // Tambahkan rute untuk halaman KedaiKopiPage
        '/panen': (context) => PanenPage(),
        '/penjualan': (context) => PenjualanPage(),
        '/komunitas': (context) => KomunitasPage(),
        // ... Rute lainnya
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> images = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
  ];

  List<String> captions = [
    "Budidaya",
    "Pasca Panen",
    "Kedai Kopi",
    "Panen",
    "Penjualan",
    "Komunitas Petani",
  ];

  void _navigateToDetailPage(BuildContext context, String caption) {
    String rootPageRoute;
    switch (caption) {
      case "Budidaya":
        rootPageRoute = "/budidaya";
        break;
      case "Pasca Panen":
        rootPageRoute = "/pascapanen";
        break;
      case "Kedai Kopi":
        rootPageRoute = "/kedaikopi";
        break;
      case "Panen":
        rootPageRoute = "/panen";
        break;
      case "Penjualan":
        rootPageRoute = "/penjualan";
        break;
      case "Komunitas Petani":
        rootPageRoute = "/komunitas";
        break;
      // Tambahkan case untuk setiap caption lainnya sesuai dengan rute yang diinginkan
      default:
        rootPageRoute = "/detail";
    }

    Navigator.pushNamed(context, rootPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    const double cardSize = 150.0;
    const double marginValue = 15.0;
    const double spacing = 10.0;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          2,
          (colIndex) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (rowIndex) {
                  int index = colIndex * 3 + rowIndex;
                  return Padding(
                    padding: EdgeInsets.all(spacing),
                    child: Column(
                      children: [
                        Card(
                          child: GestureDetector(
                            onTap: () =>
                                _navigateToDetailPage(context, captions[index]),
                            child: SizedBox(
                              width: cardSize,
                              height: cardSize,
                              child: Padding(
                                padding: EdgeInsets.all(marginValue),
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            captions[index],
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
