// home_page.dart

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedLanguage = 'en';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Image.asset(
            'assets/images/cbelogo.png',
            width: 50,
            height: 50,
          ),
          SizedBox(width: 16.0),
          DropdownButton<String>(
            value: _selectedLanguage,
            onChanged: (value) {
              setState(() {
                _selectedLanguage = value!;
              });
            },
            items: [
              DropdownMenuItem(
                value: 'en',
                child: Text('English'),
              ),
              DropdownMenuItem(
                value: 'am',
                child: Text('Amharic'),
              ),
              DropdownMenuItem(
                value: 'or',
                child: Text('Afaan Oromo'),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      )),
      body: Center(
        child: Text('Welcome to the Home page!'),
      ),
    );
  }
}
