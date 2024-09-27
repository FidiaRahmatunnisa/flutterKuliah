import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fitur TextField"),
        ),
        body: Center(       
          child:Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              // autocorrect: true,
              // autofocus: true,
              // enableInteractiveSelection: true,
              keyboardType: TextInputType.number,  // nggk berfungsi
              // obscureText: true,  // muncul karakter kayak password
              // obscuringCharacter: 'o', // syaratnya obscureText harus hidup
              enabled: false,   // tidak bisa diklik maupun diketik
              // readOnly: true,  // masih bisa di klik , tapi tidak bisa diketik
            ),
            )
        ),
      ),
    );
  }
}
