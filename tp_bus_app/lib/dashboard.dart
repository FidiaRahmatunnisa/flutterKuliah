import 'package:flutter/material.dart';
import 'package:tp_bus_app/akun.dart';
import 'package:tp_bus_app/bus.dart';
import 'package:tp_bus_app/promo.dart';
import 'package:tp_bus_app/tiket.dart';
// import 'package:tp_bus_app/akun.dart';

class DashScreen extends StatefulWidget {
  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
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
      body: Stack(
        children: [
          // background biru diatas
          Positioned.fill(
            top: 0,
            child: Container(
              color: Colors.blue,
            ),
          ),

          // Content di background biru si logo
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(top: 35, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Logo
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Colors.black.withOpacity(0.2),
                              Colors.white.withOpacity(0.3),
                            ],
                            stops: [0.5, 1.0],
                            center: Alignment.center,
                            radius: 0.7,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Icon(Icons.directions_bus,
                                color: Colors.white, size: 18),
                            Text(
                              'tp',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 7,
                                  height: 1.0),
                            ),
                            Text(
                              'bus',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 7,
                                  height: 1.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      // Rupiah dan uang
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 20.0),
                            child: Text(
                              '56.400',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Text(
                              'Rp',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.visibility_off,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Transfer dan 4 icon dibawahnya
            Stack(
              children: [
                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.blue,
                    padding: EdgeInsets.only(top: 19, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.withOpacity(0.5),
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white.withOpacity(0.7),
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Opacity(
                                  opacity: 0.7,
                                  child: Text(
                                    'Transfer',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 165, // Ubah nilai top agar tidak tumpang tindih dengan yang di atas
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.blue,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Row dengan 4 icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildServiceIcon(Icons.center_focus_strong, 'Pindai'),
                          _buildServiceIcon(Icons.add_card_outlined, 'Isi Saldo'),
                          _buildServiceIcon(Icons.swap_vert_rounded, 'Kirim'),
                          _buildServiceIcon(Icons.drive_file_move_rtl_outlined, 'Minta'),
                        ],
                      )

                        // GridView.count(
                        //   crossAxisCount: 4,
                        //   shrinkWrap: true,
                        //   physics: NeverScrollableScrollPhysics(),
                        //   children: [
                        //     _buildServiceIcon(Icons.center_focus_strong, 'Pindai'),
                        //     _buildServiceIcon(Icons.add_card_outlined, 'Isi Saldo'),
                        //     _buildServiceIcon(Icons.swap_vert_rounded, 'Kirim'),
                        //     _buildServiceIcon(Icons.drive_file_move_rtl_outlined, 'Minta'),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),


          // BAGIAN BACKGROUND PUTIH
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.63, // ******* jarak siputih dengan sibiru diatasanya
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Icons and content on white background
                      GridView.count(
                        padding: EdgeInsets.all(10),
                        crossAxisCount: 5,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          _buildServiceIconB(
                              Icons.directions_railway, 'Halte', Colors.green),
                          _buildServiceIconB(
                              Icons.directions_transit, 'Time', Colors.red),
                          _buildServiceIconB(
                              Icons.train, 'Maps', Colors.deepPurpleAccent),
                          _buildServiceIconB(Icons.directions_railway,
                              'Raillfood', Colors.pink),
                          _buildServiceIconB(
                              Icons.tram, 'Market', Colors.purple),
                          // icon baris kedua
                          _buildServiceIconC(Icons.apartment, 'Hotel'),
                          _buildServiceIconC(Icons.local_shipping, 'Logistik'),
                          _buildServiceIconC(Icons.phone_android, 'Pulsa'),
                          _buildServiceIconC(Icons.wifi_outlined, 'Paket Data'),
                          _buildServiceIconC(Icons.flash_on, 'PLN'),
                        ],
                      ),
                      // dua buah box
                      SizedBox(height: 12),
                      _buildTwoBoxes('Top Up', 'Scan untuk Membayar'),
                      // tulisan dibackground
                      SizedBox(height: 10),
                      _buildAdditionalText(),
                      // gambar
                      SizedBox(height: 0),
                      Container(
                        height: 200, // Adjust height as needed
                        child: _buildHorizontalScrollableCards(),
                      ),
                      // tulisan dibawah gambar
                      SizedBox(height: 20),
                      // Text(
                      //   'Konten di bawah gambar-gambar',
                      //   style: TextStyle(fontSize: 16),
                      //   textAlign: TextAlign.center,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

// fungsi untuk menampilkan daftar card yang dapat di-scroll secara horizontal  *****************
  Widget _buildHorizontalScrollableCards() {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(10.0),
      children: [
        _buildCard('assets/baju.png'),
        SizedBox(width: 16),
        _buildCard('assets/bank.jpg'),
        SizedBox(width: 16),
        _buildCard('assets/bimbel.jpg'),
        SizedBox(width: 16),
        _buildCard('assets/minum.jpg'),
        SizedBox(width: 16),
        _buildCard('assets/pulsa.jpg'),
      ],
    );
  }

// Widget untuk membangun card dengan gambar***********************
// Widget _buildCard(String title, String imagePath) {
  Widget _buildCard(String imagePath) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imagePath,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Text(
          //     title,
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

// Widget untuk menampilkan tulisan di bawah box*********************
  Widget _buildAdditionalText() {
    return Container(
      width: double.infinity, // Lebar sepanjang layar
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      child: Text(
        'Lakukan Lebih Banyak dengan Uangmu',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

// Fungsi untuk membuat dua kotak**************************
  Widget _buildTwoBoxes(String title1, String title2) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: _buildBox(title1, Icons.my_library_add_rounded),
          ),
          SizedBox(width: 10), // Adjust the spacing between boxes
          Expanded(
            flex: 2,
            child: _buildBox(title2, Icons.qr_code),
          ),
        ],
      ),
    );
  }

// Fungsi untuk membuat satu kotak********************
  Widget _buildBox(String title, IconData icon) {
    return Container(
      padding: EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
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
            Icon(icon), // Icon di sini
            SizedBox(width: 8), // Jarak antara icon dan teks
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

// Fungsi untuk membuat 4 ikon layanan background biru atas**************************
  Widget _buildServiceIcon(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 38, color: Colors.white),
        Text(label, style: TextStyle(fontSize: 13, color: Colors.white)),
      ],
    );
  }

// Fungsi untuk membuat ikon layanan dengan latar belakang berwarna - warni***************
  Widget _buildServiceIconB(
      IconData icon, String label, Color backgroundColor) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        height: 80, // Mengatur tinggi Container agar memuat semua konten
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      backgroundColor.withOpacity(0.9),
                      backgroundColor.withOpacity(0.7),
                    ],
                    stops: [0.5, 0.7],
                    center: Alignment.center,
                    radius: 0.7,
                  ),
                  color: backgroundColor.withOpacity(0.8),
                ),
                child: Icon(icon, size: 30, color: Colors.white),
              ),
            ),
            SizedBox(height: 1),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

// Fungsi untuk membuat ikon layanan yang ketiga  *******************
  Widget _buildServiceIconC(IconData icon, String label) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        height: 80, // Mengatur tinggi Container agar memuat semua konten
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.1),
                    ],
                    stops: [0.5, 0.7],
                    center: Alignment.center,
                    radius: 0.7,
                  ),
                ),
                child: Icon(icon, size: 30, color: Colors.blue),
              ),
            ),
            SizedBox(height: 1),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

}
