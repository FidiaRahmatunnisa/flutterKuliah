import 'package:flutter/material.dart';
import 'package:your_app/api_service.dart';

import 'services/api_services.dart'; // Sesuaikan dengan lokasi file ApiService Anda

class DataForm extends StatefulWidget {
  @override
  _DataFormState createState() => _DataFormState();
}

class _DataFormState extends State<DataForm> {
  final ApiService _apiService = ApiService();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Data'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Masukkan data'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _submitData();
              },
              child: Text('Kirim Data'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitData() async {
    String inputData = _controller.text;
    Map<String, dynamic> data = {'inputData': inputData};
    final response = await _apiService.postData(data);
    if (response.statusCode == 200) {
      // Berhasil
      print('Data berhasil dikirim');
    } else {
      // Gagal
      print('Gagal mengirim data');
    }
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    home: DataForm(),
  ));
}
