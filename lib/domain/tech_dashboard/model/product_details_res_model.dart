import 'package:equatable/equatable.dart';

class ProductDetailsResModel extends Equatable {
  final int irId;
  final String irName;
  final double irCgst;
  final double irSgst;
  final String qty;
  final double uniqueCode;
  final String pRate;
  final String mrp;
  final String wholeSale;
  final String spRetail;
  final String branch;
  final String retail;
  final String realPrate;
  final String cost;

  const ProductDetailsResModel({
    required this.irId,
    required this.irName,
    required this.irCgst,
    required this.irSgst,
    required this.qty,
    required this.uniqueCode,
    required this.pRate,
    required this.mrp,
    required this.wholeSale,
    required this.spRetail,
    required this.branch,
    required this.retail,
    required this.realPrate,
    required this.cost,
  });

  factory ProductDetailsResModel.dummy() {
    return const ProductDetailsResModel(
      irId: -1,
      irName: '',
      irCgst: 0.0,
      irSgst: 0.0,
      qty: '',
      uniqueCode: -1,
      pRate: '',
      mrp: '',
      wholeSale: '',
      spRetail: '',
      branch: '',
      retail: '',
      realPrate: '',
      cost: '',
    );
  }

  @override
  List<Object?> get props => [
    irId,
    irName,
    irCgst,
    irSgst,
    qty,
    uniqueCode,
    pRate,
    mrp,
    wholeSale,
    spRetail,
    branch,
    retail,
    realPrate,
    cost,
  ];
}
