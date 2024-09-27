import 'package:flutter/material.dart';
import 'schedule.dart';
import 'class.dart';
import 'mahasiswa_prodi.dart';
import 'device_condition.dart';
import 'login.dart';
import 'dosen.dart'; // Import the DosenListScreen class from dosen.dart
import 'status.dart'; // Import the StatusScreen class from status.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => showProfileMenu(context),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/mahasiswa.png'),
              ),
            ),
          ),
        ],
      ),
      body: DashboardBody(),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 32, 123, 197),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                // Handle home button press
              },
            ),
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Handle search button press
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
      child: SingleChildScrollView(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          children: <Widget>[
            DashboardCard(
              title: 'Schedule',
              image: 'assets/schedule.png',
              color: Color.fromARGB(255, 249, 173, 60),
              onTap: () {
                // Navigate to ScheduleScreen when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScheduleScreen()),
                );
              },
            ),
            DashboardCard(
              title: 'Classroom',
              image: 'assets/classroom.png',
              color: Color.fromARGB(255, 249, 173, 60),
              onTap: () {
                // Navigate to ClassScheduleScreen when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ClassScheduleScreen()),
                );
              },
            ),
            DashboardCard(
              title: 'Device Condition',
              image: 'assets/device_condition.png',
              doubleSize: true,
              color: Color.fromARGB(255, 249, 173, 60),
              onTap: () {
                // Navigate to DeviceCondition when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeviceCondition()),
                );
              },
            ),
            DashboardCard(
              title: 'Status',
              image: 'assets/status.png',
              color: Color.fromARGB(255, 249, 173, 60),
              onTap: () {
                // Navigate to StatusScreen when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StatusScreen()),
                );
              },
            ),
            DashboardCard(
              title: 'Dosen',
              image: 'assets/dosen.png',
              color: Color.fromARGB(255, 249, 173, 60),
              onTap: () {
                // Navigate to DosenListScreen when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DosenListScreen()),
                );
              },
            ),
            DashboardCard(
              title: 'Mahasiswa',
              image: 'assets/mahasiswa.png',
              color: Color.fromARGB(255, 249, 173, 60),
              onTap: () {
                // Navigate to MahasiswaProdi when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MahasiswaProdi()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String image;
  final bool doubleSize;
  final Color color;
  final Function()? onTap; // Callback function when card is tapped

  const DashboardCard({
    Key? key,
    required this.title,
    required this.image,
    this.doubleSize = false,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: InkWell(
        onTap: onTap, // Use the provided onTap callback
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 5, 5, 5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Image.asset(
              image,
              width: doubleSize ? 102.0 : 82.0,
              height: doubleSize ? 102.0 : 82.0,
            ),
          ],
        ),
      ),
    );
  }
}

void showProfileMenu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Akbar'), // Change with actual username
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
                // Add logout logic here
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginPage()), // Navigate to login page
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
