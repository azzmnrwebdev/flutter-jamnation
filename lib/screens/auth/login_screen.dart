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


  String _currentNpp = '123';
  String _currentPassword = '123';

  Future <void> _validateLogin() async {
    String npp = nppController.text.trim();
    String password = passwordController.text.trim();
    if (npp == _currentNpp && password == _currentPassword) {

      await Future.delayed(Duration(seconds: 2));

      Navigator.pop(context);

      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => OtpScreen(email: 'example@gmail.com'))
      );
    } else if (npp.isEmpty && password.isEmpty){
      showDialog(
        context: context, 
        builder: (BuildContext context) {
          // ignore: unused_local_variable
          double screenWidth = MediaQuery.of(context).size.width;
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            title: const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 40,
            ),
          content: Text(
            'Masukan NPP dan Password Anda!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.red[900]
            ),
            ),
            actions: [
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  child: const Text(
                    'Oke',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                  )
                ),
              ),
            ],
          );
        }
      );
    } else {
      showDialog(
        context: context, 
        builder: (BuildContext context) {
          // ignore: unused_local_variable
          double screenWidth = MediaQuery.of(context).size.width;
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            title: const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 40,
            ),
          content: Text(
            'NPP dan password anda salah !',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.red[900]
            ),
            ),
            actions: [
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  child: const Text(
                    'Oke',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ),
              ),
            ],
          );
        }
      );
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
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover
                )
              ),
            ),
            Center(
              child: 
              Container(
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
                _validateLogin();
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