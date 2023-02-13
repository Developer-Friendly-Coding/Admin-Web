import 'package:clean_arch/common/constants/enum/contract_type.dart';

class ContractSub {
  int id;
  double deposit;
  double rentPrice;
  String? description;
  DateTime? contractDatetime;
  DateTime? startDatetime;
  DateTime? endDatetime;
  ContractType? type;

  ContractSub({
    int id = -1,
    double deposit = -1.0,
    double rentPrice = -1.0,
    String? description = "",
    DateTime? contractDatetime,
    DateTime? startDatetime,
    DateTime? endDatetime,
    ContractType? type,
  })  : id = id,
        deposit = deposit,
        rentPrice = rentPrice,
        description = description,
        contractDatetime = contractDatetime,
        startDatetime = startDatetime,
        endDatetime = endDatetime,
        type = type;

  factory ContractSub.fromJson(Map<String, dynamic> data) {
    return ContractSub(
        id: data['id'],
        deposit: data['deposit'],
        rentPrice: data['rentPrice'],
        description: data['description'],
        contractDatetime: data['contractDatetime'] == null
            ? null
            : DateTime.parse(data['contractDatetime']),
        startDatetime: data['startDatetime'] == null
            ? null
            : DateTime.parse(data['startDatetime']),
        endDatetime: data['endDatetime'] == null
            ? null
            : DateTime.parse(data['endDatetime']),
        type: data['type'] == null
            ? null
            : ContractType.values.byName(data['type']));
  }
}
