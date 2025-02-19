import 'package:flutter/material.dart';
import '../utils/lists.dart';
import 'grid_view_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.onAddItemInCartFunction,
    required this.cartItems,
  });

  final void Function(String itemName) onAddItemInCartFunction;
  final List<String> cartItems;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        // use childAspectRatio to customize size to any screen
        childAspectRatio: 7 / 8.5,
      ),
      itemBuilder: (context, index) {
        /* --------- Grid view card item -------*/
        return GridViewItem(
          imageLink: products[index],
          name: imagesText[index],
          inCart: cartItems.contains(imagesText[index]),
          onTap: () {
            onAddItemInCartFunction(imagesText[index]);
          },
        );
      },
    );
  }
}
