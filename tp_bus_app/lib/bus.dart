import 'package:flutter/material.dart';
import 'package:tp_bus_app/akun.dart';
import 'package:tp_bus_app/dashboard.dart';
import 'package:tp_bus_app/promo.dart';
import 'package:tp_bus_app/tiket.dart';

class BusPage extends StatefulWidget {
  @override
  _BusScreenState createState() => _BusScreenState();
}

class _BusScreenState extends State<BusPage> {
  int _selectedIndex = 0;

  final List<String> _pageKeys = [
    '/Home', // key for home screen route
    '/Bus', // key for bus screen route
    '/Tiket', // key for ticket screen route
    '/Promo', // key for promo screen route
    '/Akun', // key for account screen route
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Use Navigator to navigate to the selected page based on route name
    Navigator.pushReplacementNamed(context, _pageKeys[index]);
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_bus),
          label: 'Bus',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.topic),
          label: 'Tiket',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.discount),
          label: 'Promo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Akun',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey, // Warna ikon yang tidak dipilih
      onTap: _onItemTapped,
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return DashScreen(); // Ganti dengan widget halaman Home Anda
      case 1:
        return BusPage(); // Ganti dengan widget halaman Bus Anda
      case 2:
        return TiketPage(); // Ganti dengan widget halaman Tiket Anda
      case 3:
        return PromoPage(); // Ganti dengan widget halaman Promo Anda
      case 4:
        return AkunPage(); // Ganti dengan widget halaman Akun Anda
      default:
        return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 2 / 10; // Ganti dengan rasio yang diinginkan
    return Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 1, // Ubah faktor lebar sesuai kebutuhan
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/map3.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
