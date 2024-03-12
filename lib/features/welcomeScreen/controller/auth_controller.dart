import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruitsapp/models/userModel.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> handleGoogleSignIn({required BuildContext context}) async {
    String res = 'somethiing';
    try {
      // GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      // UserCredential userCredential =
      //     await firebaseAuth.signInWithProvider(googleAuthProvider);
      GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: ['email']).signIn();
      if (googleUser == null) {
        // User canceled the sign-in process
        return null;
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
          uid: userCredential.user!.uid,
          email: googleUser.email,
          phoneNumber: '',
          profilePicture: googleUser.photoUrl.toString());
      await storeUserData(user: user);
      res = 'succs';
    } on FirebaseAuthException catch (e) {
      print('error sign');
      if (e.code == 'email-already-in-use') {
        res = 'There already exists an account with the given email address';
      } else if (e.code == 'invalid-email') {
        res = 'the email address is not valid';
      } else if (e.code == 'weak-password') {
        res = 'Password should be of atleast 6 letters';
      }
      print(res);
    }
  }

  Future<void> storeUserData({required ModelUser user}) async {
    try {
      await firestore.collection('Users').doc(user.uid).set(user.toJson());
    } catch (err) {}
  }

  Future<void> createUser(
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
          profilePicture: '');
      await storeUserData(user: user);
    } catch (err) {
      print(err.toString());
    }
  }

  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print(credential.user!.email);
    } catch (err) {
      print(err.toString());
    }
  }
}
