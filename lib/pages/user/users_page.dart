import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login/login_page.dart';
import 'package:flutter_application_1/models/users.dart';
import 'package:flutter_application_1/pages/chat/chat_page.dart';
import 'package:flutter_application_1/pages/user/widgets/connect.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";

import 'widgets/connectionmanager.dart';

class UsersPage extends StatefulWidget {
  final String username;
  final String? profileImage;

  const UsersPage({super.key, required this.username, this.profileImage});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

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
      profileImage: '',
    ),
    Users(
      isOnline: false,
      username: 'Melina',
      email: 'b@gmail',
      password: '2',
      profileImage: '',
    ),
    Users(
      isOnline: true,
      username: 'Tomas',
      email: 'c@gmail',
      password: '3',
      profileImage: '',
    ),
    Users(
      isOnline: false,
      username: 'Kevin',
      email: 'd@gmail',
      password: '4',
      profileImage: '',
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
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _loadUsers,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue),
          waterDropColor: Colors.blue,
        ),
        child: _listViewUsers(),
      ),
    );
  }

  Widget _listViewUsers() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, i) => _listTileUser(usuarios[i]),
        separatorBuilder: (_, i) => Divider(height: 2),
        itemCount: usuarios.length,
      ),
    );
  }

  ListTile _listTileUser(Users usuario) {
    return ListTile(
      title: Text(usuario.username, textAlign: TextAlign.left),
      subtitle: Text(
        usuario.isOnline ? "En línea" : "Desconectado",
        style: TextStyle(
          color: usuario.isOnline ? Colors.green : Colors.grey,
          fontSize: 10,
        ),
      ),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey[300],
        backgroundImage: _buildProfileImage(usuario.profileImage),
        child: usuario.profileImage.isEmpty
            ? Text(
                usuario.username.substring(0, 2).toUpperCase(),
                style: TextStyle(color: Colors.white),
              )
            : null,
      ),
      trailing: Container(
        width: 9,
        height: 9,
        decoration: BoxDecoration(
          color: usuario.isOnline ? Colors.green : Colors.red,
          shape: BoxShape.circle,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatPage(username: usuario.username),
          ),
        );
      },
    );
  }

  Future<void> _loadUsers() async {
    await Future.delayed(Duration(milliseconds: 1000));

    _refreshController.refreshCompleted();
  }

  ImageProvider? _buildProfileImage(String path) {
    if (path.isEmpty) {
      return AssetImage('assets/default_avatar.png');
    }

    if (kIsWeb) {
      return NetworkImage(path);
    } else {
      return FileImage(File(path));
    }
  }
}
