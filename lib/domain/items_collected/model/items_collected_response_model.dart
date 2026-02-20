import 'package:equatable/equatable.dart';

class ItemsCollectedResponseModel extends Equatable {
  final int iicId;
  final String iicName;
  final int iicStatus;
  final String iicRemarks;

  const ItemsCollectedResponseModel({
    required this.iicId,
    required this.iicName,
    required this.iicStatus,
    required this.iicRemarks,
  });

  factory ItemsCollectedResponseModel.dummy() {
    return const ItemsCollectedResponseModel(
      iicId: -1,
      iicName: '',
      iicStatus: 0,
      iicRemarks: '',
    );
  }

  @override
  List<Object> get props => [
    iicId,
    iicName,
    iicStatus,
    iicRemarks,
  ];
}
