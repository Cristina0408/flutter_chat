import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login/login_page.dart';
import 'package:flutter_application_1/models/users.dart';
import 'package:flutter_application_1/pages/chat/chat_page.dart';
import 'package:flutter_application_1/pages/user/widgets/connect.dart';

import 'widgets/connectionmanager.dart';

class UsersPage extends StatefulWidget {
  final String username;
  final String? imagePath;

  const UsersPage({super.key, 
  required this.username, 
  this.imagePath});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
    ConnectionManager.isOnline = true;
  }

  @override
  void dispose() {
    ConnectionManager.isOnline = false;
    super.dispose();
  }

  final usuarios = [
    Users(
      isOnline: true,
      username: 'Noe',
      email: 'a@gmail',
      password: '1',
      imagePath: '',
    ),
    Users(
      isOnline: false,
      username: 'Melina',
      email: 'b@gmail',
      password: '2',
      imagePath: '',
    ),
    Users(
      isOnline: true,
      username: 'Tomas',
      email: 'c@gmail',
      password: '3',
      imagePath: '',
    ),
    Users(
      isOnline: false,
      username: 'Kevin',
      email: 'd@gmail',
      password: '4',
      imagePath: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.username),
        elevation: 3,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LoginPage()),
            );
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
      body: ListView.separated(
        itemBuilder: (_, i) => ListTile(
          title: Text(usuarios[i].username),
          leading: CircleAvatar(
            backgroundImage: usuarios[i].imagePath.isNotEmpty
                ? FileImage(File(usuarios[i].imagePath))
                : null,
            child: usuarios[i].imagePath.isEmpty
                ? Text(usuarios[i].username.substring(0, 2).toUpperCase())
                : null,
          ),
          trailing: Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              color: usuarios[i].isOnline ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          onTap: () {
           Navigator.push(
            context,
              MaterialPageRoute(
              builder: (_) => ChatPage(username: usuarios[i].username,),),
            );
          },
        ),
        separatorBuilder: (_, i) => Divider(height: 2),
        itemCount: usuarios.length,
      ),
    );
  }
}
