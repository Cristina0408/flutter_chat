import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/auth/login/widgets/form.dart';
import 'package:flutter_application_1/pages/auth/login/widgets/label.dart';

import '../../term_condicions/terms_condicions_page.dart';

import 'widgets/logo.dart';

class LoginPage extends StatelessWidget {
  
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(),
      body: SafeArea(
        child:SingleChildScrollView(
        physics:BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Logo(),
              SizedBox(height: 10),
              Forms(),
              SizedBox(height: 10),
              LabelPage(),
             
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const TermsPage(),
                    ),
                  );
                },
                child: Text(
                  'Terminos y condiciones de uso',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ],
            ),
        ),
        ),
      )
    );
  }
}