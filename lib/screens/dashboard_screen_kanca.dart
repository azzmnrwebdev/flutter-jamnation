import 'package:flutter/material.dart';
import 'package:jamnation_mobile/screens/costume_screen/costume_appbar_screen.dart';
import 'package:jamnation_mobile/screens/costume_screen/drawer_costume.dart';
import 'package:jamnation_mobile/screens/auth/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreenKanca extends StatefulWidget {
  const DashboardScreenKanca({super.key});

  @override
  State<DashboardScreenKanca> createState() => _DashboardScreenKancaState();
}

class _DashboardScreenKancaState extends State<DashboardScreenKanca> {
  String? token;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('access_token');
    });
  }

  Future<void> _removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    setState(() {
      token = null;
    });
  }

  Future<void> _logout() async {
    try {
      final response = await http.post(
          Uri.parse('${dotenv.env['API_URL']}/logout'),
          headers: <String, String>{
            'Authorization': 'Bearer $token',
          });

      if (response.statusCode == 200) {
        await _removeToken();

        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
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
                      'Gagal Keluar',
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
                      'Terjadi kesalahan pada server.',
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
                    'Gagal Keluar',
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CostumeAppbarScreen(),
      drawer: DrawerCostume(),
      body: const Center(
        child: Text('INI DAHSBOARD SCREEN KANCA'),
      ),
    );
  }
}
