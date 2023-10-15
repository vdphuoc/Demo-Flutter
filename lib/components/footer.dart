import 'package:flutter/material.dart';

class Footter extends StatelessWidget {
  const Footter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          '\u00a9 Author\'s Phuoc',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
