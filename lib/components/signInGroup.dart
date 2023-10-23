// ignore_for_file: prefer_const_constructors

import 'package:demo_oct_16/components/socialNetwork.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInGroup extends StatelessWidget {
  const SignInGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF56B3F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minimumSize: Size(150, 50),
          ),
          child: Text(
            'Sign in',
            style: GoogleFonts.inter(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () {
            // Navigator.pushNamed(context, '/catagory');
            Navigator.of(context!).pushNamedAndRemoveUntil(
                '/category', (Route<dynamic> route) => false);
          },
        ),

//! question login other ways
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 20,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Or Continue with',
                style: GoogleFonts.inter(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              width: 20,
              child: Divider(
                color: Colors.white,
              ),
            ),
          ],
        ),
//!end

        SignUpThruSocial(),
        const SizedBox(
          height: 50,
        ),
        RichText(
          text: TextSpan(children: [
            const TextSpan(
              text: 'Don\'t have account? ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextSpan(
                style: const TextStyle(
                    color: Color.fromARGB(255, 235, 87, 1),
                    decoration: TextDecoration.underline),
                //make link blue and underline
                text: " Sign Up",
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    //on tap code here, you can navigate to other page or URL
                  }),
          ]),
        )
      ],
    );
  }
}
