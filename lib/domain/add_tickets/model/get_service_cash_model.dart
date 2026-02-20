import 'package:equatable/equatable.dart';

class GetServiceCashModel extends Equatable {
  final int id;
  final String name;

  const GetServiceCashModel({required this.id, required this.name});

  factory GetServiceCashModel.dummy() =>
      const GetServiceCashModel(id: -1, name: '');

  GetServiceCashModel copyWith({int? id, String? name}) {
    return GetServiceCashModel(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  List<Object?> get props => [id, name];
}
