import 'package:equatable/equatable.dart';

class CashBalance extends Equatable{

  final String netBalance;
  final String totalIn;
  final String totalOut;

  const CashBalance({
    this.netBalance = "0",
    this.totalIn = "0",
    this.totalOut = "0"
  });

  static Map<String, dynamic> toJson(CashBalance cashBalance){
    return {
      "net_balance": cashBalance.netBalance,
      "total_out": cashBalance.totalOut,
      "total_in": cashBalance.totalIn,
    };
  }

  factory CashBalance.fromJson(Map<String,dynamic> data) {

    final netBalance = data['net_balance'];
    final totalOut = data['total_out'];
    final totalIn = data['total_in'];

    return CashBalance(
        netBalance: netBalance??"0",
        totalIn: totalIn??"0",
        totalOut: totalOut??"0",
    );
  }

  @override
  List<Object?> get props => [];
}