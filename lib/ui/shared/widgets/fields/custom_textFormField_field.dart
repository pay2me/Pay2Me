import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final String? initialValue;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Color? color;
  final bool obscureText;
  final bool readOnly;
  final int maxLines;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  CustomTextFormField({
    required this.labelText,
    this.hintText,
    this.initialValue,
    this.prefixIcon,
    this.suffixIcon,
    this.color,
    this.obscureText = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.keyboardType,
    this.controller,
    this.inputFormatters,
    this.onSaved,
    this.onTap,
    this.validator,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: color??Theme.of(context).colorScheme.shadow,
          ),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        readOnly: readOnly,
        controller: controller??(initialValue == null ? null : TextEditingController(text: initialValue)),
        // initialValue:  initialValue,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        keyboardType: keyboardType, 
        obscureText: obscureText,
        onSaved: onSaved,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
