import 'package:flutter/material.dart';

void main() {
  runApp(MyUtsTest());
}

var id = "";
var nama = "";
var awal = 0.0;
var akir = 0.0;
var total_meter = 0.0;
var total_biaya = 0.0;
var pajak = 0.0;
var total = 0.0;

class MyUtsTest extends StatefulWidget {
  @override
  State<MyUtsTest> createState() => _MyUtsTestState();
}

class _MyUtsTestState extends State<MyUtsTest> {
  final TextEditingController IdController = TextEditingController();
  final TextEditingController NamaController = TextEditingController();
  final TextEditingController AwalController = TextEditingController();
  final TextEditingController AkirController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("PDAM PADANG"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('images/pdam.png'),
              Text(" PDAM PADANG  ", style: TextStyle(backgroundColor: Colors.amberAccent, fontSize: 30, ),),
             
              Text('Id Pelanggan'),
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  // hintText: "id pelanggan",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    id = value;
                    // Calculate the `rata` variable.
                    total_meter = (akir - awal);
                    total_biaya = total_meter * 5000;
                    pajak = 0.05 * total_biaya;
                    total = total_biaya + pajak;
                  });
                  print(id);
                },
                controller: IdController,
              ),
              Text(
                'Nama Pelanggan',
              ),
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  // hintText: "Nama",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    nama = value;
                    // Calculate the `rata` variable.
                    total_meter = (akir - awal);
                    total_biaya = total_meter * 5000;
                    pajak = 0.05 * total_biaya;
                    total = total_biaya + pajak;
                  });
                  print(nama);
                },
                controller: NamaController,
              ),
              Text(
                'Meteran Awal',
              ),
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  // hintText: "awal",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    awal = double.parse(value);
                    // Calculate the `rata` variable.
                    total_meter = (akir - awal);
                    total_biaya = total_meter * 5000;
                    pajak = 0.05 * total_biaya;
                    total = total_biaya + pajak;
                  });
                  print(awal);
                },
                controller: AwalController,
              ),
              Text(
                'Meteran Akhir',
              ),
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  // hintText: "akhir",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    akir = double.parse(value);
                    // Calculate the `rata` variable.
                    total_meter = (akir - awal);
                    total_biaya = total_meter * 5000;
                    pajak = 0.05 * total_biaya;
                    total = total_biaya + pajak;
                  });
                  print(akir);
                },
                controller: AkirController,
              ),
              // Text('java', ),
              // TextField(
              //   autocorrect: true,
              //   decoration: InputDecoration(
              //     hintText: "Java",
              //     border: OutlineInputBorder(),
              //   ),
              //   autofocus: true,
              //   onChanged: (value) {
              //     setState(
              //       () {
              //         Java = int.parse(value);
              //         // Calculate the `rata` variable.
              //         rata = (MTK + Algo + Java) / 3.0;
              //       },
              //     );
              //     print(Java);
              //   },
              //   controller: JavaController,
              // ),
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
                                builder: (context) => MyHasil(),
                              ),
                            );
                          },
                          child: Text("Ok"));
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        IdController.clear();
                        NamaController.clear();
                        AwalController.clear();
                        AkirController.clear();

                        id = "";
                        nama = "";
                        awal = 0;
                        akir = 0;
                        total_meter = 0.0;
                        total_biaya = 0.0;
                        pajak = 0.0;
                        total = 0.0;                    
                      });
                    },
                    child: Text("Reset"),
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

class MyHasil extends StatelessWidget {
  const MyHasil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hasil"),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hasil"),
              SizedBox(
                height: 20,
              ),
              Text("No BP: $id"),
              SizedBox(
                height: 20,
              ),
              Text("Nama: $nama"),
              SizedBox(
                height: 20,
              ),
              Text("Meteran Awal: $awal"),
              SizedBox(
                height: 20,
              ),
              Text("Meteran Akhir: $akir"),
              SizedBox(
                height: 20,
              ),
              Text("total meteran: $total_meter"),
              SizedBox(
                height: 20,
              ),
              Text("total biaya: $total_biaya"),
              SizedBox(
                height: 20,
              ),
              Text("pajak: $pajak"),
              SizedBox(
                height: 20,
              ),
              Text("Total Pembayaran: $total"),
            ],
          ),
        ),
      ),
    );
  }
}
