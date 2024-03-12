import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildInfoTile extends StatelessWidget {
  const BuildInfoTile({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        title,
        style: TextStyle(
            color: Colors.lightGreen,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      trailing: Text(
        value,
        style: GoogleFonts.getFont('Poppins',
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
      ),
    );
  }
}
