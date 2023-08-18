import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon? icon;
  final Widget label;
  final Color backgroundColor;
  final Color? iconColor;
  final Color textColor;

  const CustomElevatedButton({
    super.key,
    this.icon,
    required this.label,
    required this.backgroundColor,
    this.iconColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 135,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon ?? const SizedBox(),
        label: label,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
