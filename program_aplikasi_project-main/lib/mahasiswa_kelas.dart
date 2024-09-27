import 'package:flutter/material.dart';
import 'mahasiswa_prodi.dart'; // Import MahasiswaProdi dari file mahasiswa_prodi.dart
import 'mahasiswa_anggota.dart'; // Import MahasiswaAnggotaScreen dari file mahasiswa_anggota.dart
import 'dashboard.dart'; // Import class Dashboard dari file dashboard.dart

void main() {
  runApp(MahasiswaKelasScreen());
}

class MahasiswaKelasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue, // Warna biru untuk AppBar dan BottomAppBar
      ),
      home: Scaffold(
        appBar: MahasiswaKelasAppBar(title: 'Kelas Mahasiswa'),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue, // Warna biru untuk BottomAppBar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Dashboard()), // Kembali ke Dashboard
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2, // 2 cards kesamping
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            children: [
              MahasiswaKelasCard(
                title: 'Teknik Komputer 1A',
                image: 'assets/ajs.png', // Path gambar untuk Card 1
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MahasiswaKelasScreen(),
                    ),
                  );
                },
              ),
              MahasiswaKelasCard(
                title: 'Teknik Komputer 1B',
                image:
                    'assets/device_condition.png', // Path gambar untuk Card 2
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MahasiswaKelasScreen(),
                    ),
                  );
                },
              ),
              MahasiswaKelasCard(
                title: 'Teknik Komputer 2A',
                image:
                    'assets/device_condition.png', // Path gambar untuk Card 3
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MahasiswaClassTekom2a(),
                    ),
                  );
                },
              ),
              MahasiswaKelasCard(
                title: 'Teknik Komputer 2B',
                image:
                    'assets/device_condition.png', // Path gambar untuk Card 4
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MahasiswaKelasScreen(),
                    ),
                  );
                },
              ),
              MahasiswaKelasCard(
                title: 'Teknik Komputer 3A',
                image:
                    'assets/device_condition.png', // Path gambar untuk Card 5
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MahasiswaKelasScreen(),
                    ),
                  );
                },
              ),
              MahasiswaKelasCard(
                title: 'Teknik Komputer 3B',
                image:
                    'assets/device_condition.png', // Path gambar untuk Card 6
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MahasiswaKelasScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MahasiswaKelasCard extends StatelessWidget {
  final String title;
  final String? image;
  final VoidCallback onTap; // Fungsi onTap yang akan dipanggil saat card diklik

  const MahasiswaKelasCard({
    required this.title,
    required this.image,
    required this.onTap, // Menggunakan parameter onTap
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange, // Warna orange untuk Card
      child: InkWell(
        onTap: onTap, // Menggunakan onTap yang diterima dari konstruktor
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null) // Tampilkan gambar jika image tidak null
                Image.asset(
                  image!,
                  width: 100, // Lebar gambar
                  height: 100, // Tinggi gambar
                ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center, // Menempatkan teks di tengah
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MahasiswaKelasAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  MahasiswaKelasAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MahasiswaProdi(), // Pindah ke MahasiswaProdi
            ),
          );
        },
      ),
      title: Text(title),
      backgroundColor: Colors.blue,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
