import 'package:flutter/material.dart';
import 'package:pay_2_me/ui/shared/functions/dateUtility.dart';
import 'package:pay_2_me/ui/shared/widgets/fields/custom_textFormField_container_field.dart';

class CustomDatePickerField extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Color? color;
  final bool isWrong;
  final TextEditingController controller;
  final Function()? onTap;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  // final Function(DateTime?) onValue;

  CustomDatePickerField({
    required this.labelText,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    // required this.onValue,
    required this.controller,
    this.initialValue,
    this.color,
    this.isWrong = false,
    this.onTap,
    this.onSaved,
    this.onChanged,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(initialValue != null) controller.text = DateUtility().getDateOnlyFromString(initialValue!)!;
    
    return CustomTextFormContainerField(
      labelText: labelText,
      readOnly: true,
      controller: controller,
      onTap: onTap,
      isWrong: isWrong,
      onSaved: onSaved,
      validator: validator,
      suffixIconColor: color ?? Theme.of(context).colorScheme.secondary,
      suffixIcon: IconButton(
        onPressed: () async {
          showDatePicker(
            context: context,
            firstDate: firstDate??DateTime(2000),
            initialDate: initialDate??DateTime.now(),
            lastDate: lastDate??DateTime.now(),
          ).then((pickedDate) {
            if(pickedDate == null) return;
              controller.text = DateUtility().dateToString(pickedDate, format: "dd/MM/yyyy");
              onChanged;
            },
          );
        },
        icon: Icon(
          Icons.date_range_outlined,
          color: isWrong
            ? Colors.white
            : color ?? Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
