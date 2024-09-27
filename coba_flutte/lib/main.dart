// video ke-9 mengenai image widget


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Coba flutter'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.amber,
          // child: Text(
          //   "haloo dunia!!",
          //   style: TextStyle(
          //     fontSize: 20,
          //     // color: Colors.lightBlue,
          // ),
          // ),
          child: Image(
            image: AssetImage('images/gunung.png'),
            fit: BoxFit.cover,
            
            // image: NetworkImage(
            //     "https://i.pinimg.com/originals/00/7b/75/007b75f1f4a7be12d68dd960f0d4c591.jpg"
            //     ),
          ),
        ),
      ),
    ));
  }
}
