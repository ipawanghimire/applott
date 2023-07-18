import 'package:flutter/material.dart';

class CustomDatePicker {
  Future<DateTime?> pickDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    return selectedDate;
  }

  // String formatDate(DateTime date) {
  //   final DateFormat formatter = DateFormat('yyyy-MM-dd');
  //   return formatter.format(date);
  // }
}
