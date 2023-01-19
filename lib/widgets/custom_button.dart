import 'package:cat_trivia/ui/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF31393D),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: AppColors.text,
          ),
        ),
      ),
    );
  }
}
