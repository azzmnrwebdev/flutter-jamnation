import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:jamnation_mobile/screens/auth/login_screen.dart';
import 'package:jamnation_mobile/screens/dashboard_screen.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_dbu.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_kanca.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_kck.dart';
import 'package:jamnation_mobile/screens/path/costume_appbar_screen.dart';
import 'package:jamnation_mobile/screens/path/dashboard_screen_faq.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreenKup extends StatefulWidget {
  const DashboardScreenKup({super.key});

  @override
  State<DashboardScreenKup> createState() => _DashboardScreenKupState();
}

class _DashboardScreenKupState extends State<DashboardScreenKup> {
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF0C51A0)),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Color(0xFF0C51A0)),
                  accountName: Text('Admin'),
                  accountEmail: Text("example@gmail.com"),
                  currentAccountPictureSize: Size.square(45),
                  currentAccountPicture: CircleAvatar(
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                )),
            const ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('DASHBOARD'),
              titleAlignment: ListTileTitleAlignment.center,
            ),
            ListTile(
              leading: const Icon(
                FluentIcons.building_24_filled,
              ),
              title: const Text('KANTOR WILAYAH'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreen()));
              },
            ),
            ListTile(
              title: const Text('KCK'),
              leading: const Icon(
                FluentIcons.building_24_filled,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreenKck()));
              },
            ),
            ListTile(
              title: const Text('KANTOR CABANG'),
              leading: const Icon(
                FluentIcons.building_24_filled,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreenKanca()));
              },
            ),
            ListTile(
              title: const Text('KUP'),
              leading: const Icon(
                FluentIcons.building_24_filled,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('DBU'),
              leading: const Icon(
                FluentIcons.person_24_filled,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreenDbu()));
              },
            ),
            ListTile(
              title: const Text('FAQ'),
              leading: const Icon(FluentIcons.question_circle_20_regular),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreenFaq()));
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                title: const Text(
                  'KELUAR',
                  style: TextStyle(color: Colors.red),
                ),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          alignment: Alignment.center,
                          title: const Icon(
                            Icons.warning,
                            size: 25,
                            color: Colors.red,
                          ),
                          content: const Text(
                            'Apakah anda yakin ingin keluar ?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                _logout();
                              },
                              child: const Center(
                                  child: Text(
                                'IYA',
                                style: TextStyle(),
                              )),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Center(
                                  child: Text('Tidak'),
                                ))
                          ],
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
      body: const Center(
        child: Text('Dashboard KUP'),
      ),
    );
  }
}
