import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/BestSeller.dart';
import '../widgets/Drawer.dart';
import '../widgets/dashboardcard.dart';

class Homepage extends StatefulWidget {
  static const routeName = '/home';
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
          children: [
            //basic 4 display Dashboard
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              padding: const EdgeInsets.all(25),
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text("DashBoard",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.blue[900]))),
                const Row(children: [
                  DashboardCard(
                    containerColor: Color(0xffF7CDA2),
                    icon: Iconsax.user_edit,
                    headingText: "9999+",
                    subText1: "AllMemeber",
                    subText2: "Since Stand",
                    textColor: Color(0xffA34E00),
                  ),
                  DashboardCard(
                    containerColor: Color(0xffB6F9B6),
                    icon: Iconsax.user_cirlce_add,
                    headingText: "1000+",
                    subText1: "NewMember",
                    subText2: "From Last Month",
                    textColor: Color(0xff007312),
                  )
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  DashboardCard(
                    containerColor: Color(0xffF79C96),
                    icon: Iconsax.profile_delete,
                    headingText: "1000+",
                    subText1: "NewMember",
                    subText2: "From Last Month",
                    textColor: Color(0xffCC0000),
                  ),
                  DashboardCard(
                    containerColor: Color(0xffABB9EE),
                    icon: Iconsax.tag,
                    headingText: "500+",
                    subText1: "SaleProduct",
                    subText2: "ALL Time",
                    textColor: Color(0xff003FB9),
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
