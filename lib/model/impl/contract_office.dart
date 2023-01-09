import 'package:clean_arch/common/constants/enum/contract_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ContractOffice implements Base {
  int _id;
  int _contractId;
  int _officeId;
  String? _description;

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
  ContractOffice getDummy() {
    return ContractOffice();
  }

  @override
  ContractOffice fromJson(Map<String, dynamic> data) {
    return ContractOffice(
        id: data['id'],
        contractId: data['contractId'],
        officeId: data['officeId'],
        description: data['description']);
  }

  @override
  Map<String, dynamic> toJsonForCreate(ContractOffice contract) {
    Map<String, dynamic> json = {
      'contractId': contract._contractId,
      'officeId': contract._officeId,
      'description': contract._description,
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate(ContractOffice contract) {
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

  @override
  void setMember(String member, dynamic value) {
    switch (member) {
      case "id":
        _id = value;
        break;
      case "contractId":
        _contractId = value;
        break;
      case "officeId":
        _officeId = value;
        break;
      case "description":
        _description = value;
        break;
      default:
    }
  }
}
