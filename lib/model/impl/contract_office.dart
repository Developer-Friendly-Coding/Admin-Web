import 'package:clean_arch/common/constants/enum/contract_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ContractOffice implements Base {
  final int _id;
  final int _contractId;
  final int _officeId;
  final String? _description;

  ContractOffice({
    int id = -1,
    int contractId = -1,
    int officeId = -1,
    String? description,
  })  : _id = id,
        _contractId = contractId,
        _officeId = officeId,
        _description = description;

  @override
  ContractOffice fromJson(Map<String, dynamic> data) {
    return ContractOffice(
        id: data['id'],
        contractId: data['contractId'],
        officeId: data['officeId'],
        description: data['description']);
  }

  @override
  ContractOffice fromTEC(List<TextEditingController> list) {
    return ContractOffice(
        id: list[0].text == "" ? -1 : int.parse(list[0].text),
        contractId: int.parse(list[1].text),
        officeId: int.parse(list[2].text),
        description: list[3].text == "" ? "없음" : list[3].text);
  }

  @override
  Map<String, dynamic> toJson(ContractOffice contract) {
    Map<String, dynamic> json = {
      'contractId': contract._contractId,
      'officeId': contract._officeId,
      'description': contract._description,
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _contractId.toString(),
      _officeId.toString(),
      _description.toString(),
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "contractId":
        return _contractId;
      case "officeId":
        return _officeId;
      case "description":
        return _description;

      default:
    }
  }
}
