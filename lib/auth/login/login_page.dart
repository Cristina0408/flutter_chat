import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login/widgets/form.dart';
import 'package:flutter_application_1/auth/login/widgets/label.dart';

import '../../pages/term_condicions/terms_condicions_page.dart';

import 'widgets/logo.dart';

class LoginPage extends StatelessWidget {
  
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child:SingleChildScrollView(
        physics:BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 10),
              Logo(),
              Padding(padding: EdgeInsets.only(top: 10,bottom: 40),
              child:  Forms(),
              ),
  
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
              ],
            ),
        ),
        ),
      )
    );
  }
}