import 'package:flutter/material.dart';
import 'package:pay_2_me/ui/shared/functions/dateUtility.dart';
import 'package:pay_2_me/ui/shared/widgets/fields/custom_textFormField_container_field.dart';

class CustomDatePickerField extends StatelessWidget {
  final String labelText;
  final DateTime? initialValue;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Color? color;
  final bool isWrong;
  final TextEditingController controller;
  final DatePickerMode initialDatePickerMode;
  final Function()? onTap;
  final Function(DateTime?)? onSaved;
  final Function(DateTime?)? onChanged;
  final String? Function(DateTime?)? validator;

  const CustomDatePickerField({
    required this.labelText,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    required this.controller,
    this.initialDatePickerMode = DatePickerMode.day,
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
    if(initialValue != null) controller.text = DateUtility().getDateOnlyFromDate(initialValue!)!;
    
    return CustomTextFormContainerField(
      labelText: labelText,
      readOnly: true,
      controller: controller,
      onTap: onTap,
      isWrong: isWrong,
      onSaved: (date) => onSaved == null ? null : onSaved!(DateUtility().stringToDate(date)),
      validator: (date) => validator == null ? null : validator!(DateUtility().stringToDate(date)),
      suffixIconColor: color ?? Theme.of(context).colorScheme.secondary,
      suffixIcon: IconButton(
        onPressed: () async {
          showDatePicker(
            context: context,
            initialDatePickerMode: initialDatePickerMode,
            firstDate: firstDate??DateTime(2000),
            initialDate: initialDate??DateTime.now(),
            lastDate: lastDate??DateTime.now(),
          ).then((pickedDate) {
            if(pickedDate == null) return;
              controller.text = DateUtility().dateToString(
                pickedDate, 
                format: initialDatePickerMode == DatePickerMode.day 
                  ? "dd/MM/yyyy" 
                  : "MM/yyyy"
              )!;
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
