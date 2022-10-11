import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/date_time_utils.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late TimeOfDay selectedTime;

  @override
  void initState() {
    selectedTime = TimeOfDay.now();
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
            const Icon(Icons.timer_outlined, size: 16, color: subtext50,),
            const SizedBox(width: 8,),
            Text(DateTimeUtils.formatTime(selectedTime), style: const TextStyle(
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
    final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime ) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }
}
