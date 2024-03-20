import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BestSeller extends StatefulWidget {
  final int i;
  const BestSeller({super.key, required this.i});

  @override
  State<BestSeller> createState() => _BestSellerState();
}

class _BestSellerState extends State<BestSeller> {

  List<IconData> icons = [
    Icons.local_florist, // Fresh Fruits
    Icons.eco, // Organic Fruits
    Icons.wb_sunny, // Seasonal Fruits
    Icons.food_bank, // Dried Fruits
    Icons.card_giftcard, // Gift Baskets
    Icons.shopping_cart, // Bulk Purchases
    // Add more icons as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the container
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 5, // Blur radius
            offset: Offset(0, 3), // Offset of the shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(icons[widget.i%6]),
              ),
              Text(
                "product ${widget.i}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.blue[900],
                ),
              ),
            ],
          ),
          Text(
            '${10000-widget.i}₹',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
        ],
      ),
    );
  }
}
