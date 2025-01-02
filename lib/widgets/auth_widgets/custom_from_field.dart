import 'package:flutter/material.dart';

class CustomFromField extends StatelessWidget {
  const CustomFromField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.validator,
    this.suffixPressed,
    this.suffixIcon,
    this.secure = false,
    this.isPassword = false,
  });

  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool secure;
  final bool isPassword;
  final void Function()? suffixPressed;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: secure,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(suffixIcon),
                )
              : null,
        ),
        validator: validator,
      ),
    );
  }
}
