import 'package:flutter/material.dart';
import 'package:tripwise/pages/user/login_page.dart';
import 'package:tripwise/pages/user/register_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isSignUpForm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  const Text('Welcome.'),

                  // sign up screen
                  if (isSignUpForm)
                    Column(children: [
                      const RegisterPage(),
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isSignUpForm = false;
                          });
                        },
                        child: const Text(
                          'Click here to sign in instead',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      )
                    ]),

                  // sign in screen
                  if (!isSignUpForm)
                    Column(children: [
                      const LoginPage(),
                      const Text('Need an account?'),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isSignUpForm = true;
                          });
                        },
                        child: const Text(
                          'Click here to sign up instead',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      )
                    ]),
                ])),
      ),
    );
  }
}
