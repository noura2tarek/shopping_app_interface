import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../widgets/auth_widgets/alert_dialog.dart';
import '../widgets/auth_widgets/custom_from_field.dart';
import '../widgets/auth_widgets/sign_up_button.dart';
import '../widgets/change_lang_button.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isPasswordSecure = true;
  bool isConfirmPasswordSecure = true;
  IconData passwordSuffix = Icons.visibility_outlined;
  IconData confirmPasswordSuffix = Icons.visibility_outlined;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          //-- change locale icon button --//
          ChangeLangButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4'.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  /*------------- Full Name Text Field -------------*/
                  CustomFromField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    hintText: '5'.tr(),
                    labelText: '29'.tr(),
                    prefixWidget: Icon(Icons.person_outline),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '6'.tr();
                      } else if (value[0] != value[0].toUpperCase()) {
                        return '7'.tr();
                      } else {
                        return null;
                      }
                    },
                  ),
                  /*------------ Email Text Field ------------*/
                  CustomFromField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: '8'.tr(),
                    labelText: '30'.tr(),
                    prefixWidget: Icon(Icons.email_outlined),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '9'.tr();
                      } else if (!(value.contains('@'))) {
                        return '10'.tr();
                      } else {
                        return null;
                      }
                    },
                  ),
                  /*----------- Password Text Field -----------*/
                  CustomFromField(
                    controller: _passwordController,
                    isPassword: true,
                    secure: isPasswordSecure,
                    suffixIcon: passwordSuffix,
                    keyboardType: TextInputType.visiblePassword,
                    suffixPressed: _changePasswordVisibility,
                    hintText: '11'.tr(),
                    labelText: '31'.tr(),
                    prefixWidget: Icon(Icons.lock_outline),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '12'.tr();
                      } else if (value.length < 6) {
                        return '13'.tr();
                      } else {
                        return null;
                      }
                    },
                  ),
                  /*---------- Confirm Password Text Field ----------*/
                  CustomFromField(
                    controller: _confirmPasswordController,
                    isPassword: true,
                    secure: isConfirmPasswordSecure,
                    suffixIcon: confirmPasswordSuffix,
                    keyboardType: TextInputType.visiblePassword,
                    suffixPressed: _changeConfirmPasswordVisibility,
                    hintText: '14'.tr(),
                    labelText: '32'.tr(),
                    prefixWidget: Icon(Icons.lock_outline),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return null;
                      }
                      if (value.compareTo(_passwordController.text) != 0) {
                        return '15'.tr();
                      } else {
                        return null;
                      }
                    },
                  ),
                  /*---------- Sign Up Button ----------*/
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: SignUpButton(
                        formKey: _formKey,
                        nameController: _nameController,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            buildShowDialog(context);
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //----------------- Methods -----------------//
  _changePasswordVisibility() {
    setState(() {
      isPasswordSecure = !isPasswordSecure;
      passwordSuffix = isPasswordSecure
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined;
    });
  }

  _changeConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordSecure = !isConfirmPasswordSecure;
      confirmPasswordSuffix = isConfirmPasswordSecure
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined;
    });
  }

  /*--------- Build Show Dialog Method ----------*/
  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return MyAlertDialog(
          onPressedCancel: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        );
      },
    );
  }
}

/*---------- End of the sign up page widget -------------*/
//-- Change local method --//
changeLocale({required BuildContext context}) {
  if (context.locale == Locale('en', 'US')) {
    context.setLocale(Locale('ar', 'EG'));
  } else {
    context.setLocale(Locale('en', 'US'));
  }
}
