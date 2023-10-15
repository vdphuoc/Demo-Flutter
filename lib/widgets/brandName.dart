import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandName extends StatelessWidget {
  const BrandName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: RichText(
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
        ),
      ],
    );
  }
}
