import 'package:flutter/material.dart';
import 'package:shopping_app_interface/utils/app_colors.dart';
import 'custom_network_image.dart';
import 'product_text.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    super.key,
    required this.imageLink,
    required this.name,
    this.onTap,
  });

  final String imageLink;
  final String name;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.grey300!.withValues(alpha: 0.2),
            spreadRadius: 2.0,
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Card(
        elevation: 0.0,
        color: AppColors.white,
        margin: EdgeInsets.all(5.0),
        child: Column(
          children: [
            // product photo //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomNetworkImage(
                imageLink: imageLink,
              ),
            ),
            /*--- Product Name ----*/
            ProductText(text: name),
            /* ---- Row of price and add to cart icon  ---*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '21\$',
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_shopping_cart_outlined,
                      size: 18.0,
                      color: AppColors.mainColor,
                    ),
                    onPressed: onTap,
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
