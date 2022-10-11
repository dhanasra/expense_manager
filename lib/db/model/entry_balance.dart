import 'package:equatable/equatable.dart';

class EntryBalance extends Equatable{

  final String amount;
  final String balance;
  final String? category;
  final String? paymentMode;

  const EntryBalance({
    required this.amount,
    required this.balance,
    this.category,
    this.paymentMode
  });

  static Map<String, dynamic> toJson(EntryBalance entryBalance){
    return {
      "amount": entryBalance.amount,
      "balance": entryBalance.balance,
      "category": entryBalance.category,
      "payment_mode": entryBalance.paymentMode,
    };
  }

  factory EntryBalance.fromJson(Map<String,dynamic> data) {

    final amount = data['amount'];
    final balance = data['balance'];
    final category = data['category'];
    final paymentMode = data['payment_mode'];

    return EntryBalance(
      amount: amount,
      balance: balance,
      category: category,
      paymentMode: paymentMode,
    );
  }

  @override
  List<Object?> get props => [];
}