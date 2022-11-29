import 'package:clean_arch/common/constants/enum/contract_type.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Contract implements Base {
  final int _id;
  final int _customerId;
  final int? _deposit;
  final int? _rent;
  final int _contractRepId;
  final int _contactRepId;
  final DateTime? _contractDatetime;
  final DateTime? _startDatetime;
  final DateTime? _endDatetime;
  final ContractType? _type;
  final String? _description;

  Contract({
    int id = -1,
    int customerId = -1,
    int? deposit,
    int? rent,
    int contractRepId = -1,
    int contactRepId = -1,
    DateTime? contractDatetime,
    DateTime? startDatetime,
    DateTime? endDatetime,
    ContractType? type,
    String? description,
  })  : _id = id,
        _customerId = customerId,
        _deposit = deposit,
        _rent = rent,
        _contractRepId = contractRepId,
        _contactRepId = contactRepId,
        _contractDatetime = contractDatetime,
        _startDatetime = startDatetime,
        _endDatetime = endDatetime,
        _type = type,
        _description = description;

  @override
  Contract fromJson(Map<String, dynamic> data) {
    return Contract(
        id: data['id'],
        customerId: data['customerId'],
        deposit: data['deposit'],
        rent: data['rent'],
        contractRepId: data['contractRepId'],
        contactRepId: data['contactRepId'],
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
            : ContractType.values.byName(data['type']),
        description: data['description']);
  }

  @override
  Contract fromTEC(List<TextEditingController> list) {
    return Contract(
        id: (list[0].text == "") ? -1 : int.parse(list[0].text),
        customerId: int.parse(list[1].text),
        deposit: list[2].text == "" ? null : int.parse(list[2].text),
        rent: list[3].text == "" ? null : int.parse(list[3].text),
        contractRepId: int.parse(list[4].text),
        contactRepId: int.parse(list[5].text),
        contractDatetime:
            list[6].text == "" ? null : DateTime.parse(list[6].text),
        startDatetime: list[7].text == "" ? null : DateTime.parse(list[6].text),
        endDatetime: list[8].text == "" ? null : DateTime.parse(list[6].text),
        type: list[9].text == "" ? null : ContractType.fromString(list[9].text),
        description: list[10].text == "" ? null : list[10].text);
  }

  @override
  Map<String, dynamic> toJson(Contract contract) {
    Map<String, dynamic> json = {
      'customerId': contract._customerId,
      'deposit': contract._deposit,
      'rent': contract._rent,
      'contractRepId': contract._contractRepId,
      'contactRepId': contract._contactRepId,
      'contractDatetime': contract._contractDatetime?.toString(),
      'startDatetime': contract._startDatetime?.toString(),
      'endDatetime': contract._endDatetime?.toString(),
      'type': contract._type?.name,
      'description': contract._description,
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _customerId.toString(),
      _deposit.toString(),
      _rent.toString(),
      _contractRepId.toString(),
      _contactRepId.toString(),
      _contractDatetime == null
          ? null.toString()
          : DateFormat('yy/MM/dd').format(_contractDatetime!),
      _startDatetime == null
          ? null.toString()
          : DateFormat('yy/MM/dd').format(_startDatetime!),
      _endDatetime == null
          ? null.toString()
          : DateFormat('yy/MM/dd').format(_endDatetime!),
      _type.toString(),
      _description.toString()
    ];
  }

  @override
  int getId() {
    return _id;
  }
}
