import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/chat/chat_page.dart';
import 'package:flutter_application_1/pages/auth/login/login_page.dart';

import '../auth/register/register_page.dart';


class PrivacyPage extends StatelessWidget {
 
  const PrivacyPage({super.key});

  final String privacyText = '''
Política de Privacidad

1. Información que recopilamos

    Datos que proporcionas al registrarte (nombre, correo electrónico, etc.).

    Mensajes y contenido que envías a través de la app.

    Datos técnicos como dirección IP, tipo de dispositivo, sistema operativo.

2. Uso de la información

    Para proveer, mantener y mejorar la app.

    Para comunicarte notificaciones y actualizaciones.

    Para proteger la seguridad y evitar fraudes.

3. Compartir información

    No vendemos ni alquilamos tu información a terceros.

    Podemos compartir información con proveedores que nos ayudan a operar la app.

    Podremos divulgar datos si la ley nos obliga.

4. Seguridad

    Implementamos medidas de seguridad para proteger tus datos.

    Sin embargo, ningún sistema es 100% seguro.

5. Tus derechos

    Puedes acceder, corregir o eliminar tu información.

    Puedes desactivar tu cuenta en cualquier momento.

6. Cambios a esta política

    Podemos actualizar esta política.

    Te informaremos sobre cambios importantes.

7. Contacto

Para consultas sobre privacidad, escribime a mi 😗
''';
  final bool isRegistered = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Política de Privacidad')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(privacyText, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (isRegistered) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const ChatPage()
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("¡Advertencia!"),
                        content: const Text(
                          "Bienvenid@!!!! Pasa a registrarte para empezar ☺️",
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const RegisterPage(),
                                ),
                              );
                            },
                            child: const Text("Registrar"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Aceptar términos y condiciones'),
            ),

            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const LoginPage(),
                  ),
                );
              },
              child: const Text(
                'Aceptar más tarde',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
