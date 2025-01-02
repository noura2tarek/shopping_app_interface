//--  Alert dialog --//
import 'package:flutter/material.dart';
import 'package:shopping_app_interface/utils/app_strings.dart';
import '../../utils/app_colors.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({
    super.key, this.onPressedCancel,
  });
 final void Function()? onPressedCancel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(AppStrings.accountCreatedSuccessfully),
      title: Text(AppStrings.success),
      actions: [
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
          onPressed: onPressedCancel,
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
