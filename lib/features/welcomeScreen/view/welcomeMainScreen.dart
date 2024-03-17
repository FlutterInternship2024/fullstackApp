import 'package:flutter/material.dart';
import 'package:fruitsapp/features/welcomeScreen/view/loginScreen.dart';
import 'package:fruitsapp/features/welcomeScreen/view/phoneVerificationScreen.dart';
import 'package:fruitsapp/features/welcomeScreen/view/siginScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String res = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xffF5F5F5),
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                height: 480,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/welcome.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 10,
                top: 430,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'Welcome.',
                            style: GoogleFonts.getFont('Poppins',
                                color: Colors.black, fontSize: 28),
                          ),
                        ),
                        Text(
                          'Please verify yourself to get started.\nChoose one of the authentication methods.',
                          style: GoogleFonts.getFont('Poppins',
                              color: Colors.grey.shade600, fontSize: 15),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PhoneVerificationScreen.routeName);
                            },
                            title: Padding(
                              padding: const EdgeInsets.only(right: 38.0),
                              child: Text(
                                'Create account via Phone',
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            leading: Image.asset(
                              'assets/images/phonecall.png',
                              height: 25,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightGreen,
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SignupScreen.routeName);
                            },
                            title: Padding(
                              padding: const EdgeInsets.only(right: 38.0),
                              child: Text(
                                'Create account via Email',
                                style: GoogleFonts.getFont('Poppins',
                                    color: Colors.white, fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            leading: Image.asset(
                              'assets/images/email.png',
                              height: 25,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                          // Single tapped.

                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                  text: TextSpan(
                                      text: 'Already have an account? ',
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                      children: [
                                    TextSpan(
                                      text: 'Login',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ])),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
