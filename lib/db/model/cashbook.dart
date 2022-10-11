import 'package:equatable/equatable.dart';
import 'package:expense_manager/db/model/activity.dart';
import 'package:expense_manager/db/model/cash_balance.dart';

class Cashbook extends Equatable{

  final String id;
  final String name;
  final bool isPrivate;
  final String? avatar;
  final String? theme;
  final String? coverPicture;
  final List? member;
  final List? category;
  final List? paymentModes;
  final CashBalance? cashBalance;
  final List activity;

  const Cashbook({
    required this.id,
    required this.name,
    required this.isPrivate,
    this.avatar,
    this.theme,
    this.coverPicture,
    this.member,
    this.cashBalance = const CashBalance(),
    this.paymentModes = const [],
    this.category = const [],
    required this.activity
  });

  static List<Cashbook> getCashbooksList(List<dynamic> data){
    return data.map((e) => Cashbook.fromJson(e)).toList();
  }

  static Map<String, dynamic> toJson(Cashbook book){
    return {
      "id": book.id,
      "name": book.name,
      "is_private": book.isPrivate,
      "cover_picture": book.coverPicture,
      "avatar": book.avatar,
      "theme": book.theme,
      "member": book.member,
      "cash_balance": CashBalance.toJson(book.cashBalance?? const CashBalance()),
      "category" : book.category ?? [],
      "paymentModes" : book.paymentModes ?? [],
      "activity" : Activity.getActivitiesList(book.activity)
    };
  }

  factory Cashbook.fromJson(Map<String,dynamic> data) {

    final id = data['id'];
    final name = data['name'];
    final isPrivate = data['is_private'];
    final coverPicture = data['cover_picture'];
    final avatar = data['avatar'];
    final theme = data['theme'];
    final member = data['member'];
    final category = data['category'];
    final cashBalance = data['cash_balance'] !=null
        ? CashBalance.fromJson(data['cash_balance'])
        : const CashBalance();
    final paymentModes = data["paymentModes"];
    final activity = Activity.getActivitiesList(data["activity"]);

    return Cashbook(
        id: id,
        name: name,
        isPrivate: isPrivate,
        coverPicture: coverPicture,
        avatar: avatar,
        theme: theme,
        cashBalance: cashBalance,
        member: member ?? [],
        category: category ?? [],
        activity: activity,
        paymentModes: paymentModes ?? []
    );
  }

  @override
  List<Object?> get props => [];
}