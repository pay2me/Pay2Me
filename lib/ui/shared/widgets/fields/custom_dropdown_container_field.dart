import 'package:flutter/material.dart';

class CustomDropDownContainerField extends StatelessWidget {
  final String? title;
  final double? width;
  final dynamic initialValue;
  final Color? color;
  final bool isWrong;
  final List<DropdownMenuItem<dynamic>>? items;
  final void Function(dynamic)? onSaved;
  final void Function(dynamic)? onChanged;
  final void Function()? onTap;
  final String? Function(dynamic)? validator;

  CustomDropDownContainerField({
    this.title,
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
    return Container(
      // height: title != null ? 92 : 52,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: isWrong
              ? Theme.of(context).colorScheme.secondary
              : color ?? Theme.of(context).colorScheme.secondary,
          width: 1,
        ),
        color: isWrong
            ? color ?? Theme.of(context).colorScheme.secondary
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          if (title != null)
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10),
                  child: Text(
                    title!,
                    style: TextStyle(
                      fontSize: 17,
                      color: isWrong
                        ? Colors.white
                        : color ?? Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButtonFormField(
              value: initialValue,
              onTap: onTap,
              isDense: true,
              isExpanded: true,
              items: items,
              onChanged: onChanged,
              onSaved: onSaved,
              validator: validator,
              icon: Icon(
                Icons.arrow_drop_down,
                color: isWrong
                    ? Colors.white
                    : color ?? Theme.of(context).colorScheme.secondary,
              ),
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
