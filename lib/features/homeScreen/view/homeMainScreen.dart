import 'package:flutter/material.dart';
import 'package:fruitsapp/features/homeScreen/view/accountMainScreen.dart';
import 'package:fruitsapp/features/homeScreen/view/categoryPage.dart';
import 'package:fruitsapp/features/homeScreen/view/widgets/homeProductCard.dart';
import 'package:fruitsapp/features/productScreen/views/detailsScreen.dart';
import 'package:fruitsapp/models/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

import '../../../widgets/shimmer.dart';
import '../../orderScreen/view/orderScreen.dart';
import '../../searchScreen/view/searchScreen.dart';
import '../widgets/widgets.dart';
import 'categoryList.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getData();
  }

  int _currentPage = 0;
  bool _isLoading = false;
  void getData() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      _isLoading = false;
    });
  }

  List pages = [HomeBody(), OrderPage(), MyAccountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_currentPage == 2 || _currentPage == 1 || _currentPage == 3)
          ? null
          : AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Color(0xffF4F5F9),
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SearchScreen(focusNode: _focusNode)),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 10),
                      Expanded(
                          child: Text(
                        'Search...',
                        style: GoogleFonts.getFont('Poppins', fontSize: 16),
                      )),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
      body: (_isLoading) ? ShimmerScreen() : pages[_currentPage],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentPage,
        onDestinationSelected: (newIndex) {
          setState(() {
            _currentPage = newIndex;
          });
        },
        backgroundColor: Colors.grey[200],
        indicatorColor: Colors.green.shade400,
        surfaceTintColor: Colors.white,
        elevation: 10,
        destinations: [
          NavigationDestination(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          NavigationDestination(
              icon: Icon(Iconsax.shopping_bag), label: 'My Bag'),
          NavigationDestination(
              icon: Icon(Ionicons.person_outline), label: 'My Account')
        ],
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<Product> productList = [
    Product(
      '1',
      'Apple',
      'assets/images/prod1.png',
      5,
      100,
      4.5,
      'Fresh and juicy apples',
      'kg',
      'Fresh Fruits',
    ),
    Product(
      '2',
      'Banana',
      'assets/images/prod2.png',
      4,
      80,
      4.0,
      'Organic bananas',
      'kg',
      'Organic Fruits',
    ),
    Product(
      '3',
      'Orange',
      'assets/images/prod3.png',
      3,
      60,
      3.5,
      'Sweet and tangy oranges',
      'kg',
      'Seasonal Fruits',
    ),
    Product(
      '4',
      'Raisins',
      'assets/images/prod4.png',
      3,
      60,
      3.5,
      'Dried raisins',
      'kg',
      'Dried Fruits',
    ),
    Product(
      '5',
      'Fruit Basket',
      'assets/images/prod3.png',
      3,
      60,
      3.5,
      'Assorted fruits in a basket',
      'each',
      'Gift Baskets',
    ),
    Product(
      '6',
      'Bulk Apples',
      'assets/images/prod2.png',
      3,
      60,
      3.5,
      'Bulk purchase of apples',
      'kg',
      'Bulk Purchases',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xffF4F5F9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildCarouselSlider(),
            SizedBox(
              height: 5,
            ),
            BuildCategories(),
            SizedBox(
              height: 5,
            ),
            BuildFeaturedProducts(productList: productList),
          ],
        ),
      ),
    );
  }
}

// Featured Products
class BuildFeaturedProducts extends StatelessWidget {
  const BuildFeaturedProducts({
    super.key,
    required this.productList,
  });

  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 19),
              //Header
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured Products',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            //Fruits Header
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 8),
              child: Text(
                'Fruits',
                style: GoogleFonts.getFont(
                  'Poppins',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            BuildListProducts(productList: productList),
            //Veges Header

            Container(
              height: 10,
              color: Color(0xffF4F5F9),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Text(
                'Vegetables',
                style: GoogleFonts.getFont(
                  'Poppins',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            BuildListProducts(productList: productList),
          ],
        ),
      ),
    );
  }
}

//List view of Products
class BuildListProducts extends StatelessWidget {
  const BuildListProducts({
    super.key,
    required this.productList,
  });

  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                ProductDetailsPage.route,
                arguments:
                    productList[index], // Pass the product object as argument
              );
            },
            child: ProductCard(
              product: productList[index],
            ),
          ),
        ),
      ),
    );
  }
}

// BottomNavigationBarItem(icon: Icon(Ionicons.person_sharp), label: '')
class BuildCategories extends StatefulWidget {
  const BuildCategories({super.key});

  @override
  State<BuildCategories> createState() => _BuildCategoriesState();
}

class _BuildCategoriesState extends State<BuildCategories> {
  List<String> fruitCategories = [
    'Fresh',
    'Organic',
    'Seasonal',
    'Dried',
    'Gift',
    'Bulk',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Categories',
                    style: GoogleFonts.getFont('Poppins', fontSize: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      Navigator.pushNamed(context, CategoryListPage.routeName);
                    },
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 6.2,
              child: ListView.builder(
                itemCount: fruitCategories.length,
                itemBuilder: (context, index) {
                  // Define lists for icons and colors
                  List<IconData> icons = [
                    Icons.local_florist, // Fresh Fruits
                    Icons.eco, // Organic Fruits
                    Icons.wb_sunny, // Seasonal Fruits
                    Icons.food_bank, // Dried Fruits
                    Icons.card_giftcard, // Gift Baskets
                    Icons.shopping_cart, // Bulk Purchases
                    // Add more icons as needed
                  ];
                  // List<Color> colors = [
                  //   Colors.lightGreen[200]!, // Fresh Fruits
                  //   Colors.lightBlueAccent[200]!, // Organic Fruits
                  //   Colors.orangeAccent[100]!, // Seasonal Fruits
                  //   Colors.amber[200]!, // Dried Fruits
                  //   Colors.purpleAccent[100]!, // Gift Baskets
                  //   Colors.blue[100]!, // Bulk Purchases
                  //   // Add more colors as needed
                  // ];
                  //
                  // List<Color> iconColors = [
                  //   Colors.green[800]!, // Fresh Fruits
                  //   Colors.lightBlue[800]!, // Organic Fruits
                  //   Colors.orange[800]!, // Seasonal Fruits
                  //   Colors.amber[800]!, // Dried Fruits
                  //   Colors.purple[800]!, // Gift Baskets
                  //   Colors.blue[800]!, // Bulk Purchases
                  //   // Add more colors as needed
                  // ];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CategoryDetailPage.routeName,
                          arguments: index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.lightGreen[200]),
                            child: Center(
                              child: Icon(
                                icons[index], // Use icon based on index
                                color: Colors.green[800],
                                size: 38,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            fruitCategories[index],
                            style: GoogleFonts.getFont('Poppins',
                                fontSize: 15, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Product Card
