import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamnation_mobile/screens/auth/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

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
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover
                )
              ),
            ),
            Positioned(
              height: size.height * 0.65,
              top: size.height * 0.25,
              left: 30,
              right: 30,
              child: 
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 36),
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
                      color: Color(0xFF0C51A0)
                    ),
                  ),
                ),
          TextFormField(
            focusNode: nppFocusNode,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],  
            controller: nppController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.white
                )
              ),
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
                      color: Color(0xFF0C51A0)
                    ),
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
                )
              ),
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
          const SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
            child: 
            ElevatedButton(
              onPressed: (){
                // print('User Menekan Tombil Login !');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OtpScreen(email: '',) )
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: const Text(
                'LOG IN',
                style: TextStyle(
                  color: Color(0xFF0C51A0),
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}