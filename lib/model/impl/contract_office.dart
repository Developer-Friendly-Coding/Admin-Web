import 'package:clean_arch/model/base_model.dart';

class ContractOffice implements Base {
  final int _id;
  int _contractId;
  int _officeId;
  String? _description;

  ContractOffice({
    required int id,
    required int contractId,
    required int officeId,
    String? description,
  })  : _id = id,
        _contractId = contractId,
        _officeId = officeId,
        _description = description;

  factory ContractOffice.fromJson(Map<String, dynamic> data) {
    return ContractOffice(
        id: data['id'],
        contractId: data['contractId'],
        officeId: data['officeId'],
        description: data['description']);
  }

  @override
  Map<String, dynamic> toJsonForCreate() {
    Map<String, dynamic> json = {
      'contractId': _contractId,
      'officeId': _officeId,
      'description': _description,
    };
    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate() {
    Map<String, dynamic> json = {
      'contractId': _contractId,
      'officeId': _officeId,
      'description': _description,
    };
    return json;
  }

  @override
  List<String> toRow() {
    return [
      _id.toString(),
      _contractId.toString(),
      _officeId.toString(),
      _description ?? "없음",
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
  void setMemberByText(String member, String text) {
    switch (member) {
      case "description":
        _description = (text == "") ? "없음" : text;
        break;
      default:
    }
  }

  @override
  void setMemberById(String member, int id) {
    switch (member) {
      case "contractId":
        _contractId = id;
        break;
      case "officeId":
        _officeId = id;
        break;

      default:
    }
  }
}
