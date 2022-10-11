import 'package:equatable/equatable.dart';
import 'package:expense_manager/db/model/activity.dart';
import 'package:expense_manager/db/model/entry_balance.dart';

class CashEntry extends Equatable{

  final String id;
  final String type;
  final String? party;
  final String? picture;
  final String? remark;
  final EntryBalance entryBalance;
  final List activity;

  const CashEntry({
    required this.id,
    required this.type,
    this.party,
    this.picture,
    this.remark,
    required this.entryBalance,
    required this.activity
  });

  static Map<String, dynamic> toJson(CashEntry entry){
    return {
      "id": entry.id,
      "type": entry.type,
      "entry": EntryBalance.toJson(entry.entryBalance),
      "picture": entry.picture,
      "remark": entry.remark,
    };
  }

  factory CashEntry.fromJson(Map<String,dynamic> data) {

    final id = data['id'];
    final type = data['type'];
    final entry = EntryBalance.fromJson(data['entry']);
    final activity = Activity.getActivitiesList(data["activity"]);
    final party = data['party'];
    final picture = data['picture'];
    final remark = data['remark'];

    return CashEntry(
      id: id,
      type: type,
      party: party,
      picture: picture,
      remark: remark,
      entryBalance: entry,
      activity: activity
    );
  }

  @override
  List<Object?> get props => [];
}