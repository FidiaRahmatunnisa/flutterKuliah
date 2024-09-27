import 'package:flutter/material.dart';

void main() {
  runApp(const MyUtsTest());
}

var noBp = "";
var nama = "";
var mtk = 0;
var algo = 0;
var java = 0;
var rata = 0.0; 

class MyUtsTest extends StatefulWidget {
  const MyUtsTest({super.key});
  @override
  State<MyUtsTest> createState() => _MyUtsTestState();
}

class _MyUtsTestState extends State<MyUtsTest> {
  final TextEditingController noBpController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController mtkController = TextEditingController();
  final TextEditingController algoController = TextEditingController();
  final TextEditingController javaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("PraUTS_1"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            // alignment: Alignment.centerLeft,
            children: [
              const Text('No.bp'),
              TextField(
                autocorrect: true,
                decoration: const InputDecoration(
                  hintText: "No Bp",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    noBp = value;
                    // Calculate the `rata` variable.
                    rata = (mtk + algo + java) / 3.0;
                  });
                  // ignore: avoid_print
                  print(noBp);
                },
                controller: noBpController,
              ),
              const Text('Nama', ),
              TextField(
                autocorrect: true,
                decoration: const InputDecoration(
                  hintText: "Nama",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    nama = value;
                    // Calculate the `rata` variable.
                    rata = (mtk + algo + java) / 3.0;
                  });
                  // ignore: avoid_print
                  print(nama);
                },
                controller: namaController,
              ),
              const Text('Value Math', ),
              TextField(
                autocorrect: true,
                decoration: const InputDecoration(
                  hintText: "MTK",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    mtk = int.parse(value);
                    // Calculate the `rata` variable.
                    rata = (mtk + algo + java) / 3.0;
                  });
                  // ignore: avoid_print
                  print(mtk);
                },
                controller: mtkController,
              ),
              const Text('Value Algorithm', ),
              TextField(
                autocorrect: true,
                decoration: const InputDecoration(
                  hintText: "Algorithm",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    algo = int.parse(value);
                    // Calculate the `rata` variable.
                    rata = (mtk + algo + java) / 3.0;
                  });
                  // ignore: avoid_print
                  print(algo);
                },
                controller: algoController,
              ),
              const Text('Value Java', ),
              TextField(
                autocorrect: true,
                decoration: const InputDecoration(
                  hintText: "Java",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(
                    () {
                      java = int.parse(value);
                      // Calculate the `rata` variable.
                      rata = (mtk + algo + java) / 3.0;
                    },
                  );
                  // ignore: avoid_print
                  print(java);
                },
                controller: javaController,
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
                        noBpController.clear();
                        namaController.clear();
                        mtkController.clear();
                        algoController.clear();
                        javaController.clear();
                        noBp = "";
                        nama = "";
                        mtk = 0;
                        algo = 0;
                        java = 0;
                        rata = 0.0;
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
          padding:const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Result"),
              const SizedBox(
                height: 20,
              ),
              Text("No BP: $noBp"),
              const SizedBox(
                height: 20,
              ),
              Text("Nama: $nama"),
              const SizedBox(
                height: 20,
              ),
              Text("Result Math: $mtk"),
              const SizedBox(
                height: 20,
              ),
              Text("Result Algorithm: $algo"),
              const SizedBox(
                height: 20,
              ),
              Text("Result Java: $java"),
              const SizedBox(
                height: 20,
              ),
              Text("Rata: $rata"),
            ],
          ),
        ),
      ),
    );
  }
}