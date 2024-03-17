import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fruitsapp/features/homeScreen/view/widgets/categoryProductCard.dart';

class Categories extends StatelessWidget {
  static const routeName = '/category';

  final int itemCount;

  const Categories({Key? key, required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StaggeredGridView.countBuilder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            itemCount: 8,
            crossAxisSpacing: 4,
            itemBuilder: (context, index) {
              return ProductCards(productNumber: itemCount);
            },
            staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          ),
        ],
      ),
    );
  }
}
