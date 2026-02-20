import 'package:equatable/equatable.dart';

class GetServiceCardModel extends Equatable {
  final int id;
  final String name;

  const GetServiceCardModel({required this.id, required this.name});

  factory GetServiceCardModel.dummy() =>
      const GetServiceCardModel(id: -1, name: '');

  GetServiceCardModel copyWith({int? id, String? name}) {
    return GetServiceCardModel(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  List<Object?> get props => [id, name];
}
