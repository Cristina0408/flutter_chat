import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data_base.dart';
import 'package:flutter_application_1/auth/register/widgets/registro_field.dart';

import 'package:image_picker/image_picker.dart';

import '../../models/users.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  File? profileImage;
  final ImagePicker _picker = ImagePicker();

  final emailController = TextEditingController();
  final passwordControlles = TextEditingController();
  final usernameController = TextEditingController();

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  void registerUser() {
    String email = emailController.text.trim();
    String password = passwordControlles.text;
    String username = usernameController.text;

    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      _showMessage('Por favor completa todos los campos');
      return;
    }

    if (!email.endsWith('@gmail.com')) {
      _showMessage('Por favor ingresa un correo Gmail válido');
      usernameController.clear();
      emailController.clear();
      passwordControlles.clear();
      return;
    }

    DataBase.registeredUser.add(
      Users(
        username: username,
        email: email,
        password: password,
        profileImage: profileImage?.path ?? '',
      ),
    );

    UsuarioRegistrado.registrado = true;

    _showMessage('Usuario registrado exitosamente');
    Navigator.pop(context);
  }

  void _showMessage(String msg) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Expanded(child: Text(msg))],
      ),
      backgroundColor: Colors.deepPurpleAccent,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                perfil(),
                SizedBox(height: 10),
                Text('Agrega una imagen de perfil'),
                SizedBox(height: 5),
                RegistroField(
                  emailController: emailController,
                  passwordController: passwordControlles,
                  usernameController: usernameController,
                  registerUser: registerUser,
                ),
                SizedBox(height: 5),
                Image(
                  image: AssetImage('assets/registro.gif'),
                  width: 100,
                  height: 100,
                ),
                Text(
                  'Firma Shrek...FIRMA!!!😠',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector perfil() {
    return GestureDetector(
      onTap: pickImage,
      child: CircleAvatar(
        radius: 60,
        backgroundColor: Colors.white,
        backgroundImage: profileImage != null
            ? FileImage(profileImage!)
            : NetworkImage('https://example.com/default_avatar.png')
                  as ImageProvider,
        child: profileImage == null
            ? Icon(Icons.person, size: 90, color: Colors.grey)
            : null,
      ),
    );
  }
}

class UsuarioRegistrado {
  static bool registrado = false;
}
