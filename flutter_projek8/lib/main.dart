import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  final List<Map<String, dynamic>> mylist = [
    {
      "name": "sandi",
      "age": 23,
      "favColor": [
        "red  ",
        "black ",
        "white ",
        "red  ",
        "black ",
        "white ",
        "red  ",
        "black ",
        "white "
      ]
    },
    {
      "name": "andi",
      "age": 22,
      "favColor": ["blue ", "gree ", "amber "]
    },
    {
      "name": "randi",
      "age": 20,
      "favColor": [
        "red  ",
        "black ",
        "white ",
        "red  ",
        "black ",
        "white ",
        "red  ",
        "black ",
        "white "
      ]
    },
    {
      "name": "sandi",
      "age": 23,
      "favColor": [
        "red  ",
        "black ",
        "white ",
        "red  ",
        "black ",
        "white ",
        "red  ",
        "black ",
        "white "
      ]
    },
    {
      "name": "sandi",
      "age": 23,
      "favColor": [
        "red  ",
        "black ",
        "white ",
        "red  ",
        "black ",
        "white ",
        "red  ",
        "black ",
        "white "
      ]
    },
    {
      "name": "sandi",
      "age": 23,
      "favColor": [
        "red  ",
        "black ",
        "white ",
        "red  ",
        "black ",
        "white ",
        "red  ",
        "black ",
        "white "
      ]
    },
    {
      "name": "sandi",
      "age": 23,
      "favColor": [
        "red  ",
        "black ",
        "white ",
        "red  ",
        "black ",
        "white ",
        "red  ",
        "black ",
        "white "
      ]
    },
    {
      "name": "sandi",
      "age": 23,
      "favColor": [
        "red  ",
        "black ",
        "white ",
        "red  ",
        "black ",
        "white ",
        "red  ",
        "black ",
        "white "
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ID App'),
        ),
        body: ListView(
          children: mylist.map((data) {
            print(data['favColor']);
            List myfavcolor = data['favColor'];
            return Card(
              margin: EdgeInsets.all(5),
              color: Colors.deepPurple.withOpacity(0.6),
              child: Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //row
                    Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("name : ${data['name']}"),
                            Text('age : ${data['age']}')
                          ],
                        )
                      ],
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: myfavcolor.map((color) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 8),
                            color: Colors.amber,
                            padding: EdgeInsets.all(5),
                            child: Text(color),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
