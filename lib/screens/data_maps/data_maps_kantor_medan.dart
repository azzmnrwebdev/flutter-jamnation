import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class Kantor{
  final String name;
  final LatLng location;

  Kantor({required this.name, required this.location});
}

class Region {
  final String name;
  final List<Kantor> cities;

  Region({required this.name, required this.cities});
}

List<Region> regions = [
  Region(
    name: "Kantor-Jamnation-Medan",
    cities: [
      Kantor(name: '', location: LatLng(-23131231, 123131))
    ]
  )
];


class DetailKantorMedan extends StatefulWidget {
  const DetailKantorMedan({super.key});

  @override
  State<DetailKantorMedan> createState() => _DetailKantorMedanState();
}

class _DetailKantorMedanState extends State<DetailKantorMedan>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}