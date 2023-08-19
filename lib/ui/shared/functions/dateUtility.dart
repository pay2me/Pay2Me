import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtility {
  String? dateToString(DateTime? date, {String? format, bool withAdjustment = true}) {
    if(date == null) return null;
    String stringDate = DateFormat(format??"yyyy-MM-dd HH:mm:ss ").format(date);
    
    return withAdjustment 
      ? adjustmentDateString(stringDate)
      : stringDate;
  }

  DateTime? stringToDate(String? date, {bool isLocal = false}) {
    if(date == null) return null;
    if (isLocal) return DateTime.parse(date).toLocal();
    return DateTime.parse(date);
  }

  Map<String, String>? getDateAndHourFromDate(DateTime? date) {
    if (date == null) return null;
    String? dateString = dateToString(date);

    return getDateAndHourFromString(dateString);
  }

  Map<String, String>? getDateAndHourFromString(String? date) {
    if (date == null) return null;
    DateTime dateTime = DateTime.parse(date);
    date = DateFormat("dd/MM/yyyy HH:mm:ss ").format(dateTime);

    date = date.replaceFirst('T', ' ');
    date = date.replaceFirst('Z', '');
    List splitDate = date.split(' ');

    Map<String, String> dateAndHour = {
      "date": "${splitDate[0]}",
      "hour": "${splitDate[1]}",
    };

    return dateAndHour;
  }

  String? getDateOnlyFromString(String? date) {
    if (date == null) return null;
    return getDateAndHourFromString(date)!["date"]!;
  }

  String? getHourOnlyFromString(String? date) {
    if (date == null) return null;
    return getDateAndHourFromString(date)!["hour"]!;
  }

  String? getDateOnlyFromDate(DateTime? date) {
    if (date == null) return null;
    return getDateAndHourFromDate(date)!["date"]!;
  }

  String? getHourOnlyFromDate(DateTime? date) {
    if (date == null) return null;
    return getDateAndHourFromDate(date)!["hour"]!;
  }

  String? getDateAndHourStringFromString(String? date) {
    if (date == null) return null;
    Map<String, String> dateAndHour = getDateAndHourFromString(date)!;

    String dateString = "${dateAndHour["date"]} as ${dateAndHour["hour"]}";
    return dateString;
  }

  String? adjustmentDateString(String? date) {
    if(date == null) return null;
    date = date.replaceFirst(' ', 'T');
    date = date.replaceFirst(' ', 'Z');
    return date;
  }

  List<DateTime> getDaysOfWeekFromTimeOfDay(TimeOfDay timeOfDay) {
    DateTime now = DateTime.now();
    List<DateTime> notificationDate = [];

    for (var i = 0; i < 7; i++) {
      int notificationDay = now.day + i;

      notificationDate.add(
        DateTime.parse(
          "${now.year}" +
          "-" +
          "${now.month < 10 ? "0${now.month}" : now.month}" +
          "-" +
          "${notificationDay < 10 ? "0${notificationDay}" : notificationDay}" +
          " " +
          "${timeOfDay.hour < 10 ? "0${timeOfDay.hour}" : timeOfDay.hour}" +
          ":" +
          "${timeOfDay.minute < 10 ? "0${timeOfDay.minute}" : timeOfDay.minute}" +
          ":00",
        ),
      );
    }

    return notificationDate;
  }

  TimeOfDay stringToTimeOfDay(String timeString) {
    timeString = timeString.replaceFirst('TimeOfDay(', '');
    timeString = timeString.replaceFirst(')', '');
    List<String> timeList = timeString.split(":");
    return TimeOfDay(hour: int.parse(timeList[0]), minute: int.parse(timeList[1]));
  }
}
