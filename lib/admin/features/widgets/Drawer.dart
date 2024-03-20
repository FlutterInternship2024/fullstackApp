import 'package:flutter/material.dart';
import 'package:fruitsapp/admin/features/add_product.dart';
import 'package:fruitsapp/admin/features/adminHomeScreen.dart';

import '../views/Analysis.dart';
import '../views/order.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[300],
        child: ListView(
          children: [
            DrawerHeader(
              child: Icon(Icons.home, size: 35),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AdminHomePage.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Order',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Order.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Product',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddProductScreen();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Analysis',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Analysis.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
