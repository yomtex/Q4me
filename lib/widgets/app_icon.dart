import 'package:flutter/material.dart';
import 'package:mydelivery/utils/dimension.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;
  const AppIcon({
    super.key, required this.icon,
    this.backgroundColor =  Colors.white,
    this.size=40,
    this.iconSize=16,
    this.iconColor = const Color(0xFF756d54)});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size/2),
      ),
      child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
      ),
    );
  }
}
