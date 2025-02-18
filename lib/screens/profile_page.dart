import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_interface/utils/app_images.dart';
import '../utils/app_colors.dart';
import '../widgets/auth_widgets/auth_button.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(color: AppColors.mainColor),
          ),
          backgroundColor: AppColors.black87,
          elevation: 1.0,
          iconTheme: IconThemeData(color: AppColors.mainColor),
        ),
        // if authenticated show body & data , otherwise show access denied text
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //-- User Photo --//
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(AppImages.userPhoto),
                ),
                //-- user name --//
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Noura Tarek',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //-- user Email --//
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                  child: Text(
                    'nourat536@gmail.com',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
                //-- Log Out Button --//
                AuthButton(
                  isLoading: false,
                  height: 38.0,
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
                  buttonText: 'Log Out',
                ),
              ],
            ),
          ),
        ));
  }
}
