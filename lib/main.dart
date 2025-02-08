import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_interface/screens/home_page.dart';
import 'package:shopping_app_interface/screens/login_page.dart';
import 'package:shopping_app_interface/utils/app_strings.dart';
import 'utils/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget startWidget = LoginPage();

  @override
  void initState() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // if the user object is not null, then the user is signed in
      // Redirect to Home Page
      startWidget = HomePage();
    }
    // listen to auth changes to check if the user is signed in
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
        startWidget = LoginPage();
      } else {
        log('User is signed in!');
        startWidget = HomePage();
      }
    });
    super.initState();
  }

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
      home: startWidget,
    );
  }
}
