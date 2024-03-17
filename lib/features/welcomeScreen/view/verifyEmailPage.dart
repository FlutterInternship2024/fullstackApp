import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/admin/features/adminHomeScreen.dart';
import 'package:fruitsapp/features/homeScreen/view/homeMainScreen.dart';
import 'package:fruitsapp/features/welcomeScreen/controller/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/text_strings.dart';

class VerifyEmailPage extends StatefulWidget {
  static const routeName = '/verifyemail';
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool _isVerified = false;
  Timer? timer;
  bool _canSendEmail = true;
  int _resendCooldown = 0;
  bool isAdmin = false;
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (FirebaseAuth.instance.currentUser!.phoneNumber != null) {
      setState(() {
        _isVerified = true;
        // Check if user is authenticated using phone number
      });
    } else {
      setState(() {
        _isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      });
    }
    if (_isVerified) {
      _checkAdmin();
    }
    if (!_isVerified) {
      AuthServices().sendVerificationMail(context: context);
    }

    timer = Timer.periodic(Duration(seconds: 3), (_) => _checkMailVerified());
  }

  Future<void> _checkMailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      if (FirebaseAuth.instance.currentUser != null) {
        if (FirebaseAuth.instance.currentUser!.phoneNumber != null) {
          setState(() {
            _isVerified = true;
            // Check if user is authenticated using phone number
          });
        } else {
          setState(() {
            _isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
          });
        }
      }
    });
    if (_isVerified) {
      timer!.cancel();
    }
  }

  Future<void> _sendVerificationEmail() async {
    await AuthServices().sendVerificationMail(context: context);
    setState(() {
      _canSendEmail = false;
    });
    await Future.delayed(Duration(seconds: 30));
    setState(() {
      _canSendEmail = false;
      _resendCooldown = 30;
    });
    timer = Timer.periodic(Duration(seconds: 1), (_) => _updateCountdown());
  }

  @override
  void dispose() {
    timer!.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  void _updateCountdown() {
    if (_resendCooldown > 0) {
      setState(() {
        _resendCooldown--;
      });
    } else {
      setState(() {
        _canSendEmail = true;
      });
      timer!.cancel();
    }
  }

  void _checkAdmin() async {
    try {
      setState(() {
        _isLoading = true;
      });
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (snapshot['userType'] != 'user') {
        setState(() {
          isAdmin = true;
        });
      } else {
        setState(() {
          isAdmin = false;
        });
      }
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return (_isVerified)
        ? (_isLoading)
            ? Scaffold(
                body: Center(
                  child: const CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ),
              )
            : (isAdmin)
                ? AdminHomePage()
                : HomeScreen()
        : Scaffold(
            body: SafeArea(
            child: Column(
              children: [
                Text(
                  'Verify email',
                  style: GoogleFonts.getFont('Poppins', fontSize: 30),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'We have sent you a verification email.\nPlease verify yourself to continue.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont('Poppins', fontSize: 18),
                      ),
                      Container(
                          margin: EdgeInsets.all(20),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: (!_canSendEmail)
                                ? () {
                                    return;
                                  }
                                : () {
                                    _sendVerificationEmail();
                                  },
                            child: Text(
                              TTexts.resendEmail,
                              style: GoogleFonts.getFont('Poppins',
                                  color: Colors.white),
                            ),
                          )),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text('Resend email in $_resendCooldown seconds'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ));
  }
}
