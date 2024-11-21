import 'package:flutter/material.dart';
import 'package:jamnation_mobile/screens/path/dashboard_screen_notification.dart';

class CostumeAppbarScreen extends StatelessWidget implements PreferredSizeWidget {
  const CostumeAppbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image(
        image: AssetImage(
          'assets/images/logo.png',
        ),
        width: 150,
      ),
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
