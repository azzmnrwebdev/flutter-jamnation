import 'dart:math';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jamnation_mobile/screens/costume_screen/drawer_costume.dart';
import 'package:jamnation_mobile/screens/dashboard_screen.dart';
import 'package:jamnation_mobile/screens/data_maps/data_maps_kantor_banjarmasin.dart';
import 'package:jamnation_mobile/screens/costume_screen/costume_appbar_screen.dart';
import 'package:latlong2/latlong.dart';

class KanwilBanjarmasin extends StatefulWidget {
  const KanwilBanjarmasin({super.key});

  @override
  State<KanwilBanjarmasin> createState() => _KanwilBanjarMasinState();
}

class _KanwilBanjarMasinState extends State<KanwilBanjarmasin> {
  int selectedIndex = 0;

  Widget kantorwilayah() {
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
    return SingleChildScrollView(
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
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 450,
              width: double.infinity,
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
            DataTable(
              columns: 
              [
                DataColumn(label: Text('NO')),
                DataColumn(label: Text('Wilayah Kerja')),
                DataColumn(label: Text('Kelas')),
              ],
              rows: [

                DataRow(cells: [DataCell(Text('1')), DataCell(Text('Samarinda')), DataCell(Text('C1'))]),
                DataRow(cells: [DataCell(Text('2')), DataCell(Text('Banjarmasin')), DataCell(Text('B1'))]),
                DataRow(cells: [DataCell(Text('3')), DataCell(Text('Palangkaraya')), DataCell(Text('C2'))]),
                DataRow(cells: [DataCell(Text('4')), DataCell(Text('Tarakan')), DataCell(Text('C3'))]),
                DataRow(cells: [DataCell(Text('5')), DataCell(Text('Balikpapan')), DataCell(Text('C1'))]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dataumum() {
    return SingleChildScrollView(
        child: Column(
        children: [
          Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
            height: 65,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gedung Kantor',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
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
                )
              ]
            ),
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.green),
                  child: Text(
                    'INI berisikan Vidio'
                  ),
                ),
                SizedBox(height: 4,),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(color: Colors.blue),
                        height: 150,
                        width: 150,
                        child: Text('Gambar 1'),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(color: Colors.red),
                        height: 150,
                        width: 150,
                        child: Text('Gambar 2'),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(color: Colors.amber),
                        height: 150,
                        width: 150,
                        child: Text('Gambar 3'),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(color: Colors.yellow),
                        height: 150,
                        width: 150,
                        child: Text('Gambar 4'),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(color: Colors.grey),
                        height: 150,
                        width: 150,
                        child: Text('Gambar 5'),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(color: Colors.indigo),
                        height: 150,
                        width: 150,
                        child: Text('Gambar 6'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
            child: ExpansionTile(
              title: Text(
                'Detail Informasi Gedung Kantor'
              ),
              trailing: Icon(Icons.keyboard_arrow_down),
              children: [
                // isi kontent detail
                ListTile(
                  
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
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
            child: Row(
              children: [
                Text(
                  'Detail Kantor Wilayah'
                ),
                
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
            child: Row(
              children: [
                Text(
                  'ISI Content Detail Kantor WIlayah'
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget datasdm(){
    return SingleChildScrollView(
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
              'Struktur Organisasi'
            ),
            SizedBox(height: 12),
            Container(
              height: 450,
            )
          ],
        ),
      ),
    );
  }

  Widget datakinerja(){
    return SingleChildScrollView(
        child: Column(
        children: [
          Container(
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.red
            ),
            height: 65,
            width: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data Kinerja',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                )
              ],
            ),
          ),
          Container(
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
                )
              ]
            ),
            width: 450,
            child: Column(
              children: [
                Text(
                  ''
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getContent() {
    switch (selectedIndex) {
      case 0:
        return kantorwilayah();
      case 1:
        return dataumum();
      case 2:
        return datasdm();
      case 3:
        return datakinerja();
      default:
        return kantorwilayah();
    }
  }

  String getDynamicText(){
    switch (selectedIndex) {
      case 0:
        return "Wilayah Kantor";
      case 1:
        return "Data Umum";
      case 2: 
        return "Data SDM";
      case 3:
        return "Data Kinerja";
        
      default:
        return "Wilayah Kantor";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbarScreen(),
      drawer: DrawerCostume(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KANTOR WILAYAH BANJARMASIN',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                ),
                
                Row(
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => DashboardScreen())
                        );
                      }, 
                      child: Text(
                      'Kantor Wilayah /',
                      style: TextStyle(color: Color(0xFF51678F))
                      )
                    ),
                    Text(
                      getDynamicText(),
                      style: TextStyle(color: Color(0xFF51678F)),
                    )
                  ],
                ),
                SingleChildScrollView(
                scrollDirection: Axis.horizontal ,  
                child: 
                  Row(
                  children: [
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: selectedIndex == 0 ? Color(0xFF0C51A0) : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      label: Text(
                        'Wilayah Kerja',
                        style: TextStyle(color: selectedIndex == 0 ? Colors.white : Colors.black),
                      ),
                      icon: Icon(FluentIcons.earth_24_filled, color: selectedIndex == 0 ? Colors.white : Colors.black),
                    ),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: selectedIndex == 1 ? Color(0xFF0C51A0) : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      label: Text(
                        'Data Umum',
                        style: TextStyle(color: selectedIndex == 1 ? Colors.white : Colors.black),
                      ),
                      icon: Icon(FluentIcons.person_note_24_filled, color: selectedIndex == 1 ? Colors.white : Colors.black,),
                    ),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: selectedIndex == 2 ? Color(0xFF0C51A0) : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                      label: Text(
                        'Data SDM',
                        style: TextStyle(color: selectedIndex == 2 ? Colors.white : Colors.black),
                      ),
                      icon: Icon(FluentIcons.arrow_trending_24_filled, color: selectedIndex == 2 ? Colors.white : Colors.black,),
                    ),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: selectedIndex == 3 ? Color(0xFF0C51A0) : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = 3;
                        });
                      },
                      label: Text(
                        'Data Kinerja',
                        style: TextStyle(color: selectedIndex == 3 ? Colors.white : Colors.black),
                      ),
                      icon: Icon(FluentIcons.clipboard_data_bar_24_filled, color: selectedIndex == 3 ? Colors.white : Colors.black,),
                    ),
                  ],
                ),
                )
              ],
            ),
          ),
          Expanded(child: getContent()),
        ],
      ),
    );
  }
}
