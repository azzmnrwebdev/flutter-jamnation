// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class DashboardScreen extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AppBarDashbord(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
// class AppBarDashbord extends StatelessWidget {
//   get mails => null;


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         // shadowColor: Colors.black38,
//         shape: LinearBorder.bottom(alignment: 0.1),
//         actions: [
//           IconButton(
//             onPressed:() {

//             }, 
//             icon: const Icon(Icons.notifications)
//           ),
//           IconButton(
//             iconSize: 40,
//             onPressed: (){

//             }, 
//             icon: Icon(Icons.account_circle)
//           )
//         ],
//         elevation: 50.0,
//         leading: IconButton(onPressed: (){

//         }, 
//         icon: Icon(Icons.menu)
//         ),
//       ),
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Positioned(
//                 top: 35,
//                 left: 20,
//                 child: Text(
//                   'Kantor Wilayah',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child:Container(
//                   margin: const EdgeInsets.all(16.0),
//                   padding: const EdgeInsets.all(16.0),
//                   height: MediaQuery.of(context).size.height,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 8.0
//                       )
//                     ]
//                   ),
//                   child: Column(
//                     children: [
//                       Container(
//                         height: 450,
//                         decoration: BoxDecoration(
                          
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(12.0),
//                           child: FlutterMap(
//                             options: MapOptions(
//                               initialCenter: LatLng(-2.548926, 118.014863),
//                               initialZoom: 5.0
//                             ),
//                             children: [
//                               TileLayer(
//                                 urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                                 userAgentPackageName: 'Jamnation',
//                               ),
//                               MarkerLayer(
//                                 markers:[
//                                   Marker(point: LatLng(-6.200000, 106.816666), 
//                                 child: Builder(
//                                   builder: (ctx) => 
//                                       Icon(
//                                         Icons.location_pin,
//                                         color: Colors.red[900],
//                                         size: 40,
//                                       )
//                                     )
//                                   )
//                                 ] 
//                               )
//                             ]
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20,),
//                       Expanded(child: 
//                         SingleChildScrollView(
//                           scrollDirection: Axis.vertical,
//                           child: DataTable(
//                             columns: [
//                               DataColumn(label: Text('Nomor')),
//                               DataColumn(label: Text('Nama Unit Kerja')),
//                               DataColumn(label: Text('Kelas Unit Kerja'))
//                             ], 
//                             rows: const [
//                               DataRow(cells: [
//                                 DataCell(Text('1')),
//                                 DataCell(Text('1')),
//                                 DataCell(Text('1')),
//                               ]),
//                               DataRow(cells: [
//                                 DataCell(Text('1')),
//                                 DataCell(Text('1')),
//                                 DataCell(Text('1')),
//                               ]),
//                               DataRow(cells: [
//                                 DataCell(Text('1')),
//                                 DataCell(Text('1')),
//                                 DataCell(Text('1')),
//                               ]),
//                               DataRow(cells: [
//                                 DataCell(Text('1')),
//                                 DataCell(Text('1')),
//                                 DataCell(Text('1')),
//                               ]),
//                               DataRow(cells: [
//                                 DataCell(Text('1')),
//                                 DataCell(Text('1')),
//                                 DataCell(Text('1')),
//                               ]),
//                               DataRow(cells: [
//                                 DataCell(Text('1')),
//                                 DataCell(Text('1')),
//                                 DataCell(Text('1')),
//                               ]),
//                               DataRow(cells: [
//                                 DataCell(Text('1')),
//                                 DataCell(Text('1')),
//                                 DataCell(Text('1')),
//                               ]),
//                               DataRow(cells: [
//                                 DataCell(Text('1')),
//                                 DataCell(Text('1')),
//                                 DataCell(Text('1')),
//                               ]),
//                             ]
//                           ),
//                         )
//                       )
//                     ],
//                   ),
//                 ) 
//               ),
//             ],
//           ),
//         ],
//       )
//     );
//   }
// }
