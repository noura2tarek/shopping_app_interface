import 'package:flutter/material.dart';
import 'package:shopping_app_interface/utils/app_colors.dart';
import 'custom_network_image.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.imageLink,
    required this.text,
  });

  final String imageLink;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Card(
        color: AppColors.white,
        margin: EdgeInsets.all(5.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Column(
          children: [
            // Offer photo //
            Expanded(
              child: CustomNetworkImage(
                imageLink: imageLink,
              ),
            ),
            /*--- Offer Text ----*/
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
