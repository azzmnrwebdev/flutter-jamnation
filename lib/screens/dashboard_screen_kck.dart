import 'package:flutter/material.dart';
import 'package:jamnation_mobile/screens/costume_screen/costume_appbar_screen.dart';
import 'package:jamnation_mobile/screens/costume_screen/drawer_costume.dart';


class DashboardScreenKck extends StatefulWidget {
  const DashboardScreenKck({super.key});

  
  @override
  State<DashboardScreenKck> createState() => _DashboardScreenKckState();
}


class _DashboardScreenKckState extends State<DashboardScreenKck> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CostumeAppbarScreen(),
      drawer: DrawerCostume(),

    );
  }
}