import 'package:flutter/material.dart';
import "package:flutter_application_1/pages/user/users_page.dart";

import 'package:flutter_application_1/models/users.dart';
import '../../../pages/widgets/password_field.dart';
import '../../../pages/widgets/gmail_fiel.dart';
import 'ingresar_field.dart';
import '../../../data/data_base.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => FormsState();
}

class FormsState extends State<Forms> {
  final gmailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  void _showMessage(String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _loginUser() {
    String email = gmailController.text.trim();
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showMessage('Por favor completa todos los campos');
      return;
    }

    Users? existingUser;

    try {
      existingUser = DataBase.registeredUser.firstWhere(
        (user) => user.email == email && user.password == password,
      );
      gmailController.clear();
      passwordController.clear();
    } catch (e) {
      existingUser = null;
    }

    if (existingUser != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => UsersPage(username: existingUser!.username),
        ),
      );
    } else {
      _showMessage('Usuario no encontrado!!!');
      gmailController.clear();
      passwordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GmailFieldInput(controller: gmailController),

          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 40),
            child: PasswordTextField(controller: passwordController),
          ),

          IngresoWidget(
            onPressed: () {
              _loginUser();
            },
          ),
        ],
      ),
    );
  }
}
