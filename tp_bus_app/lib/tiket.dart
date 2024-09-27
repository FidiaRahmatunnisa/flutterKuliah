import 'package:flutter/material.dart';
import 'package:tp_bus_app/akun.dart';
import 'package:tp_bus_app/bus.dart';
import 'package:tp_bus_app/dashboard.dart';
import 'package:tp_bus_app/promo.dart';


class TiketPage extends StatefulWidget {
  @override
  _TiketScreenState createState() => _TiketScreenState();
}

//kelas akun
class _TiketScreenState extends State<TiketPage> {

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

        // konten di background biru
        Positioned(
          top: 45,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(top: 0, left: 25, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tiket Saya',
                  style: TextStyle(
                    fontSize: 26, // Ukuran teks baris pertama
                    fontWeight: FontWeight.bold, // Tebal teks baris pertama
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10), // Jarak antara baris pertama dan kedua
                Text(
                  'Semua tiket bus yang sudah aktif dan menunggu pembayaran ',
                  style: TextStyle(
                    fontSize: 15, // Ukuran teks baris kedua
                    color: Colors.white, // Warna teks baris kedua
                  ),
                ),
              ],
            ),
          ),
        ),

          // background putih dan kontennya
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),  // adjust the radius as needed
                topRight: Radius.circular(50.0), // adjust the radius as needed
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.73,
                // height: 600,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // teks pertama di background putih
                    Padding(
                      padding: EdgeInsets.only(top: 25, left: 30 ),
                        child : Text(
                        "Tiket & Layanan Saya",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                        )
                      ),
                      SizedBox(height: 5,),
                  // bagian 4 button berderet kesamping
                  Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Memastikan tombol terdistribusi secara merata
                      children: [
                        Padding(padding: EdgeInsets.only(left: 6)),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 4, left: 4),
                            child: ElevatedButton(
                            onPressed: () {
                              // Handler saat tombol ditekan
                            },
                            style: ElevatedButton.styleFrom(
                              // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5), // Mengatur padding
                              // textStyle: TextStyle(fontSize: 12), // Mengatur ukuran teks
                              backgroundColor: Colors.blue[50],
                            ),
                            child: Text(
                              'Semua', 
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 10,
                              ),
                              ),
                          ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 4, right: 4,),
                            child: ElevatedButton(
                            onPressed: () {
                              // Handler saat tombol ditekan
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[50],
                            ),
                            child: Text(
                              'Transit',
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 10,
                              ),
                              ),
                          ),
                          ),

                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Handler saat tombol ditekan
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[50],
                            ),
                            child: Text(
                              'Lokal',
                              style: TextStyle(
                                color : Colors.lightBlue,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Handler saat tombol ditekan
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[50]
                            ),
                            child: Text(
                              'Layanan',
                               style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 10,
                               ),
                              ),
                          ),
                        ),
                      ],
                    ),
              //bagian button cek dan tambah tiket
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 16),
                child: Container(
                padding: EdgeInsets.only(top: 12, left: 15, right: 15, bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[700],
                  borderRadius: BorderRadius.circular(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    "Cek & Tambah Tiket",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                    ),
                    // Column(
                      
                    // )
                  ],
                ),
              ),
                ),

              // bagian foto halaman kosong
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // gambar
                    Padding(
                      padding: EdgeInsets.only(left: 50, right: 50, top: 40),
                      child: Container(
                        width: 300, // Atur lebar gambar sesuai kebutuhan
                        height: 230, // Atur tinggi gambar sesuai kebutuhan
                        child: Image.asset(
                          'assets/kertas.jpg',
                          fit: BoxFit.cover, // Atur bagaimana gambar diisi ke dalam Container
                        ),
                      ),
                    ),
                    SizedBox(height: 0,),
                    // tulisan besar dibawah gambar
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                      "Belum Ada Tiket Yang Tersimpan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    textAlign: TextAlign.center,
                    ),
                      ),
                    SizedBox(height: 5,),
                    //tulisan kecil dibawah tulisan besar
                    Padding(
                      padding: EdgeInsets.only(left: 60, right: 60),
                      child : Center(
                        child : Text(
                          "Ayo pesan tiket bus mu, tiket kamu akan ditampilkan disini ",
                          style: TextStyle(
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      )
                    )

                    )

                  ],
              )

                  ],
                  ),
              ),
            ),
          ),

        ],
        // tulisan dibackground
        // _buildAdditionalText(),
      ),

      bottomNavigationBar: buildBottomNavigationBar(),

    );
  }




}
