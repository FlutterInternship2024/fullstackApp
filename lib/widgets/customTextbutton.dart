import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.callback, required this.buttonTitle});
  final VoidCallback callback;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          buttonTitle,
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
