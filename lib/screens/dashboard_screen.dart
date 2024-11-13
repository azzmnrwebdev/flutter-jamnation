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

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {

    List<Marker> markers = [];
    for (var region in regions) {
      for (var city in region.cities) {
        markers.add(
          Marker(
            point: city.location,
            child: Builder(
              builder: (ctx) => IconButton(
                onPressed: (){
                  Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => ErrorScreen()
                  )
                );
                }, 
                icon: Icon(Icons.location_pin, color: Colors.red, size: 25,)
              )
            )
          )
        );
      }
    }
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => NotificationsScreen()
                )
              );
            },
            icon: Icon(Icons.notifications),
          ),
        ],
        elevation: 50.0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: (){
                Scaffold.of(context).openDrawer();
              }, 
              icon: const Icon(Icons.menu)
            );
          } 
        )
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF0C51A0)
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF0C51A0)
                ),
                accountName:Text('Admin'), 
                accountEmail: Text("example@gmail.com"),
                currentAccountPictureSize: Size.square(45),
                currentAccountPicture: CircleAvatar(
                  child: Text(
                    "A",
                    style: TextStyle(
                      fontSize: 30.0
                    ),
                  ),
                ),
              )
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('DASHBOARD'),
              titleAlignment: ListTileTitleAlignment.center,
              
            ),
            ListTile(
              leading: const Icon(FluentIcons.building_24_filled,),
              title: Text('KANTOR WILAYAH'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('KCK'),
              leading: Icon(FluentIcons.building_24_filled,),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => DashboardScreenKck()
                  )
                );
              },
            ),
            ListTile(
              title: Text('KANTOR CABANG'),
              leading: Icon(FluentIcons.building_24_filled,),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => DashboardScreenKanca()
                  )
                );
              },
            ),
            ListTile(
              title: Text('KUP'),
              leading: Icon(FluentIcons.building_24_filled,),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => DashboardScreenKup()
                  )
                );
              },
            ),
            ListTile(
              title: Text('DBU'),
              leading: Icon(FluentIcons.person_24_filled,),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => DashboardScreenDbu()
                  )
                );
              },
            ),
            ListTile(
              title: Text('FAQ'),
              leading: Icon(FluentIcons.question_circle_20_regular),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => DashboardScreenFaq()
                  )
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                title: Text(
                  'KELUAR',
                  style: TextStyle(color: Colors.red),
                ),
                leading: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                onTap: () {
                  showDialog(
                    context: context, 
                    builder: (BuildContext context) {
                      return AlertDialog(
                        alignment: Alignment.center,
                        title: Icon(
                          Icons.warning,
                          size: 25,
                          color: Colors.red,
                        ),
                        content: Text(
                          'Apakah anda yakin ingin keluar ?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(builder: (context)=>LoginScreen())
                              );
                            }, 
                            child: Center(child: Text(
                                'IYA',
                                style: TextStyle(
                                ),
                              )
                            ), 
                          ), 
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                              
                            } , 
                            child: Center(child: Text('Tidak'),)
                          )
                        ],
                      );
                    }
                  );
                },
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Kantor Wilayah',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0C51A0)
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3)
                  )
                ]
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: FlutterMap(
                      children: [
                        TileLayer( // Display map tiles from any source
                          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
                          userAgentPackageName: 'com.example.app',
                          // And many more recommended properties!
                        ),
                        MarkerLayer(
                          markers: markers,

                        )
                      ],
                      options: MapOptions(
                        initialCenter: LatLng(-5.4521549,108.6533497),
                        initialZoom: 4.45
                      ),
                    ) 
                  ),
                  SizedBox(height: 16.0,),
                  Expanded(
                    flex: 1,
                    child:SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child:  SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          showBottomBorder: true,
                          columns: [
                          DataColumn(label: Text('NO')),
                          DataColumn(label: Text('Nama Unit Kerja')),
                          DataColumn(label: Text('Kelas Wilayah'))
                          ], 
                          rows: [
                          DataRow(
                          cells: [
                            DataCell(Text('1')),
                            DataCell(
                              onTap: (){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context)=>KanwilMedan())
                                );
                              },
                              Text('Kantor Wilayah Medan')),
                            DataCell(Text('B')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('2')),
                            DataCell(Text('Kantor Wilayah Palembang')),
                            DataCell(Text('B')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('3')),
                            DataCell(Text('Kantor Wilayah Jakarta')),
                            DataCell(Text('A')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('4')),
                            DataCell(Text('Kantor Wilayah Bandung')),
                            DataCell(Text('A')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('5')),
                            DataCell(Text('Kantor Wilayah Semarang')),
                            DataCell(Text('A')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('6')),
                            DataCell(Text('Kantor Wilayah Surabaya')),
                            DataCell(Text('A')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('7')),
                            DataCell(
                              onTap: (){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context)=>KanwilDenpasar())
                                );
                              },
                              Text('Kantor Wilayah Denpasar')),
                            DataCell(Text('B')),
                          ]),
                        // Data Table Banjarmasin
                          DataRow(cells: [
                            DataCell(Text('8')),
                            DataCell(
                              onTap: (){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context)=>KanwilBanjarmasin())
                                );
                              },
                              Text('Kantor Wilayah Banjarmasin')
                            ),
                            DataCell(Text('B', textAlign: TextAlign.center,)),
                          ]),
                          DataRow(cells: [
                              DataCell(Text('9')),
                              DataCell(
                                onTap: (){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context)=>KanwilMakasar())
                                );
                              },
                              Text('Kantor Wilayah Makassar')
                              ),
                              DataCell(Text('B')),
                            ]),
                          ]
                        ),
                      )
                    )
                  )
                ],
              ),
            ) 
          ) 
        ],
      ),
    );
  }
}