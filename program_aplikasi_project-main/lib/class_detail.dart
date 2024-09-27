import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'class.dart'; // Import the ClassScheduleScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detail Kelas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CourseInfo(),
    );
  }
}

class CourseInfo extends StatefulWidget {
  @override
  _CourseInfoState createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  late Future<List<ClassData>> futureClassData;

  @override
  void initState() {
    super.initState();
    futureClassData = fetchClassData();
  }

  Future<List<ClassData>> fetchClassData() async {
    final response = await http
        .get(Uri.parse('http://localhost/flutterYolois/class_detail.php'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => ClassData.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load class data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Detail Kelas'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ClassScheduleScreen()),
            );
          },
        ),
      ),
      body: FutureBuilder<List<ClassData>>(
        future: futureClassData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load class data'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final classData = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                                'assets/profile_pic.jpg'), // Replace with your image asset path
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  classData.namaKelas,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Card(
                          elevation: 5,
                          color: const Color.fromARGB(255, 20, 117, 197),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                16.0, 24.0, 16.0, 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildInputField(
                                    'Kode Matkul', classData.kodeMatkul),
                                SizedBox(height: 16),
                                _buildInputField(
                                    'Nama Dosen', classData.namaDosen),
                                SizedBox(height: 16),
                                _buildInputField(
                                    'Matakuliah', classData.namaMatkul),
                                SizedBox(height: 16),
                                _buildInputField('Jam', classData.jamKuliah),
                                SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ClassScheduleScreen()),
                                      );
                                    },
                                    child: Text(
                                      'CLOSE',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromARGB(255, 249, 173, 60),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildInputField(String hintText, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: TextEditingController(text: value),
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 57, 182, 240),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
          ),
          readOnly: true,
        ),
      ],
    );
  }
}

class ClassData {
  final String kodeMatkul;
  final String namaDosen;
  final String namaMatkul;
  final String jamKuliah;
  final String namaKelas; // Added field for class name

  ClassData({
    required this.kodeMatkul,
    required this.namaDosen,
    required this.namaMatkul,
    required this.jamKuliah,
    required this.namaKelas,
  });

  factory ClassData.fromJson(Map<String, dynamic> json) {
    return ClassData(
      kodeMatkul: json['kode_matkul'],
      namaDosen: json['nama_dosen'],
      namaMatkul: json['nama_matkul'],
      jamKuliah: json['jam_kuliah'],
      namaKelas: json['nama_kelas'], // Mapping the class name field
    );
  }
}
