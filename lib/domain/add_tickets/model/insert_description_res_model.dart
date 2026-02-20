import 'package:equatable/equatable.dart';

class InsertDescriptionResModel extends Equatable {
  final int irId;
  final String irName;
  final int irActive;

  const InsertDescriptionResModel({
    required this.irId,
    required this.irName,
    required this.irActive,
  });

  factory InsertDescriptionResModel.dummy() =>
      const InsertDescriptionResModel(irId: -1, irName: '', irActive: 0);

  InsertDescriptionResModel copyWith({
    int? irId,
    String? irName,
    int? irActive,
  }) {
    return InsertDescriptionResModel(
      irId: irId ?? this.irId,
      irName: irName ?? this.irName,
      irActive: irActive ?? this.irActive,
    );
  }

  @override
  List<Object?> get props => [irId, irName, irActive];
}
