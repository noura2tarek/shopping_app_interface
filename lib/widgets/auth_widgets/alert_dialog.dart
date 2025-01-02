//--  Alert dialog --//
import 'package:flutter/material.dart';
import 'package:shopping_app_interface/utils/app_strings.dart';
import '../../screens/home_page.dart';
import '../../utils/app_colors.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(AppStrings.accountCreatedSuccessfully),
      title: Text(AppStrings.success),
      actions: [
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
          },
          color: AppColors.mainColor,
          child: const Text(
            AppStrings.close,
            style: TextStyle(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
