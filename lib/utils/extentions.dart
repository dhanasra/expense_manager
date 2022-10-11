extension StringExtentions on String {

  int toInt() =>int.parse(this);

  String capitalized() => substring(0, 1).toUpperCase() + substring(1).toLowerCase();
}
