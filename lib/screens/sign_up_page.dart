import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_strings.dart';
import '../widgets/auth_widgets/alert_dialog.dart';
import '../widgets/auth_widgets/custom_from_field.dart';
import '../widgets/auth_widgets/sign_up_button.dart';
import 'home_page.dart';

/* ------------ Sign Up page --------------*/
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordSecure = true;
  bool isConfirmPasswordSecure = true;
  IconData passwordSuffix = Icons.visibility_outlined;
  IconData confirmPasswordSuffix = Icons.visibility_outlined;
  final _formKey = GlobalKey<FormState>();
  //bool _signUpVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.signUp,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    /*------------- Full Name Text Field -------------*/
                    CustomFromField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      hintText: AppStrings.enterYourFullName,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.pleaseEnterYourName;
                        } else if (value[0] != value[0].toUpperCase()) {
                          return AppStrings.fullNameMustStart;
                        } else {
                          return null;
                        }
                      },
                    ),
                    /*------------- Email Text Field -------------*/
                    CustomFromField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: AppStrings.enterYourEmail,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.pleaseEnterYourEmail;
                        } else if (!(value.contains('@')) &&
                            !(value.contains('.'))) {
                          return AppStrings.pleaseEnterValidEmail;
                        } else {
                          return null;
                        }
                      },
                    ),
                    /*------------- Password Text Field -------------*/
                    CustomFromField(
                      controller: passwordController,
                      isPassword: true,
                      secure: isPasswordSecure,
                      suffixIcon: passwordSuffix,
                      keyboardType: TextInputType.visiblePassword,
                      suffixPressed: changePasswordVisibility,
                      hintText: AppStrings.enterYourPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.passwordsCannotBeEmpty;
                        } else if (value.length < 6) {
                          return AppStrings.passwordsMustBeMore;
                        } else {
                          return null;
                        }
                      },
                    ),
                    /*------------- Confirm Password Text Field -------------*/
                    CustomFromField(
                      controller: confirmPasswordController,
                      isPassword: true,
                      secure: isConfirmPasswordSecure,
                      suffixIcon: confirmPasswordSuffix,
                      keyboardType: TextInputType.visiblePassword,
                      suffixPressed: changeConfirmPasswordVisibility,
                      hintText: AppStrings.enterYourConfirmPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return null;
                        }
                        if (value.compareTo(passwordController.text) != 0) {
                          return AppStrings.passwordsNotMatch;
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
                          nameController: nameController,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return MyAlertDialog(
                                    onPressedCancel: () {
                                      Navigator.of(context).pop();
                                      // setState(() {
                                      //   _signUpVisibility = false;
                                      // });
                                      /////////////////////////////////
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            // Adds a FadeEffect that animates the opacity of the target
                                            // between the specified begin value and 1.
                                            return Animate(
                                              effects: [
                                                // fade in
                                                FadeEffect(
                                                  begin: 0.0,
                                                  delay: Duration(milliseconds: 40),
                                                  duration: 600.ms,
                                                  curve: Curves.easeInOutSine,
                                                ),
                                              ],
                                              child: HomePage(),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
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
      ),
    );
  }

  ////////////// Methods ////////////////
  changePasswordVisibility() {
    setState(() {
      isPasswordSecure = !isPasswordSecure;
      passwordSuffix = isPasswordSecure
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined;
    });
  }

  changeConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordSecure = !isConfirmPasswordSecure;
      confirmPasswordSuffix = isConfirmPasswordSecure
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined;
    });
  }
}

////////////////// End of page /////////////////////
