import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'schedule.dart'; // Import the ScheduleScreen class

class CourseInfo extends StatefulWidget {
  final String courseName; // Add courseName parameter

  CourseInfo(
      {required this.courseName}); // Constructor with courseName parameter

  @override
  _CourseInfoState createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  List<Map<String, String>> courseData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.post(
      Uri.parse('http://localhost/flutterYolois/schedule_detail.php'),
      body: jsonEncode(
          {'courseName': widget.courseName}), // Pass courseName in the request
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        courseData = (jsonData as List<dynamic>)
            .map((item) => (item as Map<String, dynamic>)
                .map((key, value) => MapEntry(key, value.toString())))
            .toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  void navigateToScheduleScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ScheduleScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Matakuliah'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: navigateToScheduleScreen,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/avatar_image.jpg'),
                  ),
                  SizedBox(width: 20),
                  Text(
                    widget.courseName, // Display courseName in the title
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: courseData.length,
                itemBuilder: (context, index) {
                  final data = courseData[index];
                  return Card(
                    elevation: 5,
                    color: const Color.fromARGB(255, 20, 117, 197),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInputField(
                              'Kode Matakuliah', data['kode_matkul'] ?? ''),
                          SizedBox(height: 10),
                          _buildInputField(
                              'NO RUANGAN', data['no_ruangan'] ?? ''),
                          SizedBox(height: 10),
                          _buildInputField('NAMA DOSEN', data['nama'] ?? ''),
                          SizedBox(height: 10),
                          _buildInputField('JAM', data['jam_kuliah'] ?? ''),
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: navigateToScheduleScreen,
                              child: Text(
                                'CLOSE',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 249, 173, 60),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
