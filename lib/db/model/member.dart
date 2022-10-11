import 'package:equatable/equatable.dart';

class Member extends Equatable{

  final String phone;
  final String role;

  const Member({
    required this.phone,
    required this.role
  });

  static List<Member> getMembersList(List<dynamic> data){
    return data.map((e) => Member.fromJson(e)).toList();
  }

  static Map<String, dynamic> toMap(Member member){
    return {
      "mobile_number": member.phone,
      "role": member.role
    };
  }

  factory Member.fromJson(Map<String,dynamic> data) {

    final phone = data['mobile_number'];
    final role = data['role'];

    return Member(
      phone: phone,
      role: role
    );
  }

  @override
  List<Object?> get props => [];
}