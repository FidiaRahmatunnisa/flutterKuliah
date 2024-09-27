import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//hasil projek2
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
        title: Text('stack'),
      ),
      body: Stack(
        children: [
        Container(
          width: 200,
          height: 200,
          color: Colors.green,
        ),
         Container(
          width: 150,
          height: 150,
          color: Colors.amber,
        ),
         Container(
          width: 100,
          height: 100,
          color: Colors.blueAccent,
        ),
         Container(
          width: 50,
          height: 50,
          color: Colors.deepOrange,
        )
// body: Row(
// mainAxisAlignment: MainAxisAlignment.end,
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Container(
//   width: 50,
//   height: 200,
//   color: Colors.green,
// ),
//  Container(
//   width: 50,
//   height: 150,
//   color: Colors.amber,
// ),
//  Container(
//   width: 50,
//   height: 100,
//   color: Colors.blueAccent,
// ),
//  Container(
//   width: 50,
//   height: 50,
//   color: Colors.deepOrange,
// )
// body: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
//   width: 200,
//   height: 50,
//   color: Colors.green,
// ),
//  Container(
//   width: 150,
//   height: 50,
//   color: Colors.amber,
// ),
//  Container(
//   width: 100,
//   height: 50,
//   color: Colors.blueAccent,
// ),
//  Container(
//   width: 50,
//   height: 50,
//   color: Colors.deepOrange,
// )
      ]),
      ),
    );
  }
}