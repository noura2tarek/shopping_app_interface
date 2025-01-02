//-- Sign Up button widget --//
import 'package:flutter/material.dart';
import 'package:shopping_app_interface/utils/app_strings.dart';
import '../../utils/app_colors.dart';
import 'alert_dialog.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.formKey,
    required this.nameController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          showDialog(
            context: context,
            builder: (context) {
              return MyAlertDialog();
            },
          );
        }
      },
      child: Text(
        AppStrings.signUp,
        style: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17.0,
        ),
      ),
    );
  }
}
