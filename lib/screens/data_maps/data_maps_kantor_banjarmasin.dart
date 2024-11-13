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