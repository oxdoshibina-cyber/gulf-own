import 'package:equatable/equatable.dart';

class SpareListModel
 extends Equatable {
  final int irId;
  final String irName;

  const SpareListModel
  ({required this.irId, required this.irName});

  factory SpareListModel
  .dummy() =>
      const SpareListModel
      (irId: -1, irName: '');

  SpareListModel
   copyWith({int? irId, String? irName}) {
    return SpareListModel
    (
      irId: irId ?? this.irId,
      irName: irName ?? this.irName,
    );
  }

  @override
  List<Object?> get props => [irId, irName];
}
