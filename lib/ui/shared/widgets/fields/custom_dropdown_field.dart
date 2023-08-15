import 'package:flutter/material.dart';

class CustomDropDownField extends StatelessWidget {
  final String? labelText;
  final double? width;
  final dynamic initialValue;
  final Color? color;
  final bool isWrong;
  final List<DropdownMenuItem<dynamic>>? items;
  final void Function(dynamic)? onSaved;
  final void Function(dynamic)? onChanged;
  final void Function()? onTap;
  final String? Function(dynamic)? validator;

  CustomDropDownField({
    this.labelText,
    this.color,
    this.width,
    this.isWrong = false,
    this.onTap,
    this.onSaved,
    this.onChanged,
    this.initialValue,
    this.items,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: DropdownButtonFormField(
        value: initialValue,
        onTap: onTap,
        isDense: true,
        isExpanded: true,
        items: items,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: color??Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
