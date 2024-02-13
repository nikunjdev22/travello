import 'package:flutter/material.dart';
import '../Constant/colors_constant.dart';

class TTextField extends StatelessWidget {
  const TTextField({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
