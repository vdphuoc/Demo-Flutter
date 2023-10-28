// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:demo_oct_16/components/brand.dart';
import 'package:demo_oct_16/components/footer.dart';
import 'package:demo_oct_16/components/logingroup.dart';
import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // brand
            Brand(),
            //body
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: LoginGroup(),
            ),
            SizedBox(
              width: 50,
            ),
            Footter(),
          ],
        ),
      ),
    );
  }
}
