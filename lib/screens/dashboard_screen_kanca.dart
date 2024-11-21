import 'package:flutter/material.dart';
import 'package:jamnation_mobile/screens/costume_screen/costume_appbar_screen.dart';
import 'package:jamnation_mobile/screens/costume_screen/drawer_costume.dart';

class DashboardScreenKanca extends StatefulWidget {
  const DashboardScreenKanca({super.key});

  @override
  State<DashboardScreenKanca> createState() => _DashboardScreenKancaState();
}

class _DashboardScreenKancaState extends State<DashboardScreenKanca> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbarScreen(),
      drawer: DrawerCostume(),
      body: Center(
        child: Text(
          'INI DAHSBOARD SCREEN KANCA'
        ),
      ),
    );
  }
}