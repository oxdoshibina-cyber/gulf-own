import 'package:equatable/equatable.dart';

class InsertDescriptionReqModel extends Equatable {
  final String descName;

  const InsertDescriptionReqModel({required this.descName});
  @override
  List<Object?> get props => [descName];

  factory InsertDescriptionReqModel.dummy() {
    return const InsertDescriptionReqModel(descName: '');
  }

  Map<String, dynamic> toMap() {
    return {"descName": descName};
  }
}
