import 'package:equatable/equatable.dart';
import 'package:expense_manager/db/model/party.dart';
import 'package:expense_manager/db/model/user_data.dart';

class MainData extends Equatable{

  final UserData userData;
  final List<Party> parties;

  const MainData({
    required this.userData,
    this.parties = const [],
  });

  static Map<String, dynamic> toJson(MainData mainData){
    return {
      "userData": mainData.userData,
      "parties": mainData.parties,
    };
  }

  factory MainData.fromJson(Map<String,dynamic> data) {

    final userData = data['user_data'];
    final parties = data['parties']??[];

    return MainData(
      userData: userData,
      parties: parties,
    );
  }

  @override
  List<Object?> get props => [];
}