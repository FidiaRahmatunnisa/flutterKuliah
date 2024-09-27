import 'package:flutter/material.dart';
import 'package:flutter_application_crud/mahasiswa.dart';
import 'package:flutter_application_crud/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService _apiService = ApiService();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _tgllahirController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD MAHASISWA'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _namaController,
                    decoration: const InputDecoration(labelText: 'Nama'),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    controller: _tgllahirController,
                    decoration: const InputDecoration(labelText: 'Tgl Lahir'),
                  ),

                  const SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () async {
                      Mahasiswa newPost = Mahasiswa(
                        id: 0,
                        nama: _namaController.text,
                        email: _emailController.text,
                        tgllahir: _tgllahirController.text,
                      );

                      // Object? await _apiService.createMahasiswa(newPost); // --> kalau ini pada object akan kena, karena perlunya variabel boolean yang menjembatani ke api
                      Object? createdPost =
                          await _apiService.createMahasiswa(newPost);
                      // ignore: avoid_print
                      print('Created Post: $createdPost');  // --> sejauh ini , tidak nampak pengaruhnya dimana
                      // -> demi bersihnya kodingan , hidupin aja

                      _namaController.clear();
                      _emailController.clear();
                      _tgllahirController.clear();

                      setState(() {}); // refresh view
                    },
                    child: const Text('Create Post'),
                  ),
                  
                ],
              ),
            ),
          ),


          Expanded(
            child: FutureBuilder<List<Mahasiswa>?>(
              future: _apiService.getMahasiswa(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.data == null) {
                  return const Text('Data not available');
                } else {
                  List<Mahasiswa> posts = snapshot.data!;
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(posts[index].nama),
                        subtitle: Text(posts[index].email),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () async {
                                // await _apiService.updateMahasiswa(posts[index].id as Mahasiswa);
                                _showUpdateForm(posts[index]);
                                // Refresh UI setelah operasi delete
                                setState(() {
                                  posts.removeAt(index);
                                });
                              },
                            ),

                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () async {
                                // Panggil function deleteMahasiswa from ApiService
                                await _apiService
                                    .deleteMahasiswa(posts[index].id);
                                // Refresh UI setelah operasi delete
                                setState(() {
                                  posts.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),

          ),
        ],
      ),
    );
  }



  void _showUpdateForm(Mahasiswa mahasiswa) {
    // Menetapkan data mahasiswa ke dalam controller
    _namaController.text = mahasiswa.nama;
    _emailController.text = mahasiswa.email;
    _tgllahirController.text = mahasiswa.tgllahir;

    // Menampilkan formulir update menggunakan dialog atau menavigasi ke halaman baru
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Mahasiswa'),
          content: Column(
            children: [
              // Formulir update data
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                controller: _emailController,
                decoration:const InputDecoration(labelText: 'Email'),
              ),
              // TextFormField(
              //   controller: _tgllahirController,
              //   decoration: const InputDecoration(labelText: 'Tgl Lahir'),
              // ),

              // Tombol Simpan
              ElevatedButton(
                onPressed: () async {
                  // Memperbarui data mahasiswa menggunakan _apiService.updateMahasiswa
                  Mahasiswa updatedMahasiswa = Mahasiswa(
                    id: mahasiswa.id,
                    nama: _namaController.text,
                    email: _emailController.text,
                    tgllahir: _tgllahirController.text,
                  );

                  Object? update = await _apiService.updateMahasiswa(updatedMahasiswa);

                  // Refresh UI setelah pembaruan
                  // setState(() {});
                  // Refresh UI setelah pembaruan
                    if (update != null) {
                      setState(() {
                        mahasiswa.nama = _namaController.text;
                        mahasiswa.email = _emailController.text;
                        mahasiswa.tgllahir = _tgllahirController.text;
                      });
                    }

                  // Tutup dialog setelah pembaruan selesai
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context,updatedMahasiswa);
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        );
      },
    );

    
     Expanded(
            child: FutureBuilder<List<Mahasiswa>?>(
              future: _apiService.getMahasiswa(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.data == null) {
                  return const Text('Data not available');
                } else {
                  List<Mahasiswa> posts = snapshot.data!;
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(posts[index].nama),
                        subtitle: Text(posts[index].email),
                      );
                    }
                  );
                }
              }
            ),
          );
  }
}
