import 'package:flutter/material.dart';

import '../../register/register_page.dart';

class LabelPage extends StatelessWidget {
  const LabelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('¿No tienes una cuenta?'),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterPage()),
            );
          },
          child: Text(
            'Crea una ahora!!',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w100),
          ),
        ),
      ],
    );
  }
}
