import 'package:flutter/material.dart';

import 'controllers.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ControllersPage(
        controller: controller,
        hintText: 'Contraseña',
        prefixIcon: Icon(Icons.lock),
        obscureText: true,
      ),
      
    );
  }
}
