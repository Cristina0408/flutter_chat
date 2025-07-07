import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data_base.dart';
import 'package:flutter_application_1/pages/auth/register/widget/registro_field.dart';

import 'package:image_picker/image_picker.dart';

import '../../users/users.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  final emailController = TextEditingController();
  final paswordControlles = TextEditingController();
  final usernameController = TextEditingController();


  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void registerUser() {
    
    String email = emailController.text.trim();
    String password = paswordControlles.text;
    String username = usernameController.text;

    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      showMessage('Por favor completa todos los campos');
      return;
    }

    if (!email.endsWith('@gmail.com')) {
      showMessage('Por favor ingresa un correo Gmail válido');
      return;
    }

    DataBase.registeredUser.add(Users(email: email, password: password, username: '', imagePath: ''));

    UsuarioRegistrado.registrado = true;

    showMessage('Usuario registrado exitosamente');
    Navigator.pop(context);
  }

  void showMessage(String msg) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Expanded(child: Text(msg))],
      ),
      backgroundColor: Colors.deepPurpleAccent,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
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
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : AssetImage('assets/default_avatar.png')
                              as ImageProvider,
                    child: _profileImage == null
                        ? Icon(Icons.person, size: 90, color: Colors.grey)
                        : null,
                  ),
                ),
                SizedBox(height: 10),
                Text('Agrega una imagen de perfil'),
                SizedBox(height: 10),
                RegistroField(
                  emailController: emailController,
                  passwordController: paswordControlles,
                  usernameController: usernameController,
                  registerUser: registerUser, 
                  ),
                SizedBox(height: 10),
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
}

class UsuarioRegistrado {
  static bool registrado = false;
}
