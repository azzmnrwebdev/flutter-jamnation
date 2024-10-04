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
        systemNavigationBarColor: const Color(0xFFE0F7FA),
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
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 280,
              height: 280,
            ),
          ),
          Positioned(
            bottom: 40.0,
            left: 0.0,
            right: 0.0,
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  height: 1.5,
                  fontSize: 12,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text:
                        'Jamkrindo Network Information Sebagai Database Jaringan Kantor\n',
                  ),
                  TextSpan(
                    text: 'PT Jaminan Kredit Indonesia',
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 10.0,
            left: 0,
            right: 0,
            child: Text(
              'Versi 1.0.0',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF009EFF),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
