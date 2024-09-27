import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}


//hasil projek1
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(title: Text('My Apps')),
      body: Center(
        child: Text(
          "Haloosdfjsdjkfhsdjkfjghfjdjdjdghdjhdjhdgjhgdjhgdryetwaweaweawatyfyouhjbnvncvntwerhjkahdlajhfasfhiawuehriwueiwesdfsdfsdfdfsgfdgfiwefwerwioerioweiowceioweiormweoiriwerrrcr",
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            backgroundColor: Colors.orange,
            color: Colors.black87,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 10,
            // fontFamily
            decorationStyle: TextDecorationStyle.wavy,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.green,
            decorationThickness: 2,
          ),
        ),
      ),
    ));
  }
}