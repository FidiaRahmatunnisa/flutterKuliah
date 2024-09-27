import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tp_bus_app/akun.dart';
import 'package:tp_bus_app/bus.dart';
import 'package:tp_bus_app/dashboard.dart';
import 'package:tp_bus_app/tiket.dart';

class PromoPage extends StatefulWidget {
  @override
  _PromoScreenState createState() => _PromoScreenState();
}

//kelas akun
class _PromoScreenState extends State<PromoPage> {

int _selectedIndex = 0;

  final List<String> _pageKeys = [
    '/Home', // key for home screen route
    '/Bus', // key for settings screen route
    '/Tiket', // key for notifications screen route
    '/Promo', // key for notifications screen route
    '/Akun', // key for profile screen route
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushReplacementNamed(context, _pageKeys[index]);
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
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
        return DashScreen(); // Replace with your home screen widget
      case 1:
        return BusPage(); // Replace with your profile screen widget
      case 2:
        return TiketPage(); // Replace with your settings screen widget
      case 3:
        return PromoPage(); // Replace with your notifications screen widget
      case 4:
        return AkunPage();
      default:
        return SizedBox.shrink();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
            children: [
            // tulisan paling atas
              Center( 
                child: Padding(
                  padding: EdgeInsets.only(top: 40,),
                    child: Text(
                      "Tujuan Populer",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
              ),
                
            // gambar masjid raya sumbar
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                   children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/mesra.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12,),
                          child : Text(
                            'Masjid Raya Sumbar',
                             style: TextStyle(
                             color: Colors.white,
                             fontSize: 16,
                             fontWeight: FontWeight.bold,
                             // backgroundColor: Colors.black54, // Background semi-transparent
                        ),
                      ),
                        )
                      ]
                    ),
                  ],
                ),
              ),
              ),

            ),

            SizedBox(height: 5), // Menambahkan jarak antar gambar
            // gambar gor agus salim
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15,),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/gor.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 12),
                        child: Text(
                        'Gor Haji Agus Salim',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          // backgroundColor: Colors.black54,
                        ),
                      ),
                        ),
                      ],

                    ),
                  ],
                ),
              ),
              ),
             
            ),

            SizedBox(height: 5), // Menambahkan jarak antar gambar
            //gambar basko
            Expanded(
              child: Padding(padding: EdgeInsets.only(top: 15, left: 15, right: 15,),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/basko2.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 12,),
                        child: Text(
                        'Basko Hotel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          // backgroundColor: Colors.black54,
                        ),
                      ),
                        ),
                      ],

                    ),
                  ],
                ),
              ),
              ),

            ),
            SizedBox(height: 5), // Menambahkan jarak antar gambar
            Expanded(
              child: Padding(padding: EdgeInsets.only(top: 15, left: 15, right: 15,),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/trans.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 12,),
                        child: Text(
                        'Transmart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          // backgroundColor: Colors.black54,
                        ),
                      ),
                        )
                      ],

                    ),
                  ],
                ),
              ),
              ),

            ),
          ],
        
      ),

      bottomNavigationBar: buildBottomNavigationBar(),

    );
  }
}
