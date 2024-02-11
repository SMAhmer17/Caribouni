// ignore_for_file: sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius = BorderRadius.circular(50);
  final Widget child;
  CustomButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFA68AF1), Color(0XFF712B8F)]
        ),
        borderRadius: borderRadius
      ),
      child: ElevatedButton(
        child: child,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
      ),
    );
  }
}
