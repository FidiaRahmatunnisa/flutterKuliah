import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import the LoginPage class from login.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(), // Set LoginPage as the initial screen
    );
  }
}
