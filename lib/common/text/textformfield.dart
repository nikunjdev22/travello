import 'package:flutter/material.dart';
import '../../Constant/colors_constant.dart';

class TTextField extends StatelessWidget {
  const TTextField({
    super.key,
    required this.text,
    required this.controller,
    required this.validate,
    required this.obscureText,
  });

  final String text;
  final TextEditingController controller;
  final FormFieldValidator<String> validate;
  final bool obscureText;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ,
      validator: validate,
      controller: controller,
      style: TextStyle(
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          fontSize: 16,
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.3),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      ),
    );
  }
}
