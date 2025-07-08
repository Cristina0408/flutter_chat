import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login/login_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
