import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jamnation_mobile/screens/costume_screen/costume_appbar_screen.dart';
import 'package:jamnation_mobile/screens/costume_screen/drawer_costume.dart';
import 'package:jamnation_mobile/screens/dashboard_screen.dart';
import 'package:jamnation_mobile/screens/data_maps/data_maps_kantor_banjarmasin.dart';
import 'package:latlong2/latlong.dart';

class KanwilMedan extends StatefulWidget {
  const KanwilMedan({super.key});

  @override
  State<KanwilMedan> createState() => _KanwilMedanState();
}

class _KanwilMedanState extends State<KanwilMedan> {
  int selectedIndex= 0;
  Widget kantorwilayah(){
    List<Marker> markers = [];
    for (var kantorwilayahmedan in kantorsmedan) {
      for(var kantorwilayahmedan in kantorwilayahmedan.cities){
        markers.add(
          Marker(
            point: kantorwilayahmedan.location, 
            child: Builder(
              builder: (ctx) => IconButton(
                onPressed: (){

                }, 
                icon: Icon(Icons.location_pin, color: Colors.red,) 
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
                  initialCenter: LatLng(-1.5624634,101.5197394),
                  initialZoom: 6.10,
                ),
              ),
            ),
            SizedBox(height: 12),
            DataTable(
              columns: 
              [
                DataColumn(label: Text('NO')),
                DataColumn(label: Text('Nama Unit Kerja')),
                DataColumn(label: Text('Kelas Unit Kerja')),
              ],
              rows: [
                DataRow(cells: [DataCell(Text('1')), DataCell(Text('Kantor Cabang Pekan Baru')), DataCell(Text('B1'))]),
                DataRow(cells: [DataCell(Text('2')), DataCell(Text('Kantor Cabang Medan')), DataCell(Text('A'))]),
                DataRow(cells: [DataCell(Text('3')), DataCell(Text('Kantor Cabang Padang')), DataCell(Text('B1'))]),
                DataRow(cells: [DataCell(Text('4')), DataCell(Text('Kantor Cabang Tanjung Pinang')), DataCell(Text('C3'))]),
                DataRow(cells: [DataCell(Text('5')), DataCell(Text('Kantor Cabang Batam')), DataCell(Text('C3'))]),
                DataRow(cells: [DataCell(Text('5')), DataCell(Text('Kantor Cabang Balige')), DataCell(Text('D'))]),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
    Widget dataumum() {
    return Center(child: Text('Data umum'));
  }

  Widget datasdm(){
    return Center(child: Text('Data Sdm'),);
  }

  Widget datakinerja(){
    return Center(child: Text('Data Kinerja'),);
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
                  'KANTOR WILAYAH MEDAN',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                ),
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
                      icon: Icon(FluentIcons.building_24_filled, color: selectedIndex == 1 ? Colors.white : Colors.black,),
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
                      icon: Icon(FluentIcons.building_24_filled, color: selectedIndex == 2 ? Colors.white : Colors.black,),
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
                      icon: Icon(FluentIcons.building_24_filled, color: selectedIndex == 3 ? Colors.white : Colors.black,),
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