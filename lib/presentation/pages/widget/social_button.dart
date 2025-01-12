import 'package:flutter/material.dart';
class _SocialButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(icon),
      onPressed: onPressed,
    );
  }
}