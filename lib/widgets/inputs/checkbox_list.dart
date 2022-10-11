import 'package:expense_manager/utils/constants.dart';
import 'package:flutter/material.dart';

class CheckboxList extends StatefulWidget {
  final List<String> items;
  final ValueChanged onChanged;
  final List<String> selectedItems;
  final bool isAllSelected;

  const CheckboxList({
    Key? key,
    required this.items,
    required this.onChanged,
    this.selectedItems = const [],
    this.isAllSelected = false
  }) : super(key: key);

  @override
  State<CheckboxList> createState() => _CheckboxListState();
}

class _CheckboxListState extends State<CheckboxList> {

  late List<String> selected;

  @override
  void initState() {
    selected = [...widget.isAllSelected ? widget.items : widget.selectedItems];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: widget.items.length,
      itemBuilder: (_,index){
        bool isSelected = selected.contains(widget.items[index]);
        return Theme(
            data: ThemeData(
              unselectedWidgetColor: promptColor,
            ),
            child: CheckboxListTile(
                value: isSelected,
                activeColor: primary,
                tileColor: isSelected ? primary10 : bgLight,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: isSelected ? primary : border),
                    borderRadius: BorderRadius.circular(4)
                ),
                title: Text(widget.items[index], style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),),
                onChanged: (val){
                  setState(() {
                    if(val??false) {
                      selected.add(widget.items[index]);
                    }else{
                      selected.remove(widget.items[index]);
                    }
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
