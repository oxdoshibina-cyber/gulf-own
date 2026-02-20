import 'package:equatable/equatable.dart';

class GetSpareRequestListResponseModel extends Equatable{
  final int si_entryno;
  final String si_cust_name;
  final String scr_mobile_no;
  final String si_company;
  final String si_model;
  final String si_finish;
  final int si_assign_to;
  final String Technician;
  final String EstimateCost;
  final String si_deliverydate;
  final String spareStatus;
  const GetSpareRequestListResponseModel(
      {
        required this.si_entryno,
        required this.si_cust_name,
        required this.scr_mobile_no,
        required this.si_company,
        required this.si_model,
        required this.si_finish,
        required this.si_assign_to,
        required this.Technician,
        required this.EstimateCost,
        required this.si_deliverydate,
        required this.spareStatus,
      });

  factory GetSpareRequestListResponseModel.dummy(){
    return const GetSpareRequestListResponseModel(
      si_entryno: -1,
      si_cust_name: "",
      scr_mobile_no: "",
      si_company: "",
      si_model: "",
      si_finish: "",
      si_assign_to: -1,
      Technician: "",
      EstimateCost: "",
      si_deliverydate: "",
      spareStatus: "",
    );
  }


  @override
  List<Object> get props => [
    si_entryno,
    si_cust_name,
    scr_mobile_no,
    si_company,
    si_model,
    si_finish,
    si_assign_to,
    Technician,
    EstimateCost,
    si_deliverydate,
    spareStatus
  ];
}