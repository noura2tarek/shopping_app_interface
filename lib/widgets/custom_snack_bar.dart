import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

SnackBar customSnackBar({
  required String text,
  Color color = AppColors.grey,
}) {
  return SnackBar(
    content: Text(text),
    backgroundColor: color,
    duration: Duration(seconds: 2),
  );
}
