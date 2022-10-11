part of currency_picker;

class Amount extends StatelessWidget {
  final String currencyCode;
  final String amount;
  final TextStyle? style;
  const Amount({
    Key? key,
    this.style,
    required this.currencyCode,
    required this.amount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        "${CurrencyService().getSymbol(currencyCode)} $amount",
        style: style,
    );
  }
}
