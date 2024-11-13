import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:jamnation_mobile/screens/auth/login_screen.dart';
import 'package:jamnation_mobile/screens/dashboard_screen.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_dbu.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_kanca.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_kck.dart';
import 'package:jamnation_mobile/screens/path/costume_appbar_screen.dart';
import 'package:jamnation_mobile/screens/path/dashboard_screen_faq.dart';

class DashboardScreenKup extends StatefulWidget {
  const DashboardScreenKup({super.key});

  @override
  State<DashboardScreenKup> createState() => _DashboardScreenKupState();
}

class _DashboardScreenKupState extends State<DashboardScreenKup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbarScreen(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF0C51A0)
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF0C51A0)
                ),
                accountName:Text('Admin'), 
                accountEmail: Text("example@gmail.com"),
                currentAccountPictureSize: Size.square(45),
                currentAccountPicture: CircleAvatar(
                  child: Text(
                    "A",
                    style: TextStyle(
                      fontSize: 30.0
                    ),
                  ),
                ),
              )
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('DASHBOARD'),
              titleAlignment: ListTileTitleAlignment.center,
              
            ),
            ListTile(
              leading: const Icon(FluentIcons.building_24_filled,),
              title: Text('KANTOR WILAYAH'),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>DashboardScreen())
                );
              },
            ),
            ListTile(
              title: Text('KCK'),
              leading: Icon(FluentIcons.building_24_filled,),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => DashboardScreenKck()
                  )
                );
              },
            ),
            ListTile(
              title: Text('KANTOR CABANG'),
              leading: Icon(FluentIcons.building_24_filled,),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => DashboardScreenKanca()
                  )
                );
              },
            ),
            ListTile(
              title: Text('KUP'),
              leading: Icon(FluentIcons.building_24_filled,),
              onTap: () {
                Navigator.pop(context);
                
              },
            ),
            ListTile(
              title: Text('DBU'),
              leading: Icon(FluentIcons.person_24_filled,),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => DashboardScreenDbu()
                  )
                );
              },
            ),
            ListTile(
              title: Text('FAQ'),
              leading: Icon(FluentIcons.question_circle_20_regular),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => DashboardScreenFaq()
                  )
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                title: Text(
                  'KELUAR',
                  style: TextStyle(color: Colors.red),
                ),
                leading: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                onTap: () {
                  showDialog(
                    context: context, 
                    builder: (BuildContext context) {
                      return AlertDialog(
                        alignment: Alignment.center,
                        title: Icon(
                          Icons.warning,
                          size: 25,
                          color: Colors.red,
                        ),
                        content: Text(
                          'Apakah anda yakin ingin keluar ?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(builder: (context)=>LoginScreen())
                              );
                            }, 
                            child: Center(child: Text(
                                'IYA',
                                style: TextStyle(
                                ),
                              )
                            ), 
                          ), 
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                              
                            } , 
                            child: Center(child: Text('Tidak'),)
                          )
                        ],
                      );
                    }
                  );
                },
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Dashboard KUP'
        ),
      ),
    );
  }
}