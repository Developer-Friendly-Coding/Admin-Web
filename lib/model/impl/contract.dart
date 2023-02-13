import 'package:clean_arch/common/constants/enum/contract_status.dart';
import 'package:clean_arch/common/constants/enum/contract_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/sub_model/customer_member_sub.dart';
import 'package:clean_arch/model/sub_model/customer_sub.dart';
import 'package:clean_arch/model/sub_model/manager_sub.dart';
import 'package:intl/intl.dart';

class Contract implements Base {
  final int _id;
  double? _deposit;
  double? _rentPrice;
  String? _description;
  DateTime? _contractDatetime;
  DateTime? _startDatetime;
  DateTime? _endDatetime;
  CustomerMemberSub _contractRep;
  CustomerMemberSub _contactRep;
  CustomerSub _customer;
  ManagerSub _manager;
  ContractType _type;
  ContractStatus _status;

  Contract(
      {required int id,
      double? deposit,
      double? rentPrice,
      String? description,
      DateTime? contractDatetime,
      DateTime? startDatetime,
      DateTime? endDatetime,
      required CustomerMemberSub contractRep,
      required CustomerMemberSub contactRep,
      required CustomerSub customer,
      required ManagerSub manager,
      required ContractType type,
      required ContractStatus status})
      : _id = id,
        _deposit = deposit,
        _rentPrice = rentPrice,
        _description = description,
        _contractDatetime = contractDatetime,
        _startDatetime = startDatetime,
        _endDatetime = endDatetime,
        _contractRep = contractRep,
        _contactRep = contactRep,
        _customer = customer,
        _manager = manager,
        _type = type,
        _status = status;

  factory Contract.fromJson(Map<String, dynamic> data) {
    return Contract(
        id: data['id'],
        deposit: data["deposit"],
        rentPrice: data["rentPrice"],
        description: data['description'],
        contractDatetime: data['contractDatetime'] == null
            ? null
            : DateTime.tryParse(data['contractDatetime']),
        startDatetime: data['startDatetime'] == null
            ? null
            : DateTime.tryParse(data['startDatetime']),
        endDatetime: data['endDatetime'] == null
            ? null
            : DateTime.tryParse(data['endDatetime']),
        contractRep: CustomerMemberSub.fromJson(data['contractRep']),
        contactRep: CustomerMemberSub.fromJson(data['contactRep']),
        customer: CustomerSub.fromJson(data['customer']),
        manager: ManagerSub.fromJson(data['manager']),
        type: ContractType.values.byName(data['type']),
        status: ContractStatus.values.byName(data['status']));
  }

  @override
  Map<String, dynamic> toJsonForCreate() {
    Map<String, dynamic> json = {
      'deposit': _deposit,
      'rentPrice': _rentPrice,
      'description': _description,
      'contractDatetime': _contractDatetime == null
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(_contractDatetime!),
      'startDatetime': _startDatetime == null
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(_startDatetime!),
      'endDatetime': _startDatetime == null
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(_endDatetime!),
      'contractRepId': _contactRep.id,
      'contactRepId': _contactRep.id,
      'customerId': _customer.id,
      'managerId': _manager.id,
      'type': _type.name,
      'status': _status.name,
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate() {
    Map<String, dynamic> json = {
      'deposit': _deposit,
      'rentPrice': _rentPrice,
      'description': _description,
      'contractDatetime': _contractDatetime == null
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(_contractDatetime!),
      'startDatetime': _startDatetime == null
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(_startDatetime!),
      'endDatetime': _startDatetime == null
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(_endDatetime!),
      'contractRepId': _contactRep.id,
      'contactRepId': _contactRep.id,
      'type': _type.name,
      'status': _status.name,
    };

    return json;
  }

  @override
  List<String> toRow() {
    return [
      _id.toString(),
      _customer.name,
      _status.toString(),
      _deposit == null ? "없음" : _deposit.toString(),
      _rentPrice == null ? "없음" : _rentPrice.toString(),
      _contractRep.name,
      _contactRep.name,
      _manager.name,
      _contractDatetime == null
          ? "없음"
          : DateFormat('yyyy-MM-dd').format(_contractDatetime!),
      _startDatetime == null
          ? "없음"
          : DateFormat('yyyy-MM-dd').format(_startDatetime!),
      _endDatetime == null
          ? "없음"
          : DateFormat('yyyy-MM-dd').format(_endDatetime!),
      _type.toString(),
      _description ?? "없음"
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "deposit":
        return _deposit;
      case "rentPrice":
        return _rentPrice;
      case "description":
        return _description;
      case "contractDatetime":
        return _contractDatetime;
      case "startDatetime":
        return _startDatetime;
      case "endDatetime":
        return _endDatetime;
      case "contractRepId":
        return _contractRep.id;
      case "contractRepName":
        return _contractRep.name;
      case "contactRepId":
        return _contactRep.id;
      case "contactRepName":
        return _contactRep.name;
      case "customerId":
        return _customer.id;
      case "customerName":
        return _customer.name;
      case "managerId":
        return _manager.id;
      case "managerName":
        return _manager.name;
      case "type":
        return _type;
      case "status":
        return _status;
      default:
    }
  }

  @override
  void setMemberById(String member, int id) {
    switch (member) {
      case "contractRepId":
        _contractRep.id = id;
        break;
      case "contactRepId":
        _contactRep.id = id;
        break;
      case "customerId":
        _customer.id = id;
        break;
      case "managerId":
        _manager.id = id;
        break;
      default:
    }
  }

  @override
  void setMemberByText(String member, String text) {
    switch (member) {
      case "deposit":
        _deposit = (text == "") ? null : double.parse(text);
        break;
      case "rentPrice":
        _rentPrice = (text == "") ? null : double.parse(text);
        break;
      case "description":
        _description = (text == "") ? null : text;
        break;
      case "contractDatetime":
        _contractDatetime = (text == "") ? null : DateTime.parse(text);
        break;
      case "startDatetime":
        _startDatetime = (text == "") ? null : DateTime.parse(text);
        break;
      case "endDatetime":
        _endDatetime = (text == "") ? null : DateTime.parse(text);
        break;
      case "type":
        _type = ContractType.fromString(text);
        break;
      case "status":
        _status = ContractStatus.fromString(text);
        break;
      default:
    }
  }
}
