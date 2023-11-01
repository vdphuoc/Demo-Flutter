// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Brand extends StatelessWidget {
  const Brand({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: 150,
          margin: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 149, 220, 17), // Border color
              width: 0.8, // Border width
            ),
            borderRadius: BorderRadius.circular(25.0), // To make it a circle
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(
                "assets/images/system/logo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            RichText(
              text: TextSpan(
                style: GoogleFonts.inter(fontSize: 30),
                children: const [
                  TextSpan(
                    text: 'OR',
                    style: TextStyle(
                      color: Color.fromARGB(255, 237, 237, 237),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: 'DER',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
