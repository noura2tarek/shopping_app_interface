import 'package:flutter/material.dart';
import 'package:shopping_app_interface/screens/sign_up_page.dart';
import 'package:shopping_app_interface/widgets/custom_snack_bar.dart';
import '../utils/app_strings.dart';
import '../widgets/auth_widgets/custom_from_field.dart';
import '../widgets/auth_widgets/auth_button.dart';
import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool isPasswordSecure = true;
  IconData passwordSuffix = Icons.visibility_outlined;
  late final GlobalKey<FormState> _formKey;
  bool _isLoading = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

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
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    /*------------ Email Text Field ------------*/
                    CustomFromField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: AppStrings.enterYourEmail,
                      labelText: AppStrings.email,
                      prefixWidget: Icon(Icons.email_outlined),
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
                    /*----------- Password Text Field -----------*/
                    CustomFromField(
                      controller: _passwordController,
                      isPassword: true,
                      secure: isPasswordSecure,
                      suffixIcon: passwordSuffix,
                      keyboardType: TextInputType.visiblePassword,
                      suffixPressed: changePasswordVisibility,
                      hintText: AppStrings.enterYourPassword,
                      labelText: AppStrings.password,
                      prefixWidget: Icon(Icons.lock_outline),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.passwordsCannotBeEmpty;
                        } else {
                          return null;
                        }
                      },
                    ),
                    /*---------- Login Button ----------*/
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: AuthButton(
                          buttonText: AppStrings.login,
                          isLoading: _isLoading,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // sign in using firebase auth
                              // using email and password
                              try {
                                setState(() {
                                  _isLoading = true;
                                });
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                                setState(() {
                                  _isLoading = false;
                                });
                                // after successful login
                                // navigate to home page
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                  (route) => false,
                                );
                              } on FirebaseAuthException catch (e) {
                                setState(() {
                                  _isLoading = false;
                                });
                                if (e.code == 'user-not-found') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    customSnackBar(
                                      text: AppStrings.noUserFound,
                                    ),
                                  );
                                } else if (e.code == 'wrong-password') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    customSnackBar(
                                      text: AppStrings.wrongPasswordProvided,
                                    ),
                                  );
                                }
                              }
                            }
                          },
                        ),
                      ),
                    ),
                    // if the user doesn't have an account -  sign up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.dontHaveAccount),
                        //-- sign up button --//
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            );
                          },
                          child: Text(AppStrings.signUp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //------------------ Methods --------------------//
  changePasswordVisibility() {
    setState(() {
      isPasswordSecure = !isPasswordSecure;
      passwordSuffix = isPasswordSecure
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined;
    });
  }

  // dispose all the controllers
  @override
  dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
/*---------- End of the login page widget -------------*/
