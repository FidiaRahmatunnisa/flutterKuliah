import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dashboard.dart'; // Import halaman dashboard

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dosen App',
      theme: ThemeData(
        primaryColor: Colors.blue, // Warna biru untuk appbar
      ),
      home: DosenListScreen(),
    );
  }
}

class DosenListScreen extends StatefulWidget {
  @override
  _DosenListScreenState createState() => _DosenListScreenState();
}

class _DosenListScreenState extends State<DosenListScreen> {
  late Future<List<Map<String, dynamic>>> _dosenList;

  @override
  void initState() {
    super.initState();
    _dosenList = _fetchDosenList();
  }

  Future<List<Map<String, dynamic>>> _fetchDosenList() async {
    final response = await http.get(Uri.parse(
        'http://localhost/flutterYolois/dosen.php')); // Ganti URL dengan URL API Anda
    if (response.statusCode == 200) {
      List<dynamic> responseData = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(responseData);
    } else {
      throw Exception('Failed to load dosen list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dosen'),
        backgroundColor:
            Colors.blue, // Memberikan background color biru pada AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigasi ke halaman Dashboard saat tombol back ditekan
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          },
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _dosenList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> dosenList = snapshot.data!;
            return Column(
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'NIP',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 20), // Penambahan jarak horizontal
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Nama',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(), // Garis horizontal
                ListView.builder(
                  shrinkWrap: true, // Agar ListView bisa dibungkus dalam Column
                  itemCount: dosenList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  dosenList[index]['nip'],
                                  textAlign: TextAlign.center,
                                ), // NIP di sebelah kiri
                              ),
                              SizedBox(
                                width: 20,
                              ), // Penambahan jarak horizontal
                              Expanded(
                                flex: 3,
                                child: Text(
                                  dosenList[index]['nama'],
                                  textAlign: TextAlign.center,
                                ), // Nama dosen di sebelah kanan
                              ),
                            ],
                          ),
                          // Tambahkan handling untuk ketika tile dosen di-tap
                          onTap: () {
                            // Tambahkan navigasi atau tindakan lain yang sesuai
                          },
                        ),
                        Divider(), // Menambahkan garis horizontal
                      ],
                    );
                  },
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue, // Memberikan background biru pada BottomAppBar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                // Navigasi ke halaman Dashboard saat tombol home ditekan
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Tambahkan logika untuk tombol pencarian di sini
              },
            ),
          ],
        ),
      ),
    );
  }
}
