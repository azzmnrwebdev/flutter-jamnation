import 'package:flutter/material.dart';

class ProjekScreen extends StatefulWidget {
  @override
  _ProjekScreenState createState() => _ProjekScreenState();
}

class _ProjekScreenState extends State<ProjekScreen> {
  // Inisialisasi variabel untuk menyimpan konten aktif
  int _currentPage = 1;

  // Konten untuk setiap halaman
  Widget konten1() {
    return Center(child: Text("Ini adalah halaman 1"));
  }

  Widget konten2() {
    return Center(child: Text("Ini adalah halaman 2"));
  }

  // Fungsi untuk mengganti konten berdasarkan halaman yang dipilih
  Widget getContent() {
    switch (_currentPage) {
      case 1:
        return konten1();
      case 2:
        return konten2();
      default:
        return konten1();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projek dengan Konten Berbeda"),
      ),
      body: Column(
        children: [
          // Bagian Tombol untuk navigasi halaman
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    _currentPage = 1; // Set halaman 1
                  });
                },
                icon: Icon(Icons.home,
                    color: _currentPage == 1 ? Colors.blue : Colors.grey),
                label: Text(
                  "Halaman 1",
                  style: TextStyle(
                      color: _currentPage == 1 ? Colors.blue : Colors.grey),
                ),
              ),
              SizedBox(width: 16),
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    _currentPage = 2; // Set halaman 2
                  });
                },
                icon: Icon(Icons.info,
                    color: _currentPage == 2 ? Colors.blue : Colors.grey),
                label: Text(
                  "Halaman 2",
                  style: TextStyle(
                      color: _currentPage == 2 ? Colors.blue : Colors.grey),
                ),
              ),
            ],
          ),
          // Bagian Konten
          Expanded(
            child: getContent(),
          ),
        ],
      ),
    );
  }
}
