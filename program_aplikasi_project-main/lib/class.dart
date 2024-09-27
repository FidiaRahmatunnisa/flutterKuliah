import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dashboard.dart';
import 'class_detail.dart'; // Import CourseInfo from class_detail.dart

class ClassScheduleScreen extends StatefulWidget {
  @override
  _ClassScheduleScreenState createState() => _ClassScheduleScreenState();
}

class _ClassScheduleScreenState extends State<ClassScheduleScreen> {
  late Future<List<ClassScheduleItem>> futureClassSchedule;

  @override
  void initState() {
    super.initState();
    futureClassSchedule = fetchClassSchedule();
  }

  Future<List<ClassScheduleItem>> fetchClassSchedule() async {
    final response =
        await http.get(Uri.parse('http://localhost/flutterYolois/class.php'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data
          .map((item) => ClassScheduleItem(
                kelas: item['nama_kelas'],
                jam: item['jam_kuliah'],
                icon: 'assets/class_icon.png',
              ))
          .toList();
    } else {
      throw Exception('Failed to load class schedule');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class'),
        backgroundColor: const Color.fromARGB(255, 20, 117, 197),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/mahasiswa.png'),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<ClassScheduleItem>>(
        future: futureClassSchedule,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load class schedule'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            return ListView(
              children: [
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Matakuliah',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Jam',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Divider(),
                ...snapshot.data!.map((item) => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseInfo(),
                              ),
                            );
                          },
                          child: item,
                        ),
                        Divider(),
                      ],
                    )),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 20, 117, 197),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ClassScheduleItem extends StatelessWidget {
  final String kelas;
  final String jam;
  final String icon;

  ClassScheduleItem({
    required this.kelas,
    required this.jam,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(icon),
                radius: 20,
              ),
              SizedBox(width: 8),
              Text(
                kelas,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            jam,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ClassScheduleScreen(),
  ));
}
