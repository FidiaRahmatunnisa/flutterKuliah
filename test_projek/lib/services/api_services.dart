import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  // Ganti URL sesuai dengan alamat publik server EC2 AWS Anda
  final String baseUrl = 'http://52.86.1.253:3000/api';

  Future<http.Response> postData(Map<String, dynamic> data) async {
    try {
      // Kirim permintaan POST ke backend dengan data yang diberikan
      final response = await http.post(
        Uri.parse('$baseUrl/data'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      return response;
    } catch (error) {
      // Tangani kesalahan jika terjadi
      print('Error: $error');
      throw Exception('Gagal mengirim permintaan ke server');
    }
  }
}
