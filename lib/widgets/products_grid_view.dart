import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../utils/lists.dart';
import 'grid_view_item.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({super.key, required this.onToggleItemInCartFunction});

  final void Function(String itemName) onToggleItemInCartFunction;

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  Widget build(BuildContext context) {
    // images texts list
    List<String> imagesText = [
      '23'.tr(),
      '24'.tr(),
      '25'.tr(),
      '26'.tr(),
      '27'.tr(),
      '28'.tr(),
    ];
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
            widget.onToggleItemInCartFunction(imagesText[index]);
          },
        );
      },
    );
  }
}