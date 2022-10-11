part of currency_picker;

class Country {
  final String name;
  final String isoCode;
  final String iso3Code;
  final String phoneCode;

  Country(
      {required this.isoCode,
        required this.iso3Code,
        required this.phoneCode,
        required this.name});

  factory Country.fromJson({required Map<String, String> json}) => Country(
    name: json['name']!,
    isoCode: json['isoCode']!,
    iso3Code: json['iso3Code']!,
    phoneCode: json['phoneCode']!,
  );
}