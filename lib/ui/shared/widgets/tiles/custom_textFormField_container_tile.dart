import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFieldContainer extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final String? initialValue;
  final Color? borderColor;
  final Color? containerColor;
  final Color? labelColor;
  final Color? hintColor;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool isWrong;
  final int maxLines;
  final double height;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  CustomTextFormFieldContainer({
    required this.labelText,
    this.hintText,
    this.initialValue,
    this.borderColor,
    this.containerColor,
    this.labelColor,
    this.hintColor,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.isWrong = false,
    this.maxLines = 1,
    this.height = 65,
    this.keyboardType,
    this.inputFormatters,
    this.onSaved,
    this.onTap,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: isWrong
              ? Theme.of(context).colorScheme.secondary
              : borderColor ?? Theme.of(context).colorScheme.secondary,
          width: 1,
        ),
        color: isWrong
            ? Theme.of(context).colorScheme.secondary
            : containerColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextFormField(
          inputFormatters: inputFormatters,
          maxLines: maxLines,
          initialValue: initialValue,
          onTap: onTap,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onSaved: onSaved,
          validator: validator,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
              color: isWrong
                  ? Colors.white
                  : labelColor ?? Theme.of(context).colorScheme.secondary,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: isWrong
                  ? Colors.white
                  : hintColor ?? Theme.of(context).colorScheme.secondary,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
