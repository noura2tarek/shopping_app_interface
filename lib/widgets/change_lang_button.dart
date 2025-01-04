import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../screens/sign_up_page.dart';

class ChangeLangButton extends StatelessWidget {
  const ChangeLangButton({
    super.key,
    this.color = Colors.black87,
  });
 final Color color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        //-- change locale method --//
        changeLocale(context: context);
      },
      tooltip: '20'.tr(),
      icon: Icon(Icons.language_outlined, color: color,),
    );
  }
}