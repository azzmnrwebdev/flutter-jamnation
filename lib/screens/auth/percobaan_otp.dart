import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'dashboard_screen.dart';

class PercobaanOtp extends StatefulWidget {
  final String email; // Email diterima sebagai parameter dari halaman Login

  PercobaanOtp({required this.email});

  @override
  _PercobaanOtpState createState() => _PercobaanOtpState();
}

class _PercobaanOtpState extends State<PercobaanOtp> {
  String _otp = '';
  bool _isButtonDisabled = true;
  int _secondRemaining = 15;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  // Mulai hitungan mundur untuk mengaktifkan kembali tombol kirim ulang OTP
  void _startCountdown() {
    setState(() {
      _secondRemaining = 15;
      _isButtonDisabled = true;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
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

  // Fungsi untuk mengirim permintaan verifikasi OTP ke server
  Future<void> verifyOtp() async {
    var url = Uri.parse('http://localhost:8000/api/verify-otp');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': widget.email, 'otp': _otp}),
    );

    if (response.statusCode == 200) {
      _showSuccessDialog();
    } else {
      print('Invalid OTP');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }

  // Tampilkan dialog berhasil
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Verifikasi Berhasil'),
          content: Text('Kode OTP Berhasil Diverifikasi!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _navigateToDashboard();
              },
              child: Text('OKE'),
            ),
          ],
        );
      },
    );
  }

  // Pindahkan user ke halaman dashboard setelah verifikasi berhasil
  void _navigateToDashboard() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
  }

  // Bangun UI untuk halaman OTP
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                offset: Offset(0, 3),
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
                'One Time Password (OTP) has been sent via Email to',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                widget.email,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              OtpTextField(
                numberOfFields: 6,
                keyboardType: TextInputType.number,
                borderColor: Color(0xFFD9D9D9),
                showFieldAsBox: true,
                onSubmit: (code) {
                  setState(() {
                    _otp = code; // Simpan OTP yang diinput pengguna
                  });
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0C51A0)
                      ),
                      onPressed: _otp.isEmpty
                          ? null
                          : () {
                              verifyOtp(); // Verifikasi OTP ketika tombol ditekan
                            },
                      child: Text(
                        'Verify OTP',
                        style: TextStyle(
                          color: Colors.white
                          ),
                        ),
                ),
              ),
              
              const SizedBox(height: 10),
              if (_isButtonDisabled)
                Text('Resend OTP in $_secondRemaining seconds')
              else
                ElevatedButton(
                  onPressed: () {
                    _startCountdown(); // Kirim ulang OTP dan mulai hitungan mundur
                    // Kirim permintaan pengiriman ulang OTP ke server
                  },
                  child: Text('Resend OTP'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Batalkan timer ketika halaman ini ditutup
    super.dispose();
  }
}
