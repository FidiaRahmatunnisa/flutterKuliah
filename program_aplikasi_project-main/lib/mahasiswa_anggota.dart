import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'mahasiswa_kelas.dart';
import 'dashboard.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MahasiswaClassTekom2a(),
    );
  }
}

class MahasiswaClassTekom2a extends StatefulWidget {
  @override
  _MahasiswaClassTekom2aState createState() => _MahasiswaClassTekom2aState();
}

class _MahasiswaClassTekom2aState extends State<MahasiswaClassTekom2a> {
  List data = [];

  Future fetchData() async {
    final response =
        await http.get(Uri.parse('http://localhost/flutterYolois/tekom2a.php'));
    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(response.body);
      setState(() {
        data = responseData
            .where((item) => item['nama_kelas'] == 'TEKOM 2A')
            .toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MahasiswaAnggotaAppBar(title: 'Teknik Komputer 2A'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return MahasiswaAnggotaCard(
              title: data[index]['nama'],
              nim: data[index]['nim'],
              image: 'assets/' + data[index]['foto_mahasiswa'],
            );
          },
        ),
      ),
    );
  }
}

class MahasiswaAnggotaCard extends StatelessWidget {
  final String title;
  final String nim;
  final String? image;

  const MahasiswaAnggotaCard({
    required this.title,
    required this.nim,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            if (image != null)
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(image!),
                ),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    nim,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MahasiswaAnggotaAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  MahasiswaAnggotaAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MahasiswaKelasScreen(),
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
