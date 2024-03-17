import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/admin/features/adminHomeScreen.dart';
import 'package:fruitsapp/features/welcomeScreen/view/verifyEmailPage.dart';
import 'package:fruitsapp/features/welcomeScreen/view/verifyOtpScreen.dart';
import 'package:fruitsapp/models/userModel.dart';
import 'package:fruitsapp/widgets/displaySnackbar.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../homeScreen/view/homeMainScreen.dart';

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static late String verificationId;
  static late String phoneNumber;
  Future<String> handleGoogleSignIn({required BuildContext context}) async {
    String res = 'something';
    try {
      // GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      // UserCredential userCredential =
      //     await firebaseAuth.signInWithProvider(googleAuthProvider);
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // User canceled the sign-in process
        print('res is  null');
        return res;
      }

      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user!.uid);
      print(googleUser.id);
      ModelUser user = ModelUser(
          firstName: googleUser.displayName!.split(' ').first,
          lastName: googleUser.displayName!.split(' ').last,
          uid: googleUser!.id,
          email: googleUser.email,
          phoneNumber: '',
          profilePicture: googleUser.photoUrl.toString());
      await storeUserData(user: user);
    } on FirebaseAuthException catch (e) {
      print(e.toString() + 'bruh');
      if (e.code == 'email-already-in-use') {
        res = 'There already exists an account with the given email address';
      } else if (e.code == 'invalid-email') {
        res = 'the email address is not valid';
      } else if (e.code == 'weak-password') {
        res = 'Password should be of atleast 6 letters';
      }
      print('bruh' + res);
    }

    return res;
  }

  Future<void> storeUserData({required ModelUser user}) async {
    try {
      await firestore.collection('Users').doc(user.uid).set(user.toJson());
    } catch (err) {}
  }

  Future<void> createUserWithEmailPassword(
      {required BuildContext context,
      required firstName,
      required lastName,
      required email,
      required phoneNumber,
      required String password}) async {
    try {
      UserCredential credential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      ModelUser user = ModelUser(
          firstName: firstName,
          lastName: lastName,
          uid: credential.user!.uid,
          email: email,
          phoneNumber: phoneNumber,
          profilePicture: '',
          userType: 'user');

      await storeUserData(user: user);
      Navigator.pushReplacementNamed(context, VerifyEmailPage.routeName);
    } on FirebaseAuthException catch (err) {
      print(err.toString());
      displaySnackBar(context: context, content: err.toString());
    }
  }

  Future<void> sendVerificationMail({required BuildContext context}) async {
    try {
      await firebaseAuth.currentUser!.sendEmailVerification();
    } catch (err) {
      displaySnackBar(context: context, content: err.toString());
    }
  }

  Future<void> loginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print(credential.user!.email);

      DocumentSnapshot snapshot =
          await firestore.collection('Users').doc(credential.user!.uid).get();
      (snapshot['userType'] != 'user')
          ? Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
              return AdminHomePage();
            }), (route) => false)
          : Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.routeName, (route) => false);
    } on FirebaseAuthException catch (err) {
      print(err.code.toString());
      displaySnackBar(context: context, content: err.message.toString());
    }
  }

  Future<void> getPhoneNumber({
    required BuildContext context,
    required String phoneNumber,
    required firstName,
    required lastName,
  }) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) async {
          AuthServices.verificationId = verificationId;
          print('verificationId ' + AuthServices.verificationId);
          AuthServices.phoneNumber = phoneNumber;
          ModelUser user = ModelUser(
              firstName: firstName,
              lastName: lastName,
              uid: '',
              email: '',
              phoneNumber: '',
              profilePicture: '',
              userType: 'user');
          await storeUserData(user: user);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return VerifyOtpScreen(
              phoneNumber: phoneNumber,
              firstName: firstName,
              lastName: lastName,
            );
          }));
          //Navigator.pushNamed(context, MyVerify.routeName);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          displaySnackBar(context: context, content: 'error');
        },
      );
    } on FirebaseAuthException catch (err) {
      displaySnackBar(context: context, content: err.toString());
    }
  }

  Future<void> verifyOtp({
    required BuildContext context,
    required String pin,
    required String phoneNumber,
    required firstName,
    required lastName,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: pin);
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      ModelUser user = ModelUser(
          firstName: firstName,
          lastName: lastName,
          uid: userCredential.user!.uid,
          email: '',
          phoneNumber: phoneNumber,
          profilePicture: '');
      await AuthServices().storeUserData(user: user);
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.routeName, (route) => false);
    } catch (err) {
      displaySnackBar(context: context, content: err.toString());
    }
  }
}
