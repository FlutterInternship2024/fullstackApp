import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  List<Widget> pages = [Text('data'), Text('data')];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.green,
        backgroundColor: Colors.white,
        selectedIndex: _currentIndex,
        onDestinationSelected: (newVal) {
          setState(() {
            _currentIndex = newVal;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.analytics_outlined), label: 'Analytics')
        ],
      ),
    );
  }
}
