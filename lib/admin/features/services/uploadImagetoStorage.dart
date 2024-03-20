import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruitsapp/models/product.dart';
import 'package:uuid/uuid.dart';

class AdminServices {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> uploadImageToFireStorage(
      {required String childName, required Uint8List file}) async {
    String downloadUrl = '';
    try {
      String pid = Uuid().v1();
      Reference _ref = _storage
          .ref()
          .child(childName)
          .child(_auth.currentUser!.email!)
          .child(pid);
      UploadTask uploadTask = _ref.putData(file);
      TaskSnapshot taskSnapshot = await uploadTask;
      downloadUrl = await taskSnapshot.ref.getDownloadURL();
    } catch (err) {
      print(err.toString());
    }
    return downloadUrl;
  }

  Future<String> uploadProduct(
      {required BuildContext context,
      required String productName,
      required String itemCount,
      required String price,
      required String desc,
      required String unit,
      required String category,
      required Uint8List file}) async {
    String res = 'Some error occured';
    try {
      String photoUrl =
          await uploadImageToFireStorage(childName: 'products', file: file);
      String productId = Uuid().v1();
      final _product = Product(productId, productName, photoUrl,
          int.parse(itemCount), int.parse(price), 0, desc, unit, category);

      await _firestore
          .collection('products')
          .doc(_product.productId)
          .set(_product.toJson());
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
