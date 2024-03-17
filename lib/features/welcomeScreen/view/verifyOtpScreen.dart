import 'package:flutter/material.dart';
import 'package:fruitsapp/widgets/displaySnackbar.dart';
import 'package:pinput/pinput.dart';

import '../../../theme/widget_themes/pintheme.dart';
import '../controller/auth_controller.dart';

class VerifyOtpScreen extends StatefulWidget {
  static const String routeName = '/verifyOtp';
  final String phoneNumber;
  final String firstName;
  final String lastName;
  VerifyOtpScreen(
      {Key? key,
      required this.phoneNumber,
      required this.firstName,
      required this.lastName})
      : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  String _pin = '';
  bool isLoading = false;
  void verifyOtp() async {
    if (_pin.isEmpty) {
      displaySnackBar(context: context, content: 'Enter Otp !!');
    } else {
      setState(() {
        isLoading = true;
      });
      await AuthServices().verifyOtp(
          context: context,
          pin: _pin,
          phoneNumber: widget.phoneNumber,
          firstName: widget.firstName,
          lastName: widget.lastName);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Image.asset(
                  'assets/images/otp.png',
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone before getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                showCursor: true,
                onCompleted: (pin) {
                  setState(() {
                    _pin = pin;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: (isLoading)
                    ? Container(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          verifyOtp();
                        },
                        child: Text(
                          "Verify Phone Number",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w900),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
