import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jamnation_mobile/screens/auth/data_maps.dart';
import 'package:jamnation_mobile/screens/auth/login_screen.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_dbu.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_kanca.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_kup.dart';
import 'package:jamnation_mobile/screens/path/dashboard_screen_faq.dart';
import 'package:jamnation_mobile/screens/path/dashboard_screen_notification.dart';
import 'package:jamnation_mobile/screens/subdashboard/kanwil_banjarmasin.dart';
import 'package:jamnation_mobile/screens/subdashboard/kanwil_denpasar.dart';
import 'package:jamnation_mobile/screens/subdashboard/kanwil_makasar.dart';
import 'package:jamnation_mobile/screens/subdashboard/kanwil_medan.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_KCK.dart';
import 'package:jamnation_mobile/screens/error_screen.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
    List<Marker> markers = [];
    for (var region in regions) {
      for (var city in region.cities) {
        markers.add(Marker(
            point: city.location,
            child: Builder(
                builder: (ctx) => IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ErrorScreen()));
                    },
                    icon: const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 25,
                    )))));
      }
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationsScreen()));
              },
              icon: const Icon(Icons.notifications),
            ),
          ],
          elevation: 50.0,
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu));
          })),
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
                Navigator.pop(context);
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreenKup()));
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Kantor Wilayah',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0C51A0)),
            ),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black12.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3))
            ]),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: FlutterMap(
                      children: [
                        TileLayer(
                          // Display map tiles from any source
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
                          userAgentPackageName: 'com.example.app',
                          // And many more recommended properties!
                        ),
                        MarkerLayer(
                          markers: markers,
                        )
                      ],
                      options: const MapOptions(
                          initialCenter: LatLng(-5.4521549, 108.6533497),
                          initialZoom: 4.45),
                    )),
                const SizedBox(
                  height: 16.0,
                ),
                Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child:
                              DataTable(showBottomBorder: true, columns: const [
                            DataColumn(label: Text('NO')),
                            DataColumn(label: Text('Nama Unit Kerja')),
                            DataColumn(label: Text('Kelas Wilayah'))
                          ], rows: [
                            DataRow(cells: [
                              const DataCell(Text('1')),
                              DataCell(onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const KanwilMedan()));
                              }, const Text('Kantor Wilayah Medan')),
                              const DataCell(Text('B')),
                            ]),
                            const DataRow(cells: [
                              DataCell(Text('2')),
                              DataCell(Text('Kantor Wilayah Palembang')),
                              DataCell(Text('B')),
                            ]),
                            const DataRow(cells: [
                              DataCell(Text('3')),
                              DataCell(Text('Kantor Wilayah Jakarta')),
                              DataCell(Text('A')),
                            ]),
                            const DataRow(cells: [
                              DataCell(Text('4')),
                              DataCell(Text('Kantor Wilayah Bandung')),
                              DataCell(Text('A')),
                            ]),
                            const DataRow(cells: [
                              DataCell(Text('5')),
                              DataCell(Text('Kantor Wilayah Semarang')),
                              DataCell(Text('A')),
                            ]),
                            const DataRow(cells: [
                              DataCell(Text('6')),
                              DataCell(Text('Kantor Wilayah Surabaya')),
                              DataCell(Text('A')),
                            ]),
                            DataRow(cells: [
                              const DataCell(Text('7')),
                              DataCell(onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const KanwilDenpasar()));
                              }, const Text('Kantor Wilayah Denpasar')),
                              const DataCell(Text('B')),
                            ]),
                            // Data Table Banjarmasin
                            DataRow(cells: [
                              const DataCell(Text('8')),
                              DataCell(onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const KanwilBanjarmasin()));
                              }, const Text('Kantor Wilayah Banjarmasin')),
                              const DataCell(Text(
                                'B',
                                textAlign: TextAlign.center,
                              )),
                            ]),
                            DataRow(cells: [
                              const DataCell(Text('9')),
                              DataCell(onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const KanwilMakasar()));
                              }, const Text('Kantor Wilayah Makassar')),
                              const DataCell(Text('B')),
                            ]),
                          ]),
                        )))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
