import 'package:equatable/equatable.dart';

class SparePartHistoryModel extends Equatable {
  final String spareName;
  final String customerName;
  final String date;
  final double price;

  const SparePartHistoryModel({
    required this.spareName,
    required this.customerName,
    required this.date,
    required this.price,
  });

  factory SparePartHistoryModel.dummy() {
    return const SparePartHistoryModel(
      spareName: '',
      customerName: '',
      date: '',
      price: 0,
    );
  }

  @override
  List<Object> get props => [spareName, customerName, date, price];
}
