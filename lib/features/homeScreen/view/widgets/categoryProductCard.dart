import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCards extends StatelessWidget {
  final int productNumber;

  const ProductCards({
    Key? key,
    required this.productNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/prod$productNumber.png', // Dynamically construct the image asset path
                    width: screenWidth * 0.2, // Adjust based on screen size
                    height: screenWidth * 0.2, // Adjust based on screen size
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Handle favorite button press
                  },
                  icon: Icon(
                    Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pomegranate',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:
                          screenWidth * 0.04, // Adjust based on screen size
                    ),
                  ),
                  SizedBox(
                      height:
                          screenWidth * 0.01), // Adjust based on screen size
                  Text(
                    '1.50 lbs',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize:
                          screenWidth * 0.03, // Adjust based on screen size
                    ),
                  ),
                  SizedBox(
                      height:
                          screenWidth * 0.01), // Adjust based on screen size
                  Text(
                    '\$289',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize:
                          screenWidth * 0.04, // Adjust based on screen size
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle add to cart button press
                    },
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                          fontSize: screenWidth *
                              0.035), // Adjust based on screen size
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            screenWidth * 0.05, // Adjust based on screen size
                        vertical:
                            screenWidth * 0.02, // Adjust based on screen size
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
