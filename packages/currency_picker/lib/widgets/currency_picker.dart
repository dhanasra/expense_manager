part of currency_picker;

class CurrencyPicker extends StatefulWidget {
  final ValueChanged onChanged;
  const CurrencyPicker({
    Key? key,
    required this.onChanged
  }) : super(key: key);

  @override
  State<CurrencyPicker> createState() => _CurrencyPickerState();
}

class _CurrencyPickerState extends State<CurrencyPicker> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Currency>(
        decoration: const InputDecoration(
          labelText: "Currency",
        ),
        items: currencies.map(
                (item){
                  Currency currency = Currency.from(json: item);
                  return DropdownMenuItem<Currency>(
                      value: currency,
                      child: Row(
                        children: [
                          if(currency.flag!=null) Text(
                            "${CurrencyUtils.currencyToEmoji(currency)}    ${currency.code}",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      )
                  );
                }
        ).toList(),
        value: null,
        onChanged: widget.onChanged
    );
  }
}