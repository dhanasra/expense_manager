import 'package:equatable/equatable.dart';

class Activity extends Equatable{

  final String action;
  final String by;
  final int at;

  const Activity({
    required this.action,
    required this.by,
    required this.at
  });

  static List<Activity> getActivitiesList(List<dynamic> data){
    return data.map((e) => Activity.fromJson(e)).toList();
  }

  static Map<String, dynamic> toJson(Activity activity){
    return {
      "action": activity.action,
      "by": activity.by,
      "at": activity.at,
    };
  }

  factory Activity.fromJson(Map<String,dynamic> data) {

    final action = data['action'];
    final by = data['by'];
    final at = data['at'];

    return Activity(
      action: action,
      by: by,
      at: at
    );
  }

  @override
  List<Object?> get props => [];
}