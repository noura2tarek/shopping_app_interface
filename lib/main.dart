import 'package:flutter/material.dart';
import 'package:shopping_app_interface/screens/sign_up_page.dart';
import 'package:shopping_app_interface/utils/app_strings.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.shoppingApp,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Suwannaphum',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
        useMaterial3: true,
      ),
      home: SignUpPage(),
    );
  }
}
