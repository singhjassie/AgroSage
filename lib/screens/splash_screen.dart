import 'package:agrosage/agrosage.dart';
import 'package:agrosage/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the next screen after 2 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const AgroSage()), // Replace with your home screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      body: Center(
        child: isLightTheme
            ? Image.asset('assets/images/logo-light.png')
            : Image.asset('assets/images/logo-dark.png'),
      ),
    );
  }
}
