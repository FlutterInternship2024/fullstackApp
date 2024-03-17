import 'package:flutter/material.dart';
import 'package:fruitsapp/features/homeScreen/view/widgets/categoryListCard.dart';
import 'package:google_fonts/google_fonts.dart';

import 'categoryPage.dart';

class CategoryListPage extends StatelessWidget {
  static const routeName = '/categoryList';
  List<IconData> icons = [
    Icons.local_florist, // Fresh Fruits
    Icons.eco, // Organic Fruits
    Icons.wb_sunny, // Seasonal Fruits
    Icons.food_bank, // Dried Fruits
    Icons.card_giftcard, // Gift Baskets
    Icons.shopping_cart, // Bulk Purchases
    // Add more icons as needed
  ];
  List<Color> colors = [
    Colors.lightGreen[200]!, // Fresh Fruits
    Colors.lightBlueAccent[200]!, // Organic Fruits
    Colors.orangeAccent[100]!, // Seasonal Fruits
    Colors.amber[200]!, // Dried Fruits
    Colors.purpleAccent[100]!, // Gift Baskets
    Colors.blue[100]!, // Bulk Purchases
    // Add more colors as needed
  ];

  List<Color> iconColors = [
    Colors.green[800]!, // Fresh Fruits
    Colors.lightBlue[800]!, // Organic Fruits
    Colors.orange[800]!, // Seasonal Fruits
    Colors.amber[800]!, // Dried Fruits
    Colors.purple[800]!, // Gift Baskets
    Colors.blue[800]!, // Bulk Purchases
    // Add more colors as needed
  ];

  List<String> fruitCategories = [
    'Fresh Fruits',
    'Organic Fruits',
    'Seasonal Fruits',
    'Dried Fruits',
    'Gift Baskets',
    'Bulk Purchases',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffF4F5F9),
        title: Text(
          'Categories',
          style: GoogleFonts.getFont('Poppins', fontSize: 22),
        ),
      ),
      body: Container(
        color: Color(0xffF4F5F9),
        child: Row(
          children: [
            // Main content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context)
                      .size
                      .height, // Adjust the height as needed
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of columns
                      mainAxisSpacing: 2.0, // Space between rows
                      crossAxisSpacing: 2.0, // Space between columns
                      childAspectRatio:
                          0.9, // Aspect ratio (width / height) of each item
                    ),
                    itemCount: icons.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, CategoryDetailPage.routeName);
                        },
                        child: CategoryCard(
                          icon: icons[index],
                          boxColor: colors[index],
                          iconColor: iconColors[index],
                          text: fruitCategories[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
