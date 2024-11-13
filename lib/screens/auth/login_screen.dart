import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jamnation_mobile/screens/auth/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final String apiUrl = '${dotenv.env['API_URL']}/login';

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<void> _validateLogin() async {
    String npp = nppController.text.trim();
    String password = passwordController.text.trim();

    if (npp.isNotEmpty && password.isNotEmpty) {
      try {
        showLoadingDialog(context);

        final response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'username': npp,
            'password': password,
          }),
        );

        // ignore: use_build_context_synchronously
        Navigator.pop(context);

        if (response.statusCode == 200) {
          // ignore: unused_local_variable
          final responseData = jsonDecode(response.body);
          final message = responseData['message'];
          final emailRegex = RegExp(r'ke ([\w\.-]+@[\w\.-]+)');
          final emailMatch = emailRegex.firstMatch(message);
          // ignore: unused_local_variable
          final email =
              emailMatch != null ? emailMatch.group(1) : 'example@gmail.com';
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
          Navigator.push(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                email: email ?? 'example@gmail.com',
                token: responseData['access_token'],
              ),
            ),
          );
        } else {
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
                        'Login Gagal',
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
                        'NPP atau password Anda salah.',
                      ),
                    ],
                  ),
                  actions: [
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
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
                      'Login Gagal',
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
    } else if (npp.isEmpty && password.isEmpty) {
      showDialog(
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
                    'Login Gagal',
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
                    'Masukan NPP dan Password Anda.',
                  ),
                ],
              ),
              actions: [
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {
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
    } else {
      showDialog(
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
                    'Login Gagal',
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
                    'NPP atau password Anda salah.',
                  ),
                ],
              ),
              actions: [
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {
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

  // Membuat NPP dan Password Controller
  final nppController = TextEditingController();
  final passwordController = TextEditingController();

  final nppFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool _isObscured = true;

  @override
  void dispose() {
    nppController.dispose();
    passwordController.dispose();
    nppFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: const Color(0xFF0C51A0),
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.cover)),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.all(24.0),
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 45),
                    Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 200,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Masuk ke akun Anda',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0C51A0),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildForm(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'NPP',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0C51A0)),
            ),
          ),
          TextFormField(
            focusNode: nppFocusNode,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: nppController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.white)),
              hintText: 'Masukan NPP Anda!',
              suffixIcon: const Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                nppFocusNode.requestFocus();
                return 'Tolong Masukan NPP Anda!';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Password',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0C51A0)),
            ),
          ),
          TextFormField(
            obscureText: _isObscured,
            focusNode: passwordFocusNode,
            keyboardType: TextInputType.text,
            controller: passwordController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  )),
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              ),
              hintText: 'Masukan Password Anda!',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                passwordFocusNode.requestFocus();
                return 'Tolong Masukan Password Anda!';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 26,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  _validateLogin();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0C51A0),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
          )
        ],
      ),
    );
  }
}
