import 'package:flutter/material.dart';
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
                      controller: _nameController,
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
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: AppStrings.enterYourEmail,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.pleaseEnterYourEmail;
                        } else if (!(value.contains('@'))) {
                          return AppStrings.pleaseEnterValidEmail;
                        } else {
                          return null;
                        }
                      },
                    ),
                    /*------------- Password Text Field -------------*/
                    CustomFromField(
                      controller: _passwordController,
                      isPassword: true,
                      secure: isPasswordSecure,
                      suffixIcon: passwordSuffix,
                      keyboardType: TextInputType.visiblePassword,
                      suffixPressed: _changePasswordVisibility,
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
                      controller: _confirmPasswordController,
                      isPassword: true,
                      secure: isConfirmPasswordSecure,
                      suffixIcon: confirmPasswordSuffix,
                      keyboardType: TextInputType.visiblePassword,
                      suffixPressed: _changeConfirmPasswordVisibility,
                      hintText: AppStrings.enterYourConfirmPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return null;
                        }
                        if (value.compareTo(_passwordController.text) != 0) {
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
                          nameController: _nameController,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //-- Show the alert dialog --//
                              _buildShowDialog(context);
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

  //--------------- Methods ---------------//
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

  //-- Build Show alert dialog method --//
  Future<dynamic> _buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return MyAlertDialog(
          onPressedCancel: () {
            // Fade transition
            Navigator.of(context).pushAndRemoveUntil(
              createRoute(child: HomePage()),
              (Route<dynamic> route) => false,
            );
          },
        );
      },
    );
  }
}
/*---------------- End of the Sign up page widget ------------------*/

//-- Create Custom page route to apply custom fade transition --//
class DelayedCurve extends Curve {
  const DelayedCurve() : super();

  @override
  double transformInternal(double t) {
    if (t < 0.5) {
      return 0.0;
    } else {
      return (t - 0.5) * 2.0;
    }
  }
}

class CurveDelayed extends Curve {
  const CurveDelayed() : super();

  @override
  double transformInternal(double t) {
    if (t > 0.5) {
      return 1.0;
    } else {
      return t * 2;
    }
  }
}

Route createRoute({required Widget child}) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 2500),
    reverseTransitionDuration: Duration(milliseconds: 2500),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation.drive(Tween<double>(begin: 0, end: 1)
            .chain(CurveTween(curve: const DelayedCurve()))),
        child: FadeTransition(
          opacity: secondaryAnimation.drive(Tween<double>(begin: 1, end: 0)
              .chain(CurveTween(curve: const CurveDelayed()))),
          child: child,
        ),
      );
    },
  );
}
