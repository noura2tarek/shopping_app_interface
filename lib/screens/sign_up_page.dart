import 'package:flutter/material.dart';
import '../utils/app_strings.dart';
import '../widgets/auth_widgets/custom_from_field.dart';
import '../widgets/auth_widgets/sign_up_button.dart';

// const List<String> lowercaseAlphabets = [
//   'a',
//   'b',
//   'c',
//   'd',
//   'e',
//   'f',
//   'g',
//   'h',
//   'i',
//   'j',
//   'k',
//   'l',
//   'm',
//   'n',
//   'o',
//   'p',
//   'q',
//   'r',
//   's',
//   't',
//   'u',
//   'v',
//   'w',
//   'x',
//   'y',
//   'z'
// ];

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
                      height: 20.0,
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
                      padding: const EdgeInsets.only(top: 30.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: SignUpButton(
                          formKey: _formKey,
                          nameController: nameController,
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

  //////////////////////////////
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

///////////////////////////////////////
