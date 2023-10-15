// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              emailTextField(),
              const SizedBox(
                height: 8,
              ),
              PassWordField(),
              // passwordTextField(_passwordVisible),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  RememberCheckbox(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget emailTextField() {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: const Color(0xFF4DA1B0),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //mail icon
          const Icon(
            Icons.mail_rounded,
            color: Colors.white70,
          ),
          const SizedBox(
            width: 16,
          ),

          //divider svg
          SvgPicture.string(
            '<svg viewBox="99.0 332.0 1.0 15.5" ><path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#ffffff" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            width: 1.0,
            height: 15.5,
          ),
          const SizedBox(
            width: 16,
          ),

          //email address textField
          Expanded(
            child: TextField(
              maxLines: 1,
              cursorColor: Colors.white70,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.inter(
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 14.0,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    ),
  );
}

class PassWordField extends StatefulWidget {
  const PassWordField({super.key});

  @override
  State<PassWordField> createState() => _PassWordFieldState();
}

class _PassWordFieldState extends State<PassWordField> {
  late bool _passwordVisible;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFF4DA1B0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //lock logo here
            const Icon(
              Icons.lock,
              color: Colors.white70,
            ),
            const SizedBox(
              width: 16,
            ),

            //divider svg
            SvgPicture.string(
              '<svg viewBox="99.0 332.0 1.0 15.5" ><path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#ffffff" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              width: 1.0,
              height: 15.5,
            ),
            const SizedBox(
              width: 16,
            ),

            //password textField
            Expanded(
              child: TextField(
                maxLines: 1,
                cursorColor: Colors.white70,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _passwordVisible,
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14.0,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            _passwordVisible = !_passwordVisible;
                          },
                        );
                      },
                      child: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white70,
                      ),
                    ),
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RememberCheckbox extends StatefulWidget {
  const RememberCheckbox({super.key});
  @override
  State<RememberCheckbox> createState() => _RemembercheckboxState();
}

class _RemembercheckboxState extends State<RememberCheckbox> {
  bool rememberMe = false;
  @override
  void initState() {
    super.initState();
    _loadRememberMeStatus();
  }

  _loadRememberMeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      rememberMe = prefs.getBool('rememberMe') ?? false;
    });
  }

  _saveRememberMeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', rememberMe);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 17.0,
                height: 17.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  //border: Border.all(color: Colors.red, width: 1),
                  gradient: const LinearGradient(
                    begin: Alignment(5.65, -1.0),
                    end: Alignment(-1.0, 1.94),
                    colors: [
                      Color.fromARGB(255, 83, 34, 181),
                      Color.fromARGB(255, 43, 220, 191)
                    ],
                  ),
                ),
                // child: SvgPicture.string(
                //   // Vector 5
                //   '<svg viewBox="47.0 470.0 7.0 4.0" ><path transform="translate(47.0, 470.0)" d="M 0 1.5 L 2.692307710647583 4 L 7 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" /></svg>',
                //   width: 7.0,
                //   height: 4.0,
                // ),
                child: Checkbox(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                  activeColor: const Color.fromARGB(255, 246, 206, 88),
                  // checkColor: Colors.amber,
                  value: rememberMe,
                  onChanged: (newValue) {
                    setState(() {
                      rememberMe = newValue!;
                      _saveRememberMeStatus();
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Remember me',
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => {},
                child: Text(
                  'Forgot Password',
                  style: GoogleFonts.inter(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
