import 'package:flutter/material.dart';

void main() {
  runApp(const Uts());
}

var nip = "";
var nama = "";
var alamat = "";
var gol = "";
var tgl = "";
var gapok = 0.0;
var tunj = 0.0;
var gaji_bersih = 0.0;

class Uts extends StatefulWidget {
  const Uts({super.key});
  @override
  State<Uts> createState() => _UtsState();
}

class _UtsState extends State<Uts> {
  final TextEditingController nipController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController golController = TextEditingController();
  final TextEditingController tglController = TextEditingController();

  List<String> options = ['golongan', 'IIIA', 'IIIB'];
  String selectedOption = 'golongan';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("UTS"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // alignment: Alignment.centerLeft,
            children: [
              const Text('Nip'),
              TextField(
                autocorrect: true,
                decoration: const InputDecoration(
                  // hintText: "Nip",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    nip = value;
                    // Calculate the `rata` variable.
                    if (gol == "IIIA") {
                      gapok = 1000000.0;
                      tunj = 0.05 * gapok;
                      gaji_bersih = gapok + tunj;
                    } else if (gol == "IIIB") {
                      gapok = 2000000.0;
                      tunj = 0.05 * gapok;
                      gaji_bersih = gapok + tunj;
                    }
                    ;
                  });
                  // ignore: avoid_print
                  print(nip);
                },
                controller: nipController,
              ),
              const Text(
                'Nama',
              ),
              TextField(
                autocorrect: true,
                decoration: const InputDecoration(
                  // hintText: "Nama",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    nama = value;
                    // Calculate the `rata` variable.
                    if (gol == "IIIA") {
                      gapok = 1000000.0;
                      tunj = 0.05 * gapok;
                      gaji_bersih = gapok + tunj;
                    } else if (gol == "IIIB") {
                      gapok = 2000000.0;
                      tunj = 0.05 * gapok;
                      gaji_bersih = gapok + tunj;
                    }
                    ;
                  });
                  // ignore: avoid_print
                  print(nama);
                },
                controller: namaController,
              ),
              const Text(
                'Alamat',
              ),
              TextField(
                autocorrect: true,
                decoration: const InputDecoration(
                  // hintText: "Ala",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    alamat = value;
                    // Calculate the `rata` variable.
                    if (gol == "IIIA") {
                      gapok = 1000000.0;
                      tunj = 0.05 * gapok;
                      gaji_bersih = gapok + tunj;
                    } else if (gol == "IIIB") {
                      gapok = 2000000.0;
                      tunj = 0.05 * gapok;
                      gaji_bersih = gapok + tunj;
                    }
                    ;
                  });
                  // ignore: avoid_print
                  print(alamat);
                },
                controller: alamatController,
              ),
              const Text(
                'Golongan',
              ),

              // TextField(
              //   autocorrect: true,
              //   decoration: const InputDecoration(
              //     // hintText: "",
              //     border: OutlineInputBorder(),
              //   ),
              //   autofocus: true,
              //   onChanged: (value) {
              //     setState(() {
              //       gol = value;

              //       if (gol == "IIIA") {
              //         gapok = 1000000.0;
              //         tunj = 0.05 * gapok;
              //         gaji_bersih = gapok + tunj;
              //       }else if(gol == "IIIB" ){
              //         gapok = 2000000.0;
              //         tunj = 0.05 * gapok;
              //         gaji_bersih = gapok + tunj;
              //       };

              //     });
              //     // ignore: avoid_print
              //     print(gol);
              //   },
              //   controller: golController,
              // ),

              DropdownButton<String>(
                value: selectedOption,
                items: options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    gol = value!;

                    if (gol == "IIIA") {
                      gapok = 1000000.0;
                      tunj = 0.05 * gapok;
                      gaji_bersih = gapok + tunj;
                    } else if (gol == "IIIB") {
                      gapok = 2000000.0;
                      tunj = 0.05 * gapok;
                      gaji_bersih = gapok + tunj;
                    }
                    ;

                    selectedOption = value;
                  });
                },
                underline:Container(), // Menghilangkan garis bawah bawaan ComboBox
                // icon: Icon(Icons.arrow_drop_down), // Menambahkan ikon dropdown
                iconSize: 24, // Ukuran ikon dropdown
                style: TextStyle(
                fontSize: 16, color: Colors.black), // Ukuran teks ComboBox
                isExpanded: true, // Mengatur ComboBox agar memenuhi lebar yang diberikan
                // decoration: InputDecoration( // Menambahkan border bold pada ComboBox
                // contentPadding: EdgeInsets.symmetric(horizontal: 20),
                // border: OutlineInputBorder( // Mengatur border ComboBox
                //   borderRadius: BorderRadius.circular(10),
                //   borderSide: BorderSide( // Menambahkan border bold di sini
                //     color: Colors.black, // Warna border
                //     width: 2.0, // Lebar border (2.0 adalah contoh lebar)
                  // ),
                ),
              // ),),

              const Text(
                'Tanggal',
              ),
              TextField(
                autocorrect: true,
                decoration: const InputDecoration(
                  // hintText: "",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(
                    () {
                      tgl = value;
                      // Calculate the `rata` variable.
                      if (gol == "IIIA") {
                        gapok = 1000000.0;
                        tunj = 0.05 * gapok;
                        gaji_bersih = gapok + tunj;
                      } else if (gol == "IIIB") {
                        gapok = 2000000.0;
                        tunj = 0.05 * gapok;
                        gaji_bersih = gapok + tunj;
                      }
                      ;
                    },
                  );
                  // ignore: avoid_print
                  print(tgl);
                },
                controller: tglController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Builder(
                    builder: (context) {
                      return ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyResult(),
                              ),
                            );
                          },
                          child: const Text("Ok"));
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        nipController.clear();
                        namaController.clear();
                        alamatController.clear();
                        golController.clear();
                        tglController.clear();
                        nip = "";
                        nama = "";
                        alamat = "";
                        gol = "";
                        tgl = "";
                        gapok = 0.0;
                        tunj = 0.0;
                        gaji_bersih = 0.0;
                        // rata = 0.0;
                      });
                    },
                    child: const Text("Reset"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyResult extends StatelessWidget {
  const MyResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Result"),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Result"),
              const SizedBox(
                height: 20,
              ),
              // TextField(
                 
              // ),
              Text("Nip : $nip"),
              const SizedBox(
                height: 20,
              ),
              Text("Nama: $nama"),
              const SizedBox(
                height: 20,
              ),
              Text("Alamat: $alamat"),
              const SizedBox(
                height: 20,
              ),
              Text("Golongan: $gol"),
              const SizedBox(
                height: 20,
              ),
              Text("Tanggal: $tgl"),
              const SizedBox(
                height: 20,
              ),
              Text("gaji pokok: $gapok"),
              const SizedBox(
                height: 20,
              ),
              Text("Tunjangan anak dan istri: $tunj"),
              const SizedBox(
                height: 20,
              ),
              Text("Gaji Bersih : $gaji_bersih"),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
