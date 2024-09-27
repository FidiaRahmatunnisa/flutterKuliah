import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//hasil projek3--video 7
class MyApp extends StatelessWidget {
  final List<Color> thecolor = [
    Colors.green,
    Colors.amber,
    Colors.blueAccent,
    Colors.deepOrange
  ];

  final List<Widget> mylist = [
    Container(
      width: 300,
      height: 300,
      color: Colors.green,
    ),
    Container(
      width: 300,
      height: 300,
      color: Colors.amber,
    ),
    Container(
      width: 300,
      height: 300,
      color: Colors.blueAccent,
    ),
    Container(
      width: 300,
      height: 300,
      color: Colors.deepOrange,
    ),
  ];

  final List<Widget> mylist2 = List.generate(100,
   (index) => Text('${index+1}',
    style: TextStyle(
      fontSize: 20 + double.parse(index.toString()),
    ),
   ));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('list view'),
        ),
        //cara 3 listview
        body: ListView(
          children: mylist2

        //cara 2 listview
        // body: ListView.separated(
        //   separatorBuilder: ((context, index) {
        //     //cara 2
        //     return Divider(
        //       color: Colors.black,
        //     );
            // cara 1
            // return Container(
            //   height: 50,
            //   color: Colors.black,
            // );
          // }),
          // itemCount: thecolor.length,
          // itemBuilder: (context, index) {
          //   //cara 2 Text
            // return Text("haloo world");
            //cara 1 Container
            // return Container(height: 300, width: 300, color: thecolor[index]);
          // },

          //cara 1 listview
          // body: ListView.builder(
          //   itemCount: thecolor.length,
          //   itemBuilder: (context, index) {
          //     return Container(height: 300, width: 300, color: thecolor[index]);
          //   },
          // scrollDirection: Axis.horizontal,
          
        ),
      ),
    );
  }
}


  