import 'package:flutter/material.dart';

class CustomDropDownContainerField extends StatelessWidget {
  final String? labelText;
  final double? width;
  final dynamic initialValue;
  final Widget? icon;
  final Color? color;
  final bool isWrong;
  final List<DropdownMenuItem<dynamic>>? items;
  final void Function(dynamic)? onSaved;
  final void Function(dynamic)? onChanged;
  final void Function()? onTap;
  final String? Function(dynamic)? validator;

  CustomDropDownContainerField({
    this.labelText,
    this.color,
    this.width,
    this.initialValue,
    this.icon,
    this.isWrong = false,
    this.onTap,
    this.onSaved,
    this.onChanged,
    this.items,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
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
            if (labelText != null)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: Text(
                      labelText!,
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
                icon: icon ?? Icon(
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
      ),
    );
  }
}
