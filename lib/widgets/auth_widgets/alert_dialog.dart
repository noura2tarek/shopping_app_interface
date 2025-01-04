//--  Alert dialog --//
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({
    super.key,
    this.onPressedCancel,
  });

  final void Function()? onPressedCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('16'.tr()),
      content: Text('17'.tr()),
      actions: [
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
          onPressed: onPressedCancel,
          color: AppColors.mainColor,
          child: Text(
            '18'.tr(),
            style: TextStyle(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
