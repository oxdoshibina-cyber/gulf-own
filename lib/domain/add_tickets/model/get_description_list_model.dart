import 'package:equatable/equatable.dart';

class GetDescriptionListModel extends Equatable {
  final int irId;
  final String irName;

  const GetDescriptionListModel({required this.irId, required this.irName});

  factory GetDescriptionListModel.dummy() =>
      const GetDescriptionListModel(irId: -1, irName: '');

  GetDescriptionListModel copyWith({int? irId, String? irName}) {
    return GetDescriptionListModel(
      irId: irId ?? this.irId,
      irName: irName ?? this.irName,
    );
  }

  @override
  List<Object?> get props => [irId, irName];
}
