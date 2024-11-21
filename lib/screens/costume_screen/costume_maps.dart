import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jamnation_mobile/screens/data_maps/data_maps_kantor_banjarmasin.dart';
import 'package:latlong2/latlong.dart';

class CostumeMaps extends StatefulWidget {
  const CostumeMaps({super.key});
  

  @override
  State<CostumeMaps> createState() => _CostumeMapsState();
}

class _CostumeMapsState extends State<CostumeMaps> {
  get markers => DataMapsKantorBanjarmasin();

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}