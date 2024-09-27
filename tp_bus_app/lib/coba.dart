import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // White background on top
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.blue,
          ),
          // Blue background with curved bottom corners
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
                // height: MediaQuery.of(context).size.height * 0.3,
                height: 500,
                color: Colors.white,
              ),
            ),
          ),
        ],
        
      ),
    );
  }
}
