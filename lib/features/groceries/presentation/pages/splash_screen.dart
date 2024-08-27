import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_img.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Optional gradient overlay (remove or adjust as needed)
          // Uncomment the following code if you want to keep a gradient with reduced opacity
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [
          //         const Color.fromARGB(255, 25, 78, 239).withOpacity(0.3),
          //         const Color.fromARGB(255, 54, 104, 255).withOpacity(0.2),
          //       ],
          //       begin: Alignment.bottomCenter,
          //       end: Alignment.topCenter,
          //     ),
          //   ),
          // ),
          // Text content
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0), // Adjust vertical padding to move text higher
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome to',
                    style: GoogleFonts.caveatBrush(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.05,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'SPEEDY CHOW',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      height: 1.05,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
