import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class City {
  final String name;
  final LatLng location;

  City({required  this.name, required this.location});
}

class Region {
  final String name;
  final List<City> cities;

  Region({required this.name, required this.cities});
}

List<Region> regions = [
  Region(
    name: "Jamnation-Indonesia",
    cities: [
      City(name: "Medan", location: LatLng(3.5776426,98.673613)),
      City(name: "Palembang", location: LatLng(-3.0051532,104.735014)),
      City(name: "Jakarta", location: LatLng(-6.1743895,106.8121869)),
      City(name: "Bandung", location: LatLng(-6.903272,107.5607546)),
      City(name: "Semarang", location: LatLng(-6.9834768,110.4099302)),
      City(name: "Surabaya", location: LatLng(-7.2959247,112.7363698)),
      City(name: "Denpasar", location: LatLng(-8.6761317,115.2265588)),
      City(name: "Banjarmasin", location: LatLng(-3.320269, 114.592617)),
      City(name: "Makassar", location: LatLng(-5.135227, 119.412369)),
    ],
  ),
  // Kamu bisa menambahkan region lain di sini
];


class DetailCity extends StatefulWidget {
  const DetailCity({super.key});

  @override
  State<DetailCity> createState() => _DetailCityState();
}

class _DetailCityState extends State<DetailCity> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}