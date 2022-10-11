
import 'package:equatable/equatable.dart';

class UserData extends Equatable{

  final String id;
  final String firstName;
  final String lastName;
  final String? picture;
  final String? customPicture;
  final String locale;
  final String email;
  final String? phone;
  final String? dateFormat;
  final String defaultCurrency;
  final int notificationRead;
  final int notificationCount;
  final String? registrationStatus;
  final String? countryCode;
  final List cashbooks;

  const UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.locale,
    required this.email,
    this.phone,
    this.picture,
    this.countryCode,
    this.customPicture,
    this.dateFormat,
    this.notificationCount = 0,
    this.notificationRead = 0,
    this.registrationStatus,
    required this.defaultCurrency,
    this.cashbooks = const []
  });

  static List<UserData> getUsersList(List<dynamic> data){
    return data.map((e) => UserData.fromJson(e)).toList();
  }

  factory UserData.fromJson(Map<String,dynamic> data) {

    final id = data['id'];
    final firstName = data['first_name'];
    final lastName = data['last_name'];
    final picture = data['picture'];
    final customPicture = data['custom_picture'];
    final locale = data['locale'];
    final email = data['email'];
    final phone = data['mobile_number'];
    final countryCode = data['country_code'];
    final dateFormat = data['date_format'];
    final defaultCurrency = data['default_currency'];
    final notificationCount = data['notification_count'];
    final notificationRead = data['notification_read'];
    final registrationStatus = data['registration_status'];
    final cashbooks = data['cashbooks'];

    return UserData(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        locale: locale,
        picture: picture,
        customPicture: customPicture,
        countryCode: countryCode,
        dateFormat: dateFormat,
        notificationCount: notificationCount ?? 0,
        notificationRead: notificationRead ?? 0,
        registrationStatus: registrationStatus,
        cashbooks: cashbooks ?? [],
        phone: phone,
        defaultCurrency: defaultCurrency
    );
  }

  @override
  List<Object?> get props => [];
}