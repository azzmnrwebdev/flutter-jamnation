import 'package:flutter/material.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_notification.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_profile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => NotificationsScreen()
                )
              );
            },
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => ProfileScreen()
                )
              );
            }, 
            icon: Icon(
              Icons.account_circle,
              size: 35,
            ) 
          ),
        ],
        elevation: 50.0,
        leading: IconButton(
          onPressed: (){

          }, 
          icon: Icon(Icons.menu)
        ),
      ),
      body: Stack(
        children: [

        ],
      ),
    );
  }
}
