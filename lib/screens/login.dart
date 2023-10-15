// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:demo_oct_16/components/brandName.dart';
import 'package:demo_oct_16/components/footer.dart';
import 'package:demo_oct_16/components/logo.dart';
import 'package:demo_oct_16/components/signInGroup.dart';
import 'package:flutter/material.dart';
import '../components/loginForm.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.green], // Replace gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // logo
            LogoBrand(),
            // brand name
            BrandName(),
            SizedBox(
              height: 30,
            ),
            //login Form
            LoginForm(),
            SizedBox(
              height: 20,
            ),
            //signin button and Social Button
            Flexible(
              child: SingInGroup(),
            ),
            // footter
            Footter(),
          ],
        ),
      ),
    );
  }
}
