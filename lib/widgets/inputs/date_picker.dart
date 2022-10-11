import 'package:expense_manager/utils/date_time_utils.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  late DateTime pickedDate;

  @override
  void initState() {
    pickedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>pickDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            color: bgLight,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: border),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, size: 14, color: subtext50),
            const SizedBox(width: 8,),
            Text(DateTimeUtils.formatDate(pickedDate), style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14
            ),),
            const SizedBox(width: 8,),
            const Icon(Icons.arrow_drop_down, color: subtext50,)
          ],
        ),
      ),
    );
  }

  void pickDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now()
    );
    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }
}

