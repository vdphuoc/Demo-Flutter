import 'package:flutter/material.dart';

class LogoBrand extends StatelessWidget {
  const LogoBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      margin: const EdgeInsets.only(top: 30),
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
            "assets/images/logo.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
