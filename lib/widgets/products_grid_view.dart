import 'package:flutter/material.dart';
import '../utils/lists.dart';
import 'grid_view_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.onToggleItemInCartFunction});

  final void Function(String itemName) onToggleItemInCartFunction;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productsImages.length,
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
          imageLink: productsImages[index],
          name: imagesText[index],
          onTap: () {
            onToggleItemInCartFunction(imagesText[index]);
          },
        );
      },
    );
  }
}
