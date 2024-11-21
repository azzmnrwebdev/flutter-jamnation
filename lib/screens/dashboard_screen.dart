import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jamnation_mobile/screens/auth/data_maps.dart';
import 'package:jamnation_mobile/screens/costume_screen/drawer_costume.dart';
import 'package:jamnation_mobile/screens/costume_screen/costume_appbar_screen.dart';
import 'package:jamnation_mobile/screens/data_maps/data_maps_kantor_banjarmasin.dart';
import 'package:jamnation_mobile/screens/subdashboard/kanwil_banjarmasin.dart';
import 'package:jamnation_mobile/screens/subdashboard/kanwil_denpasar.dart';
import 'package:jamnation_mobile/screens/subdashboard/kanwil_makasar.dart';
import 'package:jamnation_mobile/screens/subdashboard/kanwil_medan.dart';
import 'package:jamnation_mobile/screens/error_screen.dart';
import 'package:latlong2/latlong.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> data = [];
  Future<void> getData()async{
    print('Load Data ...');
    data = List<String>.generate(
      15, (index) => "flutt"
    );
  }
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
      backgroundColor: Color(0XFFFFFFFF),
      appBar: CostumeAppbarScreen(),
      drawer: DrawerCostume(),
      body: 
      Column(
        children: [
          Container(
            color: Color(0xffffffff),
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Kantor Wilayah',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
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
                  TextField(
                    decoration: 
                    InputDecoration(
                      fillColor: Color(0xFFBDC3C7),
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFFBDC3C7))
                      ),
                    ),
                    onChanged: (value) => getData(),
                  ),
                  // Expanded(
                  //   child : ListView.builder(
                  //     padding: EdgeInsets.only(top:10),
                  //     itemCount: data.length,
                  //     itemBuilder: (context, index){
                  //       return ListTile(
                  //         title: Text(data[index]),
                  //       );
                  //     }
                  //   )
                  // ),
                  SizedBox(height: 8,),
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