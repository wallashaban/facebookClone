import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final double size;
  final double width;
  final double height;
  final dynamic vaildator;
  final bool noBorder;
  final double raduis;
  final dynamic onChanged;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.vaildator,
    this.onChanged,
    this.noBorder = false,
    this.width = double.infinity,
    this.raduis = 5,
    this.height = 50,
    this.size = 18,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        validator: vaildator,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          suffixIcon: Icon(suffixIcon),
          labelText: hintText,
          hintStyle: TextStyle(fontSize: size),
          border: noBorder
              ? InputBorder.none
              : OutlineInputBorder(borderRadius: BorderRadius.circular(raduis)),
        ),
      ),
    );
  }
}
