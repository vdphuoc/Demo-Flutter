// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:demo_oct_16/components/socialNetwork.dart';
import 'package:demo_oct_16/model/authenticate.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginGroup extends StatefulWidget {
  const LoginGroup({super.key});

  @override
  State<LoginGroup> createState() => _LoginGroupState();
}

class _LoginGroupState extends State<LoginGroup> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String message = '';

  late bool _passwordVisible;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  Future<bool> _login() async {
    final String username = usernameController.text;
    final String password = passwordController.text;
    bool flag = false;

    bool isAuthenticated = await authenticateUser(username, password);

    if (isAuthenticated) {
      setState(() {
        message = 'Login successful';
        print('$message and usrname:[ $username ] and password: [$password]');
      });
      flag = true;
    } else {
      setState(() {
        message = 'Invalid username or password';
        print('$message and usrname:[ $username ] and password: [$password]');
      });
      flag = false;
    }
    return flag;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! username field
        Container(
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

                //username textField
                Expanded(
                  child: TextField(
                    controller: usernameController,
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
        ),
        //size box
        const SizedBox(
          height: 8,
        ),
        //!pwd field
        Container(
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
                    controller: passwordController,
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
        ),
        //! size box
        const SizedBox(
          height: 16,
        ),
        //!remember pwd
        Row(
          children: [
            SizedBox(
              width: 8,
            ),
            RememberCheckbox(),
            SizedBox(
              width: 8,
            ),
          ],
        ),
        //! sign in button
        Column(
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
              onPressed: () async {
                // Navigator.pushNamed(context, '/catagory');

                var flag = _login();

                if (await flag) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/category', (Route<dynamic> route) => false);
                } else {
                  print('invalid user and pwd...');
                }
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
        )
      ],
    );
  }
}

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
