import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class KantorBanjarmasin{
  final String name;
  final LatLng location;

  KantorBanjarmasin({required this.name, required this.location});
}

class Kantor {
  final String name;
  final List<KantorBanjarmasin> cities;

  Kantor({required this.name, required this.cities});
}

List<Kantor> kantors = [
  Kantor(
    name: "Kantor-Jamnation-BanjarMasin",
    cities: [
      KantorBanjarmasin(name: 'Kantor Cabang Samarinda', location: LatLng(-0.4971936,117.1463604)),
      KantorBanjarmasin(name: 'Kantor Cabang Banjarmasin', location: LatLng(-3.3184714,114.5924888)),
      KantorBanjarmasin(name: 'Kantor Cabang Palangkaraya', location: LatLng(-2.2169984,113.9140527)),
      KantorBanjarmasin(name: 'Kantor Cabang Tarakan', location: LatLng(3.3278287,117.5788596)),
      KantorBanjarmasin(name: 'Kantor Cabang Balikpapan', location: LatLng(-1.2380817,116.8525844)),
    ]
  )
];


// TITIK KOTA MEDAN
class KantorMedan{
  final String name;
  final LatLng location;

  KantorMedan({required this.name, required this.location});
}

class KantorWilayahMedan {
  final String name;
  final List<KantorMedan> cities;

  KantorWilayahMedan({required this.name, required this.cities});
}

List<KantorWilayahMedan> kantorsmedan = [
  KantorWilayahMedan(
    name: 'Kantor Wilayah Medan', 
    cities: [
      KantorMedan(name: 'Kantor Cabang Pekan Baru', location: LatLng(0.526350, 101.451511)),
      KantorMedan(name: 'Kantor Cabang Medan', location: LatLng(3.575234, 98.687531)),
      KantorMedan(name: 'Kantor Cabang Padang', location: LatLng(-0.884276, 100.388175)),
      KantorMedan(name: 'Kantor Cabang Tanjung Pinang', location: LatLng(0.918431, 104.466495)),
      KantorMedan(name: 'Kantor Cabang Batam', location: LatLng(1.099050, 104.017057)),
      KantorMedan(name: 'Kantor Cabang Balige', location: LatLng(2.333602, 99.083210)),
    ]
  )
];


class DataMapsKantorBanjarmasin extends StatefulWidget {
  const DataMapsKantorBanjarmasin({super.key});

  @override
  State<DataMapsKantorBanjarmasin> createState() => _DataMapsKantorBanjarmasinState();
}

class _DataMapsKantorBanjarmasinState extends State<DataMapsKantorBanjarmasin> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}