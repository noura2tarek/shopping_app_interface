//-- Sign Up button widget --//
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    required this.isLoading,
    this.height = 45.0,
  });

  final String buttonText;
  final void Function()? onPressed;
  final bool isLoading;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? CircularProgressIndicator(
                color: AppColors.white,
              )
            : Text(
                buttonText,
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
      ),
    );
  }
}
