import 'package:equatable/equatable.dart';

class Default extends Equatable{

  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const Default({
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  static Map<String, dynamic> toJson(Default cashBalance){
    return {
      "created_at": cashBalance.createdAt,
      "created_by": cashBalance.createdBy,
      "updated_at": cashBalance.updatedAt,
      "updated_by": cashBalance.updatedBy,
    };
  }

  factory Default.fromJson(Map<String,dynamic> data) {

    final createdAt = data['created_at'];
    final createdBy = data['created_by'];
    final updatedAt = data['updated_at'];
    final updatedBy = data['updated_by'];

    return Default(
      createdAt: createdAt,
      createdBy: createdBy,
      updatedAt: updatedAt,
      updatedBy: updatedBy,
    );
  }

  @override
  List<Object?> get props => [];
}