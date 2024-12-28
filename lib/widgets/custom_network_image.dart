import 'package:flutter/material.dart';
import '../utils/app_images.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageLink,
    this.height = 110.0,
    this.width = 120,
  });

  final String imageLink;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      image: NetworkImage(
        imageLink,
      ),
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder: AssetImage(AppImages.greyPhoto),
    );
  }
}
