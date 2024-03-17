import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatefulWidget {
  final IconData icon;
  final Color boxColor;
  final Color iconColor;
  final String text;
  const CategoryCard(
      {Key? key,
      required this.icon,
      required this.boxColor,
      required this.iconColor,
      required this.text})
      : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5), // Reduce padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8), // Reduce border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Lighten shadow
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: CircleAvatar(
              radius: 35,
              backgroundColor: widget.boxColor,
              child: Icon(
                widget.icon,
                size: 28, // Reduce icon size
                color: widget.iconColor, // Darken icon color
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.text,
                style: GoogleFonts.getFont('Poppins', fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
