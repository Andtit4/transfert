import 'package:flutter/material.dart';

class InputCustom extends StatefulWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffix;

  final Color? hintColor;
  final bool? obscureText;
  const InputCustom({super.key, required this.hintText, this.prefixIcon, this.hintColor, this.obscureText, this.suffix});

  @override
  State<InputCustom> createState() => _InputCustomState();
}

class _InputCustomState extends State<InputCustom> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffix: widget.suffix,
        filled: true,
        fillColor: widget.hintColor,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
