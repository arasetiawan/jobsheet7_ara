import 'package:flutter/material.dart';

class TeksUtama extends StatefulWidget {
  const TeksUtama({Key? key}) : super(key: key);

  @override
  State<TeksUtama> createState() => _TeksUtamaState();
}

class _TeksUtamaState extends State<TeksUtama> {
  var listNama = [
    'ARA SETIAWAN',
    'VINA',
    'ARTHUR',
    'WIDYANA',
    'DANESIA',
    'IMAM',
  ];

  var listWarna = [
    Colors.blue,
    Colors.purple,
    Colors.teal,
    Colors.lime,
    Colors.indigo,
    Colors.deepPurple,
    Colors.cyan,
    Colors.red,
    Colors.yellow
  ];

  int index = 0;

  void incrementIndex() {
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(35, 25), // Posisi bayangan
          ),
        ],
        border: Border.all(
          color: Colors.blue,
          width: 5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Apa kabar',
            textDirection: TextDirection.ltr,
          ),
          Text(
            listNama[index % listNama.length],
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: listWarna[index % listWarna.length],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<_TeksUtamaState> teksUtamaKey = GlobalKey<_TeksUtamaState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STMIK WIDYA UTAMA',
      theme: ThemeData(
        primaryColor: Colors.blue, // Mengatur warna utama (untuk AppBar)
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor:
              Colors.blue, // Mengatur warna latar belakang FloatingActionButton
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('STMIK WIDYA UTAMA'),
          backgroundColor: Colors.blue, // Warna AppBar
        ),
        body: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // Mengatur posisi widget ke atas
            children: [
              TeksUtama(
                  key:
                      teksUtamaKey), // Memasukkan TeksUtama sebagai child pertama dari Column
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Refresh',
          child: const Icon(Icons.refresh),
          onPressed: () {
            teksUtamaKey.currentState?.incrementIndex();
          },
        ),
      ),
    );
  }
}