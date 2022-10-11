import 'package:expense_manager/utils/constants.dart';
import 'package:flutter/material.dart';

class RadioList extends StatefulWidget {
  final List<String> items;
  final ValueChanged onChanged;
  final String? selectedValue;
  final String? defaultItem;
  const RadioList({
    Key? key,
    required this.items,
    required this.onChanged,
    this.selectedValue,
    this.defaultItem
  }) : super(key: key);

  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  late final List<String> items;
  late String selectedValue;

  @override
  void initState() {
    items = widget.items;
    if(widget.defaultItem!=null) {
      items.insert(0, widget.defaultItem!);
      selectedValue = widget.selectedValue ?? widget.defaultItem!;
    }else{
      selectedValue = widget.selectedValue!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (_,index){
          bool isSelected = selectedValue == items[index];
          return Theme(
              data: ThemeData(
                unselectedWidgetColor: promptColor,
              ),
              child: RadioListTile(
                  value: items[index],
                  activeColor: primary,
                  tileColor: isSelected ? primary10 : bgLight,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: isSelected ? primary : border),
                      borderRadius: BorderRadius.circular(4)
                  ),
                  groupValue: selectedValue,
                  title: Text(items[index], style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),),
                  onChanged: (val){
                    setState(() {
                      selectedValue = val.toString();
                    });
                    widget.onChanged(val);
                  }
              )
          );
        },
        separatorBuilder: (_,index){
          return const Divider(color: Colors.transparent,);
        },
    );
  }
}
