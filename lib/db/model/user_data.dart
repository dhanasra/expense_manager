
import 'package:equatable/equatable.dart';

import 'activity.dart';

class UserData extends Equatable{

  final String firstName;
  final String lastName;
  final String locale;
  final String email;
  final String phone;
  final String? picture;
  final String defaultCurrency;
  final List activity;
  final List parties;
  final List cashbooks;

  const UserData({
    required this.firstName,
    required this.lastName,
    required this.locale,
    required this.email,
    required this.phone,
    this.picture,
    required this.defaultCurrency,
    required this.cashbooks,
    required this.parties,
    required this.activity
  });

  static List<UserData> getUsersList(List<dynamic> data){
    return data.map((e) => UserData.fromJson(e)).toList();
  }

  factory UserData.fromJson(Map<String,dynamic> data) {

    final firstName = data['first_name'];
    final lastName = data['last_name'];

    final picture = data['picture'];
    final locale = data['locale'];

    final email = data['email'];
    final phone = data['mobile_number'];
    final defaultCurrency = data['default_currency'];
    final cashbooks = data['cashbooks'];
    final parties = data['parties'];
    final activity = Activity.getActivitiesList(data["activity"]);
    
    return UserData(
        firstName: firstName,
        lastName: lastName,
        parties: parties,
        email: email,
        locale: locale,
        picture: picture,
        cashbooks: cashbooks ?? [],
        phone: phone,
        activity: activity,
        defaultCurrency: defaultCurrency
    );
  }

  @override
  List<Object?> get props => [];
}