import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/controllers.dart';

class GmailFieldInput extends StatelessWidget {
  final TextEditingController controller;

  const GmailFieldInput({super.key, required this.controller});

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
        hintText: 'Correo electronico', 
        prefixIcon: Icon(Icons.mail), 
        obscureText: false,),
    );
  }
}
