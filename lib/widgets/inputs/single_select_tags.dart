import 'package:expense_manager/utils/constants.dart';
import 'package:flutter/material.dart';

class SingleSelectTags extends StatelessWidget {
  final List<TagItem> tags;
  final ValueChanged onSelected;
  final EdgeInsets? padding;
  const SingleSelectTags({
    Key? key,
    required this.tags,
    required this.onSelected,
    this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ValueNotifier selectedTag = ValueNotifier<int>(0);

    return Padding(
        padding: EdgeInsets.zero,
        child: Wrap(
          children: List.generate(tags.length,
                  (index) => ValueListenableBuilder(
                  valueListenable: selectedTag,
                  builder: (_,__,___){
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: Text(
                            tags[index].label,
                            style: TextStyle(
                                fontSize: 12,
                                color: selectedTag.value==index
                                    ? primary
                                    : subText
                            )
                        ),
                        backgroundColor: bgLight,
                        avatar: tags[index].icon !=null ? Icon(
                            tags[index].icon,
                            size: 16,
                            color: selectedTag.value==index
                                ? primary
                                : subText
                        ) : null,
                        padding: padding,
                        pressElevation: 0,
                        selectedColor: primary10,
                        showCheckmark: false,
                        selected: selectedTag.value==index,
                        shape: StadiumBorder(
                          side: BorderSide(
                              color: selectedTag.value==index
                                  ? primary
                                  : border),
                        ),
                        onSelected: (bool value) {
                          selectedTag.value = index;
                          onSelected(index);
                        },
                      ),
                    );
                  }
              )
          ).toList(),
        ),
    );
  }
}

class TagItem {
  final String label;
  final IconData? icon;

  TagItem({
    required this.label,
    this.icon
  });
}
