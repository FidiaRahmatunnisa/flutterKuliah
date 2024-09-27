import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dashboard.dart'; // import class dashboard

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StatusScreen(),
    );
  }
}

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  List data = [];
  List displayedData = [];

  Future fetchData() async {
    final response =
        await http.get(Uri.parse('http://localhost/flutterYolois/status.php'));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        // Remove duplicates
        displayedData = data.toSet().toList();
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
      appBar: AppBar(
        title: Text('Status'),
        backgroundColor: Colors.blue, // background biru pada AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Pindah ke halaman dashboard.dart ketika tombol kembali ditekan
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'No Ruangan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Nama Ruangan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Status',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: displayedData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(displayedData[index]['no_ruangan']),
                      Text(displayedData[index]['nama_ruangan']),
                      Text(displayedData[index]['status']),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
