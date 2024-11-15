import 'package:flutter/material.dart';
import 'package:jamnation_mobile/screens/path/costume_appbar_screen.dart';

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

      body: Center(
        child: Text(
          'HALAMAN FAQ'
        ),
      ),
    );
  }
}