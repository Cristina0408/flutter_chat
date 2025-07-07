import 'package:flutter/material.dart';

class ControllersPage extends StatelessWidget {
  final TextEditingController controller;
  
  final String hintText;
  final Icon prefixIcon;
    final bool obscureText;

  const ControllersPage({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon, 
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontStyle: FontStyle.italic,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.blue, width: 1.5),
        ),
      ),
    );
  }
}
