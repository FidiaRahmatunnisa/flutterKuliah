// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyComboBoxApp(),
//     );
//   }
// }

// class MyComboBoxApp extends StatefulWidget {
//   @override
//   _MyComboBoxAppState createState() => _MyComboBoxAppState();
// }

// class _MyComboBoxAppState extends State<MyComboBoxApp> {
//   List<String> options = ['Pilihan 1', 'Pilihan 2', 'Pilihan 3', 'Pilihan 4'];
//   String selectedOption = 'Pilihan 1';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ComboBox Example'),
//       ),
//       body: Center(
//         child: DropdownButton<String>(
//           value: selectedOption,
//           items: options.map((String option) {
//             return DropdownMenuItem<String>(
//               value: option,
//               child: Text(option),
//             );
//           }).toList(),
//           onChanged: (String ) {
//             setState(() {
//               selectedOption;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyComboBoxApp(),
    );
  }
}

class MyComboBoxApp extends StatefulWidget {
  @override
  _MyComboBoxAppState createState() => _MyComboBoxAppState();
}

class _MyComboBoxAppState extends State<MyComboBoxApp> {
  List<String> options = ['Pilihan 1', 'Pilihan 2', 'Pilihan 3', 'Pilihan 4'];
  String selectedOption = 'Pilihan 1';

  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ComboBox and TextField Example'),
      ),
      body: Center(
        child: Row( // Menggunakan Row untuk menyusun ComboBox dan TextField secara horizontal
          children: [
            DropdownButton<String>(
              value: selectedOption,
              items: options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (String ) {
                setState(() {
                  selectedOption ;
                });
              },
            ),
            SizedBox(width: 20), // Spacer
            Expanded(
              child: TextField(
                controller: textFieldController,
                decoration: InputDecoration(
                  hintText: 'Masukkan teks di sini',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
