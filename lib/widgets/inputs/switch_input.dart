import 'package:easy_localization/easy_localization.dart';
import 'package:expense_manager/utils/constants.dart';
import 'package:flutter/material.dart';

class SwitchInput extends StatelessWidget {
  final ValueChanged onChanged;
  final bool switchOn;
  final String title;
  final String? subtitleOn;
  final String? subtitleOff;

  const SwitchInput({
    Key? key,
    required this.onChanged,
    this.switchOn = false,
    required this.title,
    this.subtitleOn,
    this.subtitleOff
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier switchInputNotifier = ValueNotifier(switchOn);

    return ValueListenableBuilder(
        valueListenable: switchInputNotifier,
        builder: (_,__,___){
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: border
            ),
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          )
                        ).tr()
                    ),
                    if(subtitleOn!=null) const SizedBox(height: 8,),
                    if(subtitleOn!=null) Flexible(
                        child: Text(switchInputNotifier.value
                            ? subtitleOn!
                            : subtitleOff??subtitleOn!,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: subtext
                        )).tr()
                    )
                  ],
                )),
                Switch(
                  value: switchInputNotifier.value,
                  onChanged: (val){
                    switchInputNotifier.value = val;
                    onChanged(val);
                  },
                )
              ],
            ),
          );
        }
    );
  }
}
