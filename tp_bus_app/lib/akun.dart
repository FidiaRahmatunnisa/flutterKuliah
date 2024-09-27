import 'package:flutter/material.dart';
import 'package:tp_bus_app/bus.dart';
import 'package:tp_bus_app/dashboard.dart';
import 'package:tp_bus_app/promo.dart';
import 'package:tp_bus_app/tiket.dart';

class AkunPage extends StatefulWidget {
  @override
  _AkunScreenState createState() => _AkunScreenState();
}

//kelas akun
class _AkunScreenState extends State<AkunPage> {

  // List icon di box
  final List<Map<String, dynamic>> boxIcons = [
    {'icon': Icons.vpn_key, 'text': 'Kata Sandi'},
    {'icon': Icons.history_rounded, 'text': 'Riwayat Transaksi'},
    {'icon': Icons.wallet_membership, 'text': 'Member Benefit'},
    {'icon': Icons.people_alt_rounded, 'text': 'Daftar Penumpang'},
    {'icon': Icons.calendar_view_day, 'text': 'Metode Pembayaran Saya'},
    {'icon': Icons.settings_overscan, 'text': 'Registrasi Face Recognition'},
    {'icon': Icons.help, 'text': 'Pusat Bantuan'},
    {'icon': Icons.warning_rounded, 'text': 'Tentang Akses'},
    {'icon': Icons.change_circle, 'text': 'Bahasa'},
  ];

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
          label: 'tiket',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.discount),
          label: 'promo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'akun',
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


  //fungsi utama
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // Background putih di bagian bawah (tinggi disesuaikan dengan sisa layar)
          Positioned.fill(
            child: Container(
              color: Colors.white,
            ),
          ),

          // Background biru di bagian atas
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.17,
            child: Container(
              color: Colors.blue,
            ),
          ),

          // Box untuk profile di tengah
          Positioned(
            top: MediaQuery.of(context).size.height * 0.07,
            left: 0,
            right: 0,
            child: FractionallySizedBox(
              widthFactor: 0.9, // 90% dari lebar layar
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage('assets/lufy.png'), // Gambar profil
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selvi Afmailia',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.stars_rounded,
                                  color: Colors.blueGrey[500],
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Basic Member',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    _buildTwoBoxes('Detail', 'Scan QR'),
                  ],
                ),
              ),
            ),
          ),

          // List kotak yang dapat dipilih
          Positioned(
            top: MediaQuery.of(context).size.height * 0.26,
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(bottom: 0), // Tambahkan padding di bawah
              child: ListView.builder(
                itemCount: boxIcons.length,
                itemBuilder: (BuildContext context, int index) {
                  final iconData = boxIcons[index % boxIcons.length]['icon'] as IconData;
                  final text = boxIcons[index % boxIcons.length]['text'] as String;
                  return buildSelectableBox(context, iconData, text, Icons.arrow_forward_ios_outlined);
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  // Fungsi untuk membuat kotak yang banyak
  Widget buildSelectableBox(BuildContext context, IconData iconData, String title, IconData iconData2) {
    bool isSelected = false;

    return GestureDetector(
      onTap: () {
        isSelected = !isSelected;
      },
      child: Container(
        height: 45,
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                iconData,
                color: isSelected ? Colors.white : Colors.blueGrey[800],
              ),
              SizedBox(width: 10), // Spacer antara icon dan teks
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.blueGrey[800],
                ),
              ),
              Spacer(),
              Icon(
                iconData2,
                color: isSelected ? Colors.white : Colors.blueGrey[800],
              )
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat dua kotak**************************
  Widget _buildTwoBoxes(String title1, String title2) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: _buildBox(title1, Icons.person, Colors.blueGrey),
          ),
          SizedBox(width: 10), // Adjust the spacing between boxes
          Expanded(
            flex: 1,
            child: _buildBox(title2, Icons.qr_code, Colors.grey),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat satu kotak********************
  Widget _buildBox(String title, IconData icon, Color iconColor) {
    return Container(
      padding: EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        // border: Border.all(color: Colors.grey)
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor,), // Icon di sini
            SizedBox(width: 15), // Jarak antara icon dan teks
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey[800],
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }



}
