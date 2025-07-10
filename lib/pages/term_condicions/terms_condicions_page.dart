import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/term_condicions/privacy_page.dart';

class TermsPage extends StatelessWidget {
  final String termsText = '''
Términos y Condiciones de Uso

Bienvenido a ["Hola lola"]. Al usar nuestra aplicación de chat, aceptas los siguientes términos y condiciones. Por favor, léelos cuidadosamente.
1. Uso de la aplicación

    La app está diseñada para que puedas enviar y recibir mensajes con otros usuarios.

    Debes usar la app solo para fines legales y respetando a los demás usuarios.

    No debes enviar contenido ilegal, ofensivo, difamatorio, o que viole derechos de terceros.

2. Registro y cuenta

    Para usar ciertas funciones, debes crear una cuenta proporcionando información veraz.

    Eres responsable de mantener la confidencialidad de tus datos de acceso.

    Debes notificar inmediatamente si sospechas que tu cuenta fue comprometida.

3. Privacidad y datos

    Respetamos tu privacidad y protegemos tus datos personales conforme a nuestra Política de Privacidad.

    Los mensajes se almacenan en nuestros servidores para permitir la comunicación, pero no compartiremos tu información sin tu consentimiento, salvo requerimiento legal.

4. Responsabilidades

    No somos responsables por el contenido que los usuarios envíen a través de la app.

    La app se proporciona “tal cual” y no garantizamos que esté libre de errores o interrupciones.

    Puedes dejar de usar la app en cualquier momento.

5. Modificaciones

    Podemos modificar estos términos cuando sea necesario.

    Te notificaremos sobre cambios importantes y el uso continuo implica aceptación.

6. Ley aplicable y jurisdicción

    Estos términos se rigen por las leyes de [tu país o estado].

    Cualquier disputa se resolverá en los tribunales correspondientes de esa jurisdicción.

7. Contacto

Para dudas o reclamos, contacta con nosotros en: [tu email o formulario de contacto]

''';

  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => PrivacyPage(),
            ),
          );
        },
        child: Text('Política de Privacidad'),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Términos y Condiciones'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Text(termsText, style: TextStyle(fontSize: 14)),
      ),
    );
  }
}
