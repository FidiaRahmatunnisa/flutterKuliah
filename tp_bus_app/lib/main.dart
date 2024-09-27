import 'package:flutter/material.dart';
import 'package:tp_bus_app/akun.dart';
import 'package:tp_bus_app/bus.dart';
import 'package:tp_bus_app/dashboard.dart';
import 'package:tp_bus_app/promo.dart';
import 'package:tp_bus_app/tiket.dart';
import 'splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/Home': (context) => DashScreen(),
        '/Bus': (context) => BusPage(),
        '/Tiket': (context) => TiketPage(),
        '/Promo': (context) => PromoPage(),
        '/Akun': (context) => AkunPage(),
      },
    );
  }
}
