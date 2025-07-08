import 'package:flutter/material.dart';

class IngresoWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const IngresoWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shadowColor: Colors.blueGrey,
        elevation: 5,
        fixedSize: const Size(460, 50),
      ),
      child: const Text('Ingresar'),
    );
  }
}
