import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/register/widgets/register_button.dart';
import 'package:flutter_application_1/pages/widgets/password_field.dart';

import '../../../pages/widgets/user_name.dart';
import '../../../pages/widgets/gmail_fiel.dart';

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
      padding: EdgeInsets.only(top: 20),
      width: 500,
      child: Column(
        children: [
          SizedBox(height: 15),
          UserName(controller: usernameController),
          SizedBox(height: 20),
          GmailFieldInput(controller: emailController),
          SizedBox(height: 20),
          PasswordTextField(controller: passwordController),
          SizedBox(height: 40),
          RegisterButton(
            onPressed: () {
              registerUser();
            },
          ),
        ],
      ),
    );
  }
}
