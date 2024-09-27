// import 'dart:html';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // MyApp({super.key});
  var faker = new Faker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Extract Widget'),
        ),
        body: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              //cara extract widget
              return Chatitem(
                  imageurl: "https://picsum.photos/id/0/info",
                  title: "muse",
                  subtitle: "anime bahasa indonesia");
              // chatitem(
            }

            //     imageurl: "https://picsum.photos/id/0/info",
            //     title: "muse",
            //     subtitle: "anime bahasa indonesia"),

            //cara manual
            // ListTile(
            //   leading: CircleAvatar(),
            //   title: Text("Muse"),
            //   subtitle: Text("halaman anime indonesia"),
            //   trailing: Text("10-10-2023"),
            // ),
            // ListTile(
            //   leading: CircleAvatar(),
            //   title: Text("Muse"),
            //   subtitle: Text("halaman anime indonesia"),
            //   trailing: Text("10-10-2023"),
            // ),
            // ListTile(
            //   leading: CircleAvatar(),
            //   title: Text("Muse"),
            //   subtitle: Text("halaman anime indonesia"),
            //   trailing: Text("10-10-2023"),
            // ),
            // ListTile(
            //   leading: CircleAvatar(),
            //   title: Text("Muse"),
            //   subtitle: Text("halaman anime indonesia"),
            //   trailing: Text("10-10-2023"),
            // ),
            // ListTile(
            //   leading: CircleAvatar(),
            //   title: Text("Muse"),
            //   subtitle: Text("halaman anime indonesia"),
            //   trailing: Text("10-10-2023"),
            // )

            ),
      ),
    );
  }
}

class Chatitem extends StatelessWidget {
  final String imageurl;
  final String title;
  final String subtitle;

  Chatitem(
      {required this.imageurl, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageurl),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text("10-10-2023"),
    );
  }
}
