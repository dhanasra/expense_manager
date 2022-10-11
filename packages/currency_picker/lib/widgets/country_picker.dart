part of currency_picker;

class CountryPicker extends StatefulWidget {
  final ValueChanged onChanged;
  const CountryPicker({
    Key? key,
    required this.onChanged
  }) : super(key: key);

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Country>(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 14, 10, 15)
        ),
        items: countryList.map(
                (item){
              return DropdownMenuItem<Country>(
                  value: item,
                  child: Text(
                    "+${item.phoneCode} (${item.isoCode})",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
              );
            }
        ).toList(),
        value: countryList[102],
        isExpanded: true,
        icon: const Visibility (visible:false, child: Icon(Icons.arrow_downward)),
        onChanged: widget.onChanged
    );
  }
}
