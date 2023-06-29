import 'package:flutter/material.dart';
import 'package:pay_2_me/ui/shared/functions/dateUtility.dart';

class CustomDatePickerButton extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Color? color;
  final bool isWrong;
  final TextEditingController controller;
  final Function()? onTap;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Function(DateTime?) onValue;

  CustomDatePickerButton({
    required this.labelText,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onValue,
    required this.controller,
    this.initialValue,
    this.color,
    this.isWrong = false,
    this.onTap,
    this.onSaved,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(initialValue != null) controller.text = DateUtility().getDateOnlyFromString(initialValue!)!;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isWrong
              ? Theme.of(context).colorScheme.secondary
              : color ?? Theme.of(context).colorScheme.secondary,
          width: 1,
        ),
        color: isWrong
            ? Theme.of(context).colorScheme.secondary
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextFormField(
          readOnly: true,
          controller: controller,
          onTap: onTap,
          onSaved: onSaved,
          validator: validator,
          style: TextStyle(
            color: isWrong
                ? Colors.white
                : Colors.black,
          ),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
              color: isWrong
                  ? Colors.white
                  : color ?? Theme.of(context).colorScheme.secondary,
            ),
            suffixIconColor: color ?? Theme.of(context).colorScheme.secondary,
            suffixIcon: IconButton(
              onPressed: () async {
                showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  initialDate: DateTime.now(),
                  lastDate: DateTime.now(),
                ).then(onValue);
              },
              icon: Icon(
                Icons.date_range_outlined,
                color: isWrong
                  ? Colors.white
                  : color ?? Theme.of(context).colorScheme.secondary,
              ),
            ),
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

    // return Container(
    //   // height: height ?? 60,
    //   decoration: BoxDecoration(
    //     border: Border.all(
    //       color: Theme.of(context).colorScheme.secondary,
    //       width: 1,
    //     ),
    //     color: Colors.transparent,
    //     borderRadius: BorderRadius.circular(10.0),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Text(
    //           title,
    //           style: TextStyle(
    //             color: Theme.of(context).colorScheme.secondary,
    //           ),
    //         ),
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text(label),
    //           ),
    //           IconButton(
    //             onPressed: () async {
    //               showDatePicker(
    //                 context: context,
    //                 firstDate: DateTime(2000),
    //                 initialDate: DateTime.now(),
    //                 lastDate: DateTime.now(),
    //               ).then(onValue);
    //             },
    //             icon: Icon(
    //               icon,
    //             ),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
