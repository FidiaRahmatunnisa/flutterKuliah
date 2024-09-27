import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            color: Colors.amber,
            // height: 10, --> tidak terpengaruh
            // width: 100, --> tidak terpegaruh
            child: Text(
              "leading",
            ),
          ),
          title: Container(
            child: Text("AppBar--->title"),
            color: Colors.greenAccent,
            width: 200,
            height: 50,
          ),
          actions: [
            Container(
              color: Colors.deepPurpleAccent,
              width: 30,
              child: Text("actions1"),
            ),
            Container(
              color: Colors.pinkAccent,
              width: 40,
              child: Text("actions2"),
            )
          ],
          centerTitle: true,
          flexibleSpace: const PreferredSize(
            child: Text("flexibelSpace"),
            preferredSize: Size.fromHeight(400)
            )
            // height: 500,
            // color: Colors.deepOrange,
          // ),
        ),
      ),
    );
  }
}
