import 'dart:io';

import 'package:flutter/material.dart';

import '../user/widgets/connect.dart';


class ChatPage extends StatelessWidget {

 final String username;
 final String? imagePath;

  const ChatPage({super.key, 
  required this.username, 
  this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [ 
            Padding(
              padding: EdgeInsetsGeometry.only(right: 16),
              child: CircleAvatar(
                radius: 16,
                  backgroundImage: imagePath != null && imagePath!.isNotEmpty
                      ? FileImage(File(imagePath!))
                      : null,
                      backgroundColor: Colors.grey[400],
                  child: (imagePath == null || imagePath!.isEmpty)
                      ? Text(
                          username.substring(0, 2).toUpperCase(),
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        )
                      : null,
                    ),
            ),
            Text(username),
          ],
        ),
        elevation: 3,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); 
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: ConnectionStatus(),
          ),
        ],
      ),
    );
  }

}
