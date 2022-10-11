import 'package:equatable/equatable.dart';

class Party extends Equatable{

  final String name;
  final String mobileNumber;
  final String type;

  const Party({
    required this.name,
    required this.mobileNumber,
    required this.type
  });

  static Map<String, dynamic> toJson(Party party){
    return {
      "name": party.name,
      "mobile_number": party.mobileNumber,
      "type": party.type,
    };
  }

  factory Party.fromJson(Map<String,dynamic> data) {

    final name = data['name'];
    final mobileNumber = data['mobile_number'];
    final type = data['type'];

    return Party(
      name: name,
      mobileNumber: mobileNumber,
      type: type,
    );
  }

  @override
  List<Object?> get props => [];
}