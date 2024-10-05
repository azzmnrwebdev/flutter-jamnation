import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: const Color(0xFFE0F7FA),
      ),
    );

    Timer(const Duration(seconds: 2), () {
      bool isAuthenticated = checkToken();

      if (isAuthenticated) {
        context.go('/');
      } else {
        context.go('/login');
      }
    });
  }

  bool checkToken() {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: const Color(0xFFE6F5FF),
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 280,
              height: 280,
            ),
          ),
          const Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Jamkrindo Network Information Sebagai Database Jaringan\nKantor PT Jaminan Kredit Indonesia",
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.3,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Versi 1.0.0',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF009EFF),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
