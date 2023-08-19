import 'package:flutter/material.dart';
import 'package:pay_2_me/ui/shared/functions/dateUtility.dart';

class CustomDateRangePickerField extends StatelessWidget {
  final double? height;
  final double width;
  final DateTimeRange timeRange;
  final Future<void> Function() datePickerFunction;

  CustomDateRangePickerField({
    required this.width,
    required this.timeRange,
    required this.datePickerFunction,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        height: 52,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.shadow,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          height: height ?? 50,
          width: width,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Período do Relatório",
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        DateUtility().getDateOnlyFromDate(timeRange.start)??"",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        DateUtility().getDateOnlyFromDate(timeRange.end)??"",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: datePickerFunction,
                    icon: Icon(
                      Icons.date_range_outlined,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
