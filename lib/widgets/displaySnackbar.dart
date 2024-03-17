import 'package:flutter/material.dart';
import 'package:fruitsapp/constants/colors.dart';

displaySnackBar({required BuildContext context, required String content}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: TColors.primary,
      content: Text(
        content,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
