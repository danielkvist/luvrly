import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';

class CustomSplashScreen extends StatefulWidget {
  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: Scaffold(),
      title: Text(
        '\nLuvrly',
        style: GoogleFonts.pacifico(
          fontSize: 72.0,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      onClick: () => print("Flutter Egypt"),
      loaderColor: Colors.white,
      loadingText: Text(
        'Love like you\'ll never be hurt.',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.pink,
      gradientBackground: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.pink, Colors.purple],
      ),
    );
  }
}
