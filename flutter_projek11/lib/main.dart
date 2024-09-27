import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Tab> mylist = [
      Tab(
        icon: Icon(Icons.add_a_photo),
        child: Text("halaman 1"),
      ),
      Tab(
        child: Text("halaman 2"),
        icon: Icon(Icons.access_alarm),
      ),
      Tab(
        child: Text("halaman 3"),
        icon: Icon(Icons.add_comment),
      ),
      // Tab(
      //   child: Text("halaman 3"),
      //   icon: Icon(Icons.add_comment),
      // )
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: mylist.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text("TabBar"),
              centerTitle: true,
              bottom: TabBar(
                tabs: mylist,
                unselectedLabelColor: Colors.black12,
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                // indicatorColor: Colors.amberAccent,
                // padding: EdgeInsets.all(3),
                //custom
                indicator: BoxDecoration(
                    color: Colors.amber,
                    border: Border(
                        bottom: BorderSide(
                      color: Colors.black,
                      width: 3,
                    ))),
              ),

              //cara 2
              //  bottom: TabBar(
              //   tabs: [
              //     Tab(
              //       icon: Icon(Icons.add_a_photo),
              //       child: Text("halaman 1"),
              //     ),
              //     Tab(
              //       child: Text("halaman 2"),
              //       icon: Icon(Icons.access_alarm),
              //     ),
              //     Tab(
              //       child: Text("halaman 3"),
              //       icon: Icon(Icons.add_comment),
              //     )
              //   ],
              // ),

              // cara 1
              // bottom: PreferredSize(
              //   preferredSize: Size.fromHeight(60),
              //   child: DefaultTabController(
              //     length: 3,
              //     child: TabBar(
              //       tabs: [
              //         Tab(
              //           child: Text("halaman 1"),
              //         ),
              //         Tab(
              //           child: Text("halaman 2"),
              //         ),
              //         Tab(
              //           child: Text("halaman 3"),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ),
            body: TabBarView(children: [
              
              Container(
                color: Colors.amber,
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Text("Ini adalah halaman tampilan untuk tab 1"),
                ),
              ),
              Container(
                color: Colors.greenAccent,
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Text("Ini adalah halaman tampilan untuk tab 2"),
                ),
              ),
              Container(
                color: Colors.red,
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Text("Ini adalah halaman tampilan untuk tab 3"),
                ),
              )
            ]),
          ),
        ));
  }
}
