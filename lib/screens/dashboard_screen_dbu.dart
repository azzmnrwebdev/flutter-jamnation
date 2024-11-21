import 'package:flutter/material.dart';
import 'package:jamnation_mobile/screens/costume_screen/costume_appbar_screen.dart';
import 'package:jamnation_mobile/screens/costume_screen/drawer_costume.dart';

class DashboardScreenDbu extends StatefulWidget {
  const DashboardScreenDbu({super.key});

  @override
  State<DashboardScreenDbu> createState() => _DashboardScreenDbuState();
}

class _DashboardScreenDbuState extends State<DashboardScreenDbu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbarScreen(),
      drawer: DrawerCostume(),
      body: Center(
        child: Text(
          'INI DASHBOARD DBU'
        ),
      ),
    );
  }
}