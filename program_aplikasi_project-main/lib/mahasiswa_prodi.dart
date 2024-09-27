import 'package:flutter/material.dart';
import 'mahasiswa_kelas.dart';
import 'dashboard.dart'; // Import class Dashboard dari file dashboard.dart

void main() {
  runApp(MahasiswaProdi());
}

class MahasiswaProdi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mahasiswa'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Icon kembali
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Dashboard()), // Pindah ke Dashboard
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TeknikKomputerCard(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MahasiswaKelasScreen()),
                );
              },
            ),
            SizedBox(height: 16), // Space between cards
            ManajemenInformatikaCard(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MahasiswaKelasScreen()),
                );
              },
            ),
            SizedBox(height: 16), // Space between cards
            RekayasaPerangkatLunakCard(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MahasiswaKelasScreen()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Kembali ke dashboard.dart
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Handle search button press
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TeknikKomputerCard extends StatelessWidget {
  final VoidCallback onTap; // Menerima fungsi onTap sebagai parameter

  TeknikKomputerCard(
      {required this.onTap}); // Konstruktor yang memerlukan fungsi onTap

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.orange,
        child: InkWell(
          onTap: onTap, // Menggunakan onTap yang diterima dari konstruktor
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/teknik_komputer.png'),
              ),
              title: Text(
                'Teknik Komputer',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ManajemenInformatikaCard extends StatelessWidget {
  final VoidCallback onTap; // Menerima fungsi onTap sebagai parameter

  ManajemenInformatikaCard(
      {required this.onTap}); // Konstruktor yang memerlukan fungsi onTap

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.orange,
        child: InkWell(
          onTap: onTap, // Menggunakan onTap yang diterima dari konstruktor
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/manajemen_informatika.png'),
              ),
              title: Text(
                'Manajemen Informatika',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RekayasaPerangkatLunakCard extends StatelessWidget {
  final VoidCallback onTap; // Menerima fungsi onTap sebagai parameter

  RekayasaPerangkatLunakCard(
      {required this.onTap}); // Konstruktor yang memerlukan fungsi onTap

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.orange,
        child: InkWell(
          onTap: onTap, // Menggunakan onTap yang diterima dari konstruktor
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/rekayasa_perangkat_lunak.png'),
              ),
              title: Text(
                'Rekayasa Perangkat Lunak',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
