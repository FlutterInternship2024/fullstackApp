import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fruitsapp/features/homeScreen/view/homeMainScreen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/product.dart';

class ProductDetailsPage extends StatefulWidget {
  static const route = '/detail';
  final Product product;
  const ProductDetailsPage({super.key, required this.product});
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 0; // Default quantity

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined),
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
            SizedBox(
              width: 10,
            ),
            Text('Product Details'),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                widget.product.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xffF4F5F9),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$${widget.product.price}',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Color(0xFF28B446),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.product.productName,
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: widget.product.rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${widget.product.rating}',
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      widget.product.desc,
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Color(0xFF868889)),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Quantity",
                                style: GoogleFonts.poppins(
                                    fontSize: 15, color: Color(0xFF868889)),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Color(0xFF6CC51D),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (quantity > 0) {
                                        quantity--;
                                      }
                                    });
                                  },
                                ),
                                Text(
                                  '$quantity',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Color(0xFF6CC51D),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 28),
                    GestureDetector(
                      onTap: () {
                        // Implement checkout logic
                      },
                      child: Container(
                        height: 53,
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Color(0xff8ad760),
                              Color(0xff8ac74c),
                              Color(0xff6db424),
                              Color(0xff519a0e),
                            ])),
                        child: Center(
                          child: Text(
                            'ADD TO CART',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
