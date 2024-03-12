import 'package:flutter/material.dart';
import 'package:fruitsapp/features/homeScreen/view/accountMainScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

import '../../../widgets/shimmer.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  List pages = [HomeBody(), Text('dsd'), HomeBody(), MyAccountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_currentPage == 3) ? null : AppBar(),
      body: (_isLoading) ? ShimmerScreen() : pages[_currentPage],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentPage,
        onDestinationSelected: (newIndex) {
          setState(() {
            _currentPage = newIndex;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: Colors.green.shade400,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey,
        elevation: 10,
        destinations: [
          NavigationDestination(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          NavigationDestination(
              icon: Icon(Iconsax.shopping_bag), label: 'My Bag'),
          NavigationDestination(
              icon: Icon(Ionicons.cart_outline), label: 'My Orders'),
          NavigationDestination(
              icon: Icon(Ionicons.person_outline), label: 'My Account')
        ],
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [BuildCarouselSlider(), BuildCategories()],
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
    'Fresh Fruits',
    'Organic Fruits',
    'Seasonal Fruits',
    'Dried Fruits',
    'Gift Baskets',
    'Bulk Purchases',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: GoogleFonts.getFont('Poppins', fontSize: 22),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: fruitCategories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                      ),
                      Text(fruitCategories[index])
                    ],
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
