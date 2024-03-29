import 'package:flutter/material.dart';
import 'package:fruitsapp/admin/features/widgets/BestSeller.dart';
import 'package:fruitsapp/admin/features/widgets/Drawer.dart';
import 'package:fruitsapp/admin/features/widgets/dashboardcard.dart';
import 'package:iconsax/iconsax.dart';

import 'add_product.dart';

class AdminHomePage extends StatefulWidget {
  static const routeName = '/adminHome';
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  List<Widget> pages = [AddProductScreen(), Text('data')];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Admin Panel",
          style:
              TextStyle(color: Colors.grey[900], fontWeight: FontWeight.w500),
        ),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //basic 4 display Dashboard
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              padding: const EdgeInsets.all(15),
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text("DashBoard",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.blue[900]))),
                Row(children: [
                  Expanded(
                    child: DashboardCard(
                      containerColor: Color(0xffF7CDA2),
                      icon: Iconsax.user_edit,
                      headingText: "9999+",
                      subText1: "All Members",
                      subText2: "Since Stand",
                      textColor: Color(0xffA34E00),
                    ),
                  ),
                  Expanded(
                    child: DashboardCard(
                      containerColor: Color(0xffB6F9B6),
                      icon: Iconsax.user_cirlce_add,
                      headingText: "1000+",
                      subText1: "New Members",
                      subText2: "From Last Month",
                      textColor: Color(0xff007312),
                    ),
                  )
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Expanded(
                    child: DashboardCard(
                      containerColor: Color(0xffF79C96),
                      icon: Iconsax.profile_delete,
                      headingText: "1000+",
                      subText1: "New Members",
                      subText2: "From Last Month",
                      textColor: Color(0xffCC0000),
                    ),
                  ),
                  Expanded(
                    child: DashboardCard(
                      containerColor: Color(0xffABB9EE),
                      icon: Iconsax.tag,
                      headingText: "500+",
                      subText1: "Sale Product",
                      subText2: "ALL Time",
                      textColor: Color(0xff003FB9),
                    ),
                  )
                ])
              ]),
            ),
            //BestSellers
            Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("BestSellers",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  color: Colors.blue[900])),
                          Row(
                            children: [
                              Text("More  ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.blue[900])),
                              GestureDetector(
                                  onTap: () {},
                                  child: Icon(Iconsax.arrow_circle_right))
                            ],
                          )
                        ],
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Products",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 15,
                                          color: Colors.blue[900])),
                                  Row(
                                    children: [
                                      Text("Profit",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.blue[900])),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              // Call the widget 10 times
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  // You can return the widget you want to repeat here
                                  // For example, return a ListTile
                                  return BestSeller(i: index);
                                },
                              ),
                            ],
                          ))
                    ],
                  ),
                ))
            //latest Orders
          ],
        ),
      ),
    );
  }
}
