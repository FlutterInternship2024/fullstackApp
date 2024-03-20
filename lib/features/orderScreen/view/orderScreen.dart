import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/product.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<Product> orders = [
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
    int totalPrice =
        orders.fold(0, (sum, order) => sum + (order.price * order.itemCount));
    double tax = 00;
    return Container(
      color: Color(0xffF4F5F9),
      child: SafeArea(
        child: Column(
          children: [
            Text(
              'My Orders',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    margin: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 2,
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        color: Colors.grey[200],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Total: \$${totalPrice.toString()}',
                              style: GoogleFonts.poppins(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Delivery and Taxes: \$${tax}',
                              style: GoogleFonts.poppins(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              thickness: 0.2,
                              color: Colors.black,
                            ),
                            Text(
                              'Order Total : \$${tax + totalPrice}',
                              style: GoogleFonts.poppins(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(12),
                              // margin: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color(0xff8ad760),
                                    Color(0xff8ac74c),
                                    Color(0xff6db424),
                                    Color(0xff519a0e),
                                  ])),
                              child: Text(
                                'CHECKOUT',
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        return OrderCard(
                          order: orders[index],
                          onItemCountChanged: (newCount) {
                            setState(() {
                              orders[index].itemCount = newCount;
                            });
                          },
                          onDelete: () {
                            setState(() {
                              orders.removeAt(index);
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Product order;
  final Function(int) onItemCountChanged;
  final Function() onDelete;

  OrderCard({
    required this.order,
    required this.onItemCountChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(order.productId),
      onDismissed: (_) {
        onDelete();
      },
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete_outline_outlined,
          color: Colors.white,
          size: 36,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          height: 125,
          child: Material(
            elevation: 3,
            child: Center(
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset(order.imageUrl, fit: BoxFit.cover),
                ),
                title: Text(
                  order.productName,
                  style: GoogleFonts.poppins(
                      fontSize: 19.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '\$${order.price}\/${order.unit}',
                  style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (order.itemCount > 0) {
                          onItemCountChanged(order.itemCount - 1);
                        }
                      },
                      icon: Icon(
                        Icons.remove,
                        size: 20,
                        color: Colors.green,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        order.itemCount.toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 18.0,
                            color: (order.itemCount == 0)
                                ? Colors.grey
                                : Colors.green,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        onItemCountChanged(order.itemCount + 1);
                      },
                      icon: Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
