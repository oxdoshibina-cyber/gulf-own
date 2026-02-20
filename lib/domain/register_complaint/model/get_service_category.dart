import 'package:equatable/equatable.dart';

class GetServiceCategory extends Equatable {
  final int cId;
  final String cName;
  final String cRemarks;
  final int cGroup3Id;

  const GetServiceCategory({
    required this.cId,
    required this.cName,
    required this.cRemarks,
    required this.cGroup3Id,
  });

  factory GetServiceCategory.dummy() {
    return const GetServiceCategory(
      cId: -1,
      cName: '',
      cRemarks: '',
      cGroup3Id: -1,
    );
  }

  @override
  List<Object?> get props => [cId, cName, cRemarks, cGroup3Id];
}
