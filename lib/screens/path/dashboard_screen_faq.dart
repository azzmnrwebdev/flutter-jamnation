import 'package:flutter/material.dart';
import 'package:jamnation_mobile/screens/costume_screen/costume_appbar_screen.dart';
import 'package:jamnation_mobile/screens/costume_screen/drawer_costume.dart';

class DashboardScreenFaq extends StatefulWidget {
  const DashboardScreenFaq({super.key});

  @override
  State<DashboardScreenFaq> createState() => _DashboardScreenFaqState();
}

class _DashboardScreenFaqState extends State<DashboardScreenFaq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbarScreen(),
      drawer: DrawerCostume(),

      body: Center(
        child: Text(
          'HALAMAN FAQ'
        ),
      ),
    );
  }
}