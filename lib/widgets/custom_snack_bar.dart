import 'package:flutter/material.dart';

SnackBar customSnackBar({required String text}) {
  return SnackBar(
    content: Text(text),
    duration: Duration(seconds: 2),
  );
}
