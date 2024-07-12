// main.dart

import 'package:flutter/material.dart';
import 'login_page.dart'; // Import the LoginPage widget
import 'home_page.dart'; // Import the HomePage widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(), // Define route for HomePage
      },
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}
