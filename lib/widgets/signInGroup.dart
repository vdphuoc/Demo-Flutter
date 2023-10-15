import 'package:demo_oct_16/widgets/socialNetwork.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingInGroup extends StatelessWidget {
  const SingInGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0xFFF56B3F),
          ),
          child: Text(
            'Sign in',
            style: GoogleFonts.inter(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
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
