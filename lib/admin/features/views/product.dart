import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/Drawer.dart';

class Product extends StatefulWidget {
  static const routeName='/product';
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Admin Panel" ,style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.w500),),
      ),
      drawer:CustomDrawer(),
      body: Container(
        child: Center(child: Text("product")),
      ),
    );
  }
}
