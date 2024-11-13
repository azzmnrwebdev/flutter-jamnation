import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:jamnation_mobile/screens/auth/login_screen.dart';
import 'package:jamnation_mobile/screens/dashboard_screen_kck.dart';
import 'package:jamnation_mobile/screens/error_screen.dart';
import 'package:jamnation_mobile/screens/path/dashboard_screen_notification.dart';

class CostumeAppbarScreen extends StatelessWidget implements PreferredSizeWidget {
  const CostumeAppbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationsScreen()),
            );
          },
          icon: Icon(Icons.notifications),
        ),
      ],
      elevation: 50.0,
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          );
        },
      ),
    );
    
  }

  // Tentukan ukuran preferensi untuk AppBar
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
