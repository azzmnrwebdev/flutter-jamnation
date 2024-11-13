import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jamnation_mobile/screens/auth/data_maps.dart';
import 'package:jamnation_mobile/screens/auth/login_screen.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_KCK.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_notification.dart';
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
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => ErrorScreen()
                  )
                );
              },
            ),
            ListTile(
              title: Text('KCK'),
              leading: Icon(FluentIcons.building_24_filled,),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => ErrorScreen()
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
                  MaterialPageRoute(builder: (context) => ErrorScreen()
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
                  MaterialPageRoute(builder: (context) => ErrorScreen()
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
                  MaterialPageRoute(builder: (context) => ErrorScreen()
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
                  MaterialPageRoute(builder: (context) => ErrorScreen()
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
                        title: Icon(Icons.warning),
                        content: Text(
                          'Apakah anda yakin ingin keluar ?'
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            }, 
                            child: Text('TIDAK')
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(builder: (context)=>LoginScreen())
                              );
                            } , 
                            child: Text('IYA')
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
                        onLongPress: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => KanwilMedan())
                          );
                        }, 
                        cells: [
                          DataCell(Text('1')),
                          DataCell(Text('Kantor Wilayah Medan')),
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
                          DataCell(Text('Kantor Wilayah Denpasar')),
                          DataCell(Text('B')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('8')),
                          DataCell(Text('Kantor Wilayah Banjarmasin')),
                          DataCell(Text('B', textAlign: TextAlign.center,)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('9')),
                          DataCell(Text('Kantor Wilayah Makassar')),
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



class KanwilMedan extends StatefulWidget {
  const KanwilMedan({super.key});

  @override
  State<KanwilMedan> createState() => _KanwilMedanState();
}

class _KanwilMedanState extends State<KanwilMedan> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('ini kanwil medan'),
    );
  }
}