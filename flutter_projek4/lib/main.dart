import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
        title: Text('list file'),
      ),
      body: ListView(
        children: [
          ListTile(
            // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            // contentPadding: EdgeInsets.only(top: 20),

            title: Text("Fidia Rahmatunnisa"),
            subtitle: Text("this is the first file"),
            leading: CircleAvatar(),
            trailing: Text("2023-10-10"),
            tileColor: Colors.cyan,
            // dense: true, -->kepadatan teks
          ),
            // Divider(color: Colors.black87, ),

           ListTile(
            title: Text("Fidia Rahmatunnisa"),
            subtitle: Text("this is the first file"),
            leading: CircleAvatar(),
            trailing: Text("2023-10-10"),
            tileColor: Colors.amber,
          ),
            // Divider(color: Colors.black87,),

           ListTile(
            title: Text("Fidia Rahmatunnisa"),
            subtitle: Text("this is the first file"),
            leading: CircleAvatar(),
            trailing: Text("2023-10-10"),
            tileColor: Colors.deepOrangeAccent,
          ),
            // Divider(color: Colors.black87,),

           ListTile(
            title: Text("Fidia Rahmatunnisa"),
            subtitle: Text("this is the first file"),
            leading: CircleAvatar(),
            trailing: Text("2023-10-10"),
            tileColor: Colors.green,
          ),
          // Divider(color: Colors.black87,),

          ListTile(
            title: Text("Fidia Rahmatunnisa"),
            subtitle: Text("this is the first file"),
            leading: CircleAvatar(),
            trailing: Text("2023-10-10"),
            tileColor: Colors.red,
          ),
          // Divider(color: Colors.black87,),
        ],
      ),
      ),
    );
  }
}
