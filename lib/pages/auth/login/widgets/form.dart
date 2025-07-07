import 'package:flutter/material.dart';

import '../../../../data/data_base.dart';
import '../../../chat/chat_page.dart';
import '../../../users/users.dart';
import '../../../../widgets/gmail_fiel.dart';
import 'ingresar_field.dart';
import '../../../../widgets/password_field.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => FormsState();
}

class FormsState extends State<Forms> {
  final gmailController = TextEditingController();
  final passwordController = TextEditingController();

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
    } catch (e) {
      existingUser = null;
    }

    if (existingUser != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatPage()),
      );
    } else {
      _showMessage('Usuario no encontrado!!!');

      gmailController.clear();
      passwordController.clear();
    }
    IngresoWidget(onPressed: _loginUser);
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
          const SizedBox(height: 20),
          PasswordTextField(controller: passwordController),
          const SizedBox(height: 30),
          IngresoWidget(
            onPressed: () {
              _loginUser();
            },
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
