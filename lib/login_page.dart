import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Constants for static authentication
  static const String validUsername = '12345';
  static const String validPassword = 'Mulisa2024';

  // Controllers for username and password fields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // State for remember me checkbox
  bool rememberMe = false;

  // List of image paths
  final List<String> imgList = [
    'assets/images/firstimage.jpg',
    'assets/images/secondimage.jpg',
    'assets/images/thirdimage.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.jpg',
                    width: 300,
                    height: 200,
                  ),
                  SizedBox(width: 10), // Add some space between image and text
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to CBE Infinity',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'User ID',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.5),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.5),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),
                    Text('Remember me', style: TextStyle(color: Colors.black)),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    print('Forgot Password clicked!');
                  },
                  style: TextButton.styleFrom(),
                  child: Text('Forgot Password?'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validate username and password
                String enteredUsername = usernameController.text.trim();
                String enteredPassword = passwordController.text.trim();

                if (enteredUsername == validUsername &&
                    enteredPassword == validPassword) {
                  // Navigate to home page on successful login
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  // Show error message if credentials are incorrect
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Invalid credentials. Please try again.'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        print('Open new account is clicked');
                      },
                      child: Text("Open New Account"),
                    ),
                    TextButton(
                      onPressed: () {
                        print('Sign Up clicked');
                      },
                      child: Text(
                        "Enroll/Activate",
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 52, 60, 52),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: imgList.map((item) => Container(
                child: Center(
                    child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                ),
              ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
