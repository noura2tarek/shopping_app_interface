import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shopping_app_interface/screens/login_page.dart';
import 'package:shopping_app_interface/screens/profile_page.dart';
import 'package:shopping_app_interface/utils/app_colors.dart';
import 'package:shopping_app_interface/widgets/custom_network_image.dart';
import 'package:shopping_app_interface/widgets/offers_list_view.dart';
import 'package:shopping_app_interface/widgets/products_grid_view.dart';
import '../utils/app_strings.dart';
import '../utils/lists.dart';
import '../widgets/custom_snack_bar.dart';
import '../widgets/custom_text.dart';

/* -------------- Home page ----------------*/
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Cart items List
  final List<String> _cartItems = [];
  late final LocalAuthentication auth;
  bool _isAuthenticated = false;
  bool _isAvailable = false;

  // Check if the device supports biometrics or not
  _checkAuthFeature() async {
    try {
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await auth.isDeviceSupported();
      if (canAuthenticate || canAuthenticateWithBiometrics) {
        log('Auth with biometrics feature is available');
        _isAvailable = true;
        setState(() {});
      } else {
        log('Auth with biometrics feature is not available');
        _isAvailable = false;
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
          text: AppStrings.authNotAvailable,
        ));
      }
    } on PlatformException catch (e) {
      _isAvailable = false;
      setState(() {});
      ScaffoldMessenger.of(context)
          .showSnackBar(customSnackBar(text: AppStrings.authNotAvailable));
      log('Error occurred(can not authenticate): $e');
    }
  }

  // Auth with biometrics fingerprint method
  authWithBiometrics() async {
    try {
      if (!_isAvailable) {
        // Assuming the user is authenticated
        setState(() {
          _isAuthenticated = true;
        });
        return;
      }
      // auth using fingerprint biometrics
      final bool authenticated = await auth.authenticate(
        localizedReason: AppStrings.scanYourFingerprint,
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      setState(() {
        _isAuthenticated = authenticated;
      });
      if (_isAuthenticated) {
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
          text: AppStrings.authenticationDone,
        ));
      }
    } catch (e) {
      // That means the user device does not support biometrics
      // Assuming the user is authenticated
      setState(() {
        _isAuthenticated = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
        text: AppStrings.authNotAvailable,
      ));
    }
  }

  @override
  void initState() {
    // initialize local authentication
    auth = LocalAuthentication();
    _checkAuthFeature();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.shoppingApp,
          style: TextStyle(color: AppColors.mainColor),
        ),
        backgroundColor: AppColors.black87,
        iconTheme: IconThemeData(color: AppColors.mainColor),
        elevation: 1.0,
        actions: [
          // log out button
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
                (route) => false,
              );
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
          // profile icon
          IconButton(
            // fingerprint auth
            // then go to profile
            onPressed: () async {
              await authWithBiometrics();
              // if feature is not available go to profile
              // if authenticated successfully, go to profile
              if (_isAuthenticated) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ));
              } else if (!_isAuthenticated) {
                ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                  text: AppStrings.accessDenied,
                ));
              }
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* --- Our products text ---*/
            CustomText(text: AppStrings.ourProducts),
            /* --- Page view of products ---*/
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return CustomNetworkImage(
                    height: 150.0,
                    width: 100.0,
                    imageLink: images[index],
                  );
                },
              ),
            ),
            const SizedBox(height: 10.0),
            /* --- Grid view of products ---*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child:
                  ProductsGridView(onAddItemInCartFunction: _onAddItemInCart),
            ),
            /* --- Hot offers text ---*/
            CustomText(text: AppStrings.hotOffers),
            /*-------- Offers List View --------*/
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: SizedBox(
                height: 200.0,
                child: OffersListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }

////////////////////////////
//----------- Methods--------------//
// add item in cart function
  void _onAddItemInCart(String itemName) {
    setState(() {
      _cartItems.add(itemName);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackBar(text: AppStrings.itemAdded),
    );
  }
}

/* -------------- End of Home page ----------------*/
