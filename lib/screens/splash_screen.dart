import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Lottie.network(
          "https://lottie.host/01e4035a-493b-4603-b843-ef088382344d/Ukuw8sG2Vh.json",
          height: 300,
          width: 300,
          repeat: true,
        ),
      ),
    );
  }
}
