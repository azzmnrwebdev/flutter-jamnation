import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final double screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Teks di atas kontainer utama
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Informasi Peta dan Data Unit Kerja',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // Kontainer utama untuk peta dan tabel
            Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: isPortrait
                  ? Column(
                      children: [
                        // Map widget di orientasi portrait
                        Container(
                          height: screenWidth * 0.5,
                          child: FlutterMap(
                            options: MapOptions(
                              initialCenter: LatLng(-6.200000, 106.816666),
                              initialZoom: 9.8,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'com.example.app',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.0),
                        // Table widget di orientasi portrait
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text('Nomor')),
                              DataColumn(label: Text('Nama Unit Kerja')),
                              DataColumn(label: Text('Kelas Unit Kerja')),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text('1')),
                                DataCell(Text('Kantor Cabang Kota X')),
                                DataCell(Text('A1')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('2')),
                                DataCell(Text('Kantor Cabang Kota Y')),
                                DataCell(Text('B2')),
                              ]),
                              // Tambahkan lebih banyak data sesuai kebutuhan
                            ],
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        // Map widget di orientasi landscape
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 200.0,
                            child: FlutterMap(
                              options: MapOptions(
                                initialCenter: LatLng(-6.200000, 106.816666),
                                initialZoom: 9.8,
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  userAgentPackageName: 'com.example.app',
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        // Table widget di orientasi landscape
                        Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: [
                                DataColumn(label: Text('Nomor')),
                                DataColumn(label: Text('Nama Unit Kerja')),
                                DataColumn(label: Text('Kelas Unit Kerja')),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text('1')),
                                  DataCell(Text('Kantor Cabang Kota X')),
                                  DataCell(Text('A1')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('2')),
                                  DataCell(Text('Kantor Cabang Kota Y')),
                                  DataCell(Text('B2')),
                                ]),
                                // Tambahkan data tambahan sesuai kebutuhan
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
