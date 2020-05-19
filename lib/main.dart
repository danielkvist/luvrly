import 'package:flutter/material.dart';
import 'package:luvrly/screens/splash_screen.dart';

void main() {
  runApp(LuvrlyApp());
}

class LuvrlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luvrly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CustomSplashScreen(),
    );
  }
}
