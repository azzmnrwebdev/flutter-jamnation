import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jamnation_mobile/screens/auth/login_screen.dart';
import 'package:jamnation_mobile/screens/dashboard_screen.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_dbu.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_kanca.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_kck.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_kup.dart';
import 'package:jamnation_mobile/screens/data_maps/data_maps_kantor_banjarmasin.dart';
import 'package:jamnation_mobile/screens/path/costume_appbar_screen.dart';
import 'package:jamnation_mobile/screens/path/dashboard_screen_faq.dart';
import 'package:latlong2/latlong.dart';

class KanwilBanjarmasin extends StatefulWidget {
  const KanwilBanjarmasin({super.key});

  @override
  State<KanwilBanjarmasin> createState() => _KanwilBanjarMasinState();
}

class _KanwilBanjarMasinState extends State<KanwilBanjarmasin> {
  @override
  Widget build(BuildContext context) {
    List<Marker> markers = [];
    for (var kantor in kantors){
      for (var kantor in kantor.cities ) {
        markers.add(
          Marker(
            point: kantor.location, 
            child: Builder(
              builder: (ctx) => IconButton(
                onPressed: (){

                }, 
                icon: Icon( Icons.location_pin,color: Colors.red,)
              )
            )
          )
        );
      }
    }
    return Scaffold(
      appBar: CostumeAppbarScreen(),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen())
                );
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
                Navigator.pop(context);
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=>DashboardScreenKanca())
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
    // Bagian statis: Text "KANTOR WILAYAH BANJARMASIN" dan tombol
    Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                },
                icon: Icon(Icons.arrow_back),
              ),
              Text(
                'KANTOR WILAYAH BANJARMASIN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0C51A0),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          // Tombol-tombol
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: 
          Row(
            children: [
              TextButton.icon(
                onPressed: () {
                  
                },
                label: Text(
                  'Wilayah kerja',
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(FluentIcons.earth_24_filled),
              ),
              TextButton.icon(
                onPressed: () {},
                label: Text('Data Umum'),
                icon: Icon(FluentIcons.building_24_filled),
              ),
              TextButton.icon(
                onPressed: () {},
                label: Text('Data SDM'),
                icon: Icon(FluentIcons.notepad_person_24_filled),
              ),
              TextButton.icon(
                onPressed: () {},
                label: Text('Data Kinerja'),
                icon: Icon(FluentIcons.arrow_trending_lines_24_filled),
              ),
            ],
          ),
          )
        ],
      ),
    ),

    // Bagian scrollable: Kontainer dengan teks, peta, dan tabel
    Expanded(
      child: SingleChildScrollView(
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
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wilayah Kerja',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 450,
                width: 400,
                child: FlutterMap(
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(markers: markers),
                  ],
                  options: MapOptions(
                    initialCenter: LatLng(-0.5672599, 115.5211984),
                    initialZoom: 6.10,
                  ),
                ),
              ),
              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('NO')),
                    DataColumn(label: Text('Wilayah Kerja')),
                    DataColumn(label: Text('Kelas')),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(Text('1')),
                        DataCell(Text('Samarinda')),
                        DataCell(Text('C1'))
                      ] 
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('2')),
                        DataCell(Text('Banjarmasin')),
                        DataCell(Text('B1'))
                      ] 
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('3')),
                        DataCell(Text('Palangkaraya')),
                        DataCell(Text('C2'))
                      ] 
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('4')),
                        DataCell(Text('Tarakan')),
                        DataCell(Text('C3'))
                      ] 
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('5')),
                        DataCell(Text('Balikpapan')),
                        DataCell(Text('C1'))
                      ] 
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ],
),

    );
  }
}