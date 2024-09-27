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
          title: const Text("Dekorasi TextField"),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.amber,
          // margin: EdgeInsets.all(10),
          child: Center(    
            child: Container(
              margin: const EdgeInsets.all(20),
              child: const TextField(
                autocorrect: true,
                autofocus: true,
                // textAlign : TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                textCapitalization: TextCapitalization.none,
                
                // cursorColor: Colors.amber,
                // cursorHeight: 20,
                // cursorRadius: Radius.circular(40),
                    
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
            
                decoration: InputDecoration(
                  icon: Icon( 
                    Icons.person_add,
                    size: 35,
                    ),
                    border: OutlineInputBorder(),
                    // prefixIcon: Icon(
                    //   Icons.person_add,
                    //   size: 35,
                    // )
                    labelText: "FullName",
                    hintText: "please input your name",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
