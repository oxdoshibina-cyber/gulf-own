import 'package:equatable/equatable.dart';

import 'items_collected_response_model.dart';

class InsertItemsCollectedReqModel extends Equatable{
final int iic_id;
final String iic_name;
final int iic_status;
final String iic_remarks;
const InsertItemsCollectedReqModel({
  required this.iic_id,
  required this.iic_name,
  required this.iic_status,
  required this.iic_remarks,
});

factory InsertItemsCollectedReqModel.dummy(){
  return const InsertItemsCollectedReqModel(
    iic_id: -1,
      iic_name: "",
      iic_status: -1,
      iic_remarks: "",
  );
}

@override
List<Object?> get props => [
  iic_id,
  iic_name,
  iic_status,
  iic_remarks,
];

Map<String, dynamic> toMap() {
  return {
    "iic_id": iic_id,
    "iic_name": iic_name,
    "iic_status": iic_status,
    "iic_remarks": iic_remarks,
  };
}

factory InsertItemsCollectedReqModel.fromGetModel(
    ItemsCollectedResponseModel model,
    ){
  return InsertItemsCollectedReqModel(
    iic_id: model.iicId,
      iic_name: model.iicName,
      iic_status: model.iicStatus,
      iic_remarks: model.iicRemarks
  );

}

InsertItemsCollectedReqModel copyWith({
  int? iic_id,
  String? iic_name,
  int? iic_status,
  String? iic_remarks,
}){
  return InsertItemsCollectedReqModel(
    iic_id: iic_id ?? this.iic_id,
    iic_name: iic_name ?? this.iic_name,
    iic_status: iic_status ?? this.iic_status,
    iic_remarks: iic_remarks ?? this.iic_remarks,
  );
}



}