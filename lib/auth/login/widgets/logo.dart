import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: 170,
        child: Column(
          children: <Widget>[
            Image(image: AssetImage('assets/tag-logo.png')),
            Text('Message', style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
