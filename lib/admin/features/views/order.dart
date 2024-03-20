import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/Drawer.dart';
import '../widgets/LatestOrders.dart';

class Order extends StatefulWidget {
  static const routeName = '/order';
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Orders",
          style:
              TextStyle(color: Colors.grey[900], fontWeight: FontWeight.w500),
        ),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Latest Orders",
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
                    SizedBox(
                      width: 5,
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("Order ID",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                  color: Colors.blue[900])),
                        ),
                        Text("Products",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                color: Colors.blue[900])),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Text("Status",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                  color: Colors.blue[900])),
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
                        return GestureDetector(
                            onTap: () {}, child: LatestOrders(i: index));
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
