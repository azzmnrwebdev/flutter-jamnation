import 'package:flutter/material.dart';

class CostumeSubContent extends StatelessWidget {
  const CostumeSubContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Struktur Organisasi'
            ),
            SizedBox(height: 12),
            Container(
              height: 450,
            )
          ],
        ),
      ),
    );
  }
}



class CostumeMainContentContainer extends StatefulWidget {

  @override
  State<CostumeMainContentContainer> createState() => _CostumeMainContentContainerState();
}

class _CostumeMainContentContainerState extends State<CostumeMainContentContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3)
          )
        ]
      ),
      
    );
  }
}