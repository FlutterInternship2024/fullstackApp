import 'package:cloud_firestore/cloud_firestore.dart';

class ModelUser {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String profilePicture;
  final String uid;
  final String userType;

  ModelUser(
      {required this.firstName,
      required this.lastName,
      required this.uid,
      required this.email,
      required this.phoneNumber,
      this.userType = 'user',
      required this.profilePicture});

  Map<String, dynamic> toJson() => {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'profilePicture': profilePicture,
        'uid': uid
      };

  static ModelUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ModelUser(
      userType: snapshot['userType'],
      email: snapshot['email'] ?? '',
      firstName: snapshot['firstName'] ?? '',
      uid: snapshot['uid'],
      lastName: snapshot['lastName'] ?? '',
      phoneNumber: snapshot['phoneNumber'] ?? '',
      profilePicture: snapshot['profilePicture'] ?? '',
    );
  }
}
