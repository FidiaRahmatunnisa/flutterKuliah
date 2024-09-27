// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyUtsTest());
// }

// var nobp = "";
// var nama = "";
// var MTK = 0;
// var Bing = 0;
// var Java = 0;
// var rata = 0.0; // Declare the `rata` variable outside of the `build()` method.

// class MyUtsTest extends StatefulWidget {
//   @override
//   State<MyUtsTest> createState() => _MyUtsTestState();
// }

// class _MyUtsTestState extends State<MyUtsTest> {
//   final TextEditingController nobpController = TextEditingController();
//   final TextEditingController namaController = TextEditingController();
//   final TextEditingController MTKController = TextEditingController();
//   final TextEditingController BingController = TextEditingController();
//   final TextEditingController JavaController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text("UTS Latihan"),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               TextField(
//                 autocorrect: true,
//                 decoration: InputDecoration(
//                   hintText: "No Bp",
//                   border: OutlineInputBorder(),
//                 ),
//                 autofocus: true,
//                 onSubmitted: (value) {
//                   setState(() {
//                     nobp = value;
//                     // Calculate the `rata` variable.
//                     rata = (MTK + Bing + Java) / 3.0;
//                   });
//                   print(nobp);
//                 },
//                 controller: nobpController,
//               ),
//               TextField(
//                 autocorrect: true,
//                 decoration: InputDecoration(
//                   hintText: "Nama",
//                   border: OutlineInputBorder(),
//                 ),
//                 autofocus: true,
//                 onSubmitted: (value) {
//                   setState(() {
//                     nama = value;
//                     // Calculate the `rata` variable.
//                     rata = (MTK + Bing + Java) / 3.0;
//                   });
//                   print(nama);
//                 },
//                 controller: namaController,
//               ),
//               TextField(
//                 autocorrect: true,
//                 decoration: InputDecoration(
//                   hintText: "MTK",
//                   border: OutlineInputBorder(),
//                 ),
//                 autofocus: true,
//                 onSubmitted: (value) {
//                   setState(() {
//                     MTK = int.parse(value);
//                     // Calculate the `rata` variable.
//                     rata = (MTK + Bing + Java) / 3.0;
//                   });
//                   print(MTK);
//                 },
//                 controller: MTKController,
//               ),
//               TextField(
//                 autocorrect: true,
//                 decoration: InputDecoration(
//                   hintText: "B.Ing",
//                   border: OutlineInputBorder(),
//                 ),
//                 autofocus: true,
//                 onSubmitted: (value) {
//                   setState(() {
//                     Bing = int.parse(value);
//                     // Calculate the `rata` variable.
//                     rata = (MTK + Bing + Java) / 3.0;
//                   });
//                   print(Bing);
//                 },
//                 controller: BingController,
//               ),
//               TextField(
//                 autocorrect: true,
//                 decoration: InputDecoration(
//                   hintText: "B.Ing",
//                   border: OutlineInputBorder(),
//                 ),
//                 autofocus: true,
//                 onSubmitted: (value) {
//                   setState(
//                     () {
//                       Java = int.parse(value);
//                       // Calculate the `rata` variable.
//                       rata = (MTK + Bing + Java) / 3.0;
//                     },
//                   );
//                   print(Java);
//                 },
//                 controller: JavaController,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Builder(
//                     builder: (context) {
//                       return ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => MyHasil(),
//                               ),
//                             );
//                           },
//                           child: Text("Ok"));
//                     },
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         nobpController.clear();
//                         namaController.clear();
//                         MTKController.clear();
//                         BingController.clear();
//                         JavaController.clear();
//                         nobp = "";
//                         nama = "";
//                         MTK = 0;
//                         Bing = 0;
//                         Java = 0;
//                         rata = 0;
//                       });
//                     },
//                     child: Text("Reset"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyHasil extends StatelessWidget {
//   const MyHasil({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Hasil"),
//           leading: BackButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text("Hasil"),
//               Text("No BP: $nobp"),
//               Text("Nama: $nama"),
//               Text("MTK: $MTK"),
//               Text("B. Inggris: $Bing"),
//               Text("Java: $Java"),
//               Text("Rata: $rata"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



//----akbar
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyForm(),
//     );
//   }
// }

// class MyForm extends StatefulWidget {
//   @override
//   _MyFormState createState() => _MyFormState();
// }

// class _MyFormState extends State<MyForm> {
//   TextEditingController nomorBPController = TextEditingController();
//   TextEditingController namaController = TextEditingController();
//   TextEditingController mtkController = TextEditingController();
//   TextEditingController bIngController = TextEditingController();
//   TextEditingController javaController = TextEditingController();

//   void resetForm() {
//     nomorBPController.clear();
//     namaController.clear();
//     mtkController.clear();
//     bIngController.clear();
//     javaController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Input Data"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: nomorBPController,
//               decoration: InputDecoration(labelText: 'Nomor BP'),
//             ),
//             TextField(
//               controller: namaController,
//               decoration: InputDecoration(labelText: 'Nama'),
//             ),
//             TextField(
//               controller: mtkController,
//               decoration: InputDecoration(labelText: 'MTK'),
//             ),
//             TextField(
//               controller: bIngController,
//               decoration: InputDecoration(labelText: 'B. Ing'),
//             ),
//             TextField(
//               controller: javaController,
//               decoration: InputDecoration(labelText: 'Java'),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 ElevatedButton(
//                   onPressed: () {
//                     // Implement OK button functionality here
//                   },
//                   child: Text("OK"),
//                 ),
//                 ElevatedButton(
//                   onPressed: resetForm,
//                   child: Text("Reset"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController nobpController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController mtkController = TextEditingController();
  TextEditingController bingController = TextEditingController();
  TextEditingController javaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: nobpController,
              decoration: InputDecoration(labelText: 'No BP'),
            ),
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: mtkController,
              decoration: InputDecoration(labelText: 'Matematika'),
            ),
            TextField(
              controller: bingController,
              decoration: InputDecoration(labelText: 'Bahasa Inggris'),
            ),
            TextField(
              controller: javaController,
              decoration: InputDecoration(labelText: 'Java'),
            ),
            SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    double mtk = double.parse(mtkController.text);
                    double bing = double.parse(bingController.text);
                    double java = double.parse(javaController.text);

                    double rataRata = (mtk + bing + java) / 3;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          nobp: nobpController.text,
                          nama: namaController.text,
                          mtk: mtk,
                          bing: bing,
                          java: java,
                          rataRata: rataRata,
                        ),
                      ),
                    );
                  },
                  child: Text('OK'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    nobpController.clear();
                    namaController.clear();
                    mtkController.clear();
                    bingController.clear();
                    javaController.clear();
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final String nobp;
  final String nama;
  final double mtk;
  final double bing;
  final double java;
  final double rataRata;

  ResultPage({
    required this.nobp,
    required this.nama,
    required this.mtk,
    required this.bing,
    required this.java,
    required this.rataRata,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('No BP: $nobp'),
            Text('Nama: $nama'),
            Text('Matematika: $mtk'),
            Text('Bahasa Inggris: $bing'),
            Text('Java: $java'),
            Text('Rata-rata Nilai: $rataRata'),
          ],
        ),
      ),
    );
  }
}