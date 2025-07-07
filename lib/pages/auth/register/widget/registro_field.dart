import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/password_field.dart';

import 'user_name.dart';
import '../../../../widgets/gmail_fiel.dart';


class RegistroField extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;

  final VoidCallback registerUser;

  const RegistroField({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.registerUser,
    required this.usernameController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 500,
      child: Column(
        children: [
          SizedBox(height: 20),
          UserName(controller: usernameController,),
          SizedBox(height: 20),
          GmailFieldInput(controller: emailController,),
          SizedBox(height: 20),
          PasswordTextField(controller: passwordController,),
          SizedBox(height: 50),
          registerbutton(),
        ],
      ),
    );
  }

  ElevatedButton registerbutton() {
    return ElevatedButton(
          onPressed: registerUser,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shadowColor: Colors.blueGrey,
            elevation: 5,
            fixedSize: Size(120, 20),
          ),
          child: Text('Registrar'),
        );
  }
}
