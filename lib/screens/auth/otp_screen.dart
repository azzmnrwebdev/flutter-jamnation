import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:jamnation_mobile/screens/auth/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jamnation_mobile/screens/dashboard_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  final String token;

  const OtpScreen({super.key, required this.email, required this.token});

  @override
  // ignore: library_private_types_in_public_api
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final String apiUrl = '${dotenv.env['API_URL']}/otp';
  String _otp = '';
  bool _isButtonDisabled = true;
  int _secondRemaining = 30;
  Timer? _timer;
  bool clearText = false;

  Future<void> _validateOTP() async {
    if (_otp.isNotEmpty && _otp.length == 6) {
      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Authorization': 'Bearer ${widget.token}',
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'otp_code': _otp,
          }),
        );

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('access_token', widget.token);
          await prefs.setString('user_login', responseData['user']);

          // ignore: use_build_context_synchronously
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()));
        }

        if (response.statusCode == 400) {
          final responseData = jsonDecode(response.body);
          final message = responseData['message'];
          showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                actionsAlignment: MainAxisAlignment.center,
                title: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Verifikasi OTP Gagal',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message,
                    ),
                  ],
                ),
                actions: [
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _otp = '';
                          clearText = true;
                        });
                        Future.delayed(const Duration(milliseconds: 200), () {
                          setState(() {
                            clearText = false;
                          });
                        });
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red.shade100,
                        padding: const EdgeInsets.all(14),
                      ),
                      child: const Text(
                        'Tutup',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      } catch (e) {
        // ignore: avoid_print
        print('Terjadi kesalahan dalam koneksi ke server: $e');
        showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                actionsAlignment: MainAxisAlignment.center,
                title: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Verifikasi OTP Gagal',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Terjadi kesalahan dalam koneksi ke server.',
                    ),
                  ],
                ),
                actions: [
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            _otp = '';
                            clearText = true;
                          });
                          Future.delayed(const Duration(milliseconds: 200), () {
                            setState(() {
                              clearText = false;
                            });
                          });
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red.shade100,
                          padding: const EdgeInsets.all(14),
                        ),
                        child: const Text(
                          'Tutup',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        )),
                  ),
                ],
              );
            });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  // Mulai hitungan mundur untuk mengaktifkan kembali tombol kirim ulang OTP
  void _startCountdown() {
    setState(() {
      _secondRemaining = 30;
      _isButtonDisabled = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_secondRemaining == 0) {
        setState(() {
        _isButtonDisabled = false;
        });
        _timer?.cancel();
      } else {
        setState(() {
          _secondRemaining--;
        });
      }
    });
  }

  // Bangun UI untuk halaman OTP
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
          return false;
        },
        child: Scaffold(
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.65,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/otp.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'OTP Verification',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'One Time Password (OTP) has been\nsent via Email to',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.email,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  OtpTextField(
                    numberOfFields: 6,
                    keyboardType: TextInputType.number,
                    borderColor: const Color(0xFFD9D9D9),
                    showFieldAsBox: true,
                    onSubmit: (code) {
                      setState(() {
                        _otp = code;
                      });
                    },
                    onCodeChanged: (code) {
                      setState(() {
                        _otp = code;
                      });
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    clearText: clearText,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0C51A0)),
                      onPressed: _otp.length == 6 ? _validateOTP : null,
                      child: const Text(
                        'Verify OTP',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (_isButtonDisabled)
                    Text(
                      'Resend OTP in $_secondRemaining seconds',
                      style: TextStyle(color: Colors.red[900]),
                    )
                  else
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0C51A0)),
                        onPressed: () {
                          _startCountdown(); // Kirim ulang OTP dan mulai hitungan mundur
                          // Kirim permintaan pengiriman ulang OTP ke server
                        },
                        child: const Text(
                          'Resend OTP',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _timer?.cancel(); //fungsi membatalkan timer ketika halaman ini ditutup
    super.dispose();
  }
}