import 'package:flutter/material.dart';
import 'package:fruitsapp/features/homeScreen/view/homeMainScreen.dart';
import 'package:fruitsapp/features/welcomeScreen/controller/auth_controller.dart';
import 'package:fruitsapp/features/welcomeScreen/view/loginScreen.dart';
import 'package:fruitsapp/features/welcomeScreen/view/siginScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void _handleGoogleSignIn() async {
    await AuthServices().handleGoogleSignIn(context: context);
    if (mounted) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                height: 480,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/welcomeimage.jpg',
                  fit: BoxFit.fitWidth,
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
                              _handleGoogleSignIn();
                            },
                            title: Padding(
                              padding: const EdgeInsets.only(right: 38.0),
                              child: Text(
                                'Continue with Google',
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            leading: Image.asset(
                              'assets/images/google.png',
                              height: 20,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, SignupScreen.routeName);
                          },
                          child: Container(
                            height: 53,
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(colors: [
                                  Color(0xffAEDC81),
                                  Color(0xff98D260),
                                  Color(0xff89D043),
                                  Color(0xff6CC51D),
                                ])),
                            child: Text(
                              'Create an account',
                              style: GoogleFonts.getFont('Poppins',
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
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
