import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/sub_model/contract_sub.dart';
import 'package:clean_arch/model/sub_model/customer_member_sub.dart';
import 'package:clean_arch/model/sub_model/customer_sub.dart';
import 'package:clean_arch/model/sub_model/manager_sub.dart';
import 'package:clean_arch/model/sub_model/office_sub.dart';

class LogOperation implements Base {
  int _id;
  CustomerSub? _customer;
  CustomerMemberSub? _customerMember;
  OfficeSub? _office;
  ContractSub? _contract;
  ManagerSub _manager;
  String? _content;

  LogOperation({
    required int id,
    CustomerSub? customer,
    CustomerMemberSub? customerMember,
    OfficeSub? office,
    ContractSub? contract,
    required ManagerSub manager,
    String? content,
  })  : _id = id,
        _customer = customer,
        _customerMember = customerMember,
        _office = office,
        _contract = contract,
        _manager = manager,
        _content = content;

  factory LogOperation.fromJson(Map<String, dynamic> data) {
    return LogOperation(
      id: data['id'],
      customer: CustomerSub.fromJson(data['customer']),
      customerMember: CustomerMemberSub.fromJson(data['customerMember']),
      office: OfficeSub.fromJson(data['office']),
      contract: ContractSub.fromJson(data['contract']),
      manager: ManagerSub.fromJson(data['manager']),
      content: data['content'],
    );
  }

  @override
  Map<String, dynamic> toJsonForCreate() {
    Map<String, dynamic> json = {
      'customerId': _customer?.id,
      'customerMemberId': _customerMember?.id,
      'officeId': _office?.id,
      'contractId': _contract?.id,
      'managerId': _manager.id,
      'content': _content,
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate() {
    Map<String, dynamic> json = {
      'customerId': _customer?.id,
      'customerMemberId': _customerMember?.id,
      'officeId': _office?.id,
      'contractId': _contract?.id,
      'managerId': _manager.id,
      'content': _content,
    };

    return json;
  }

  @override
  List<String> toRow() {
    return [
      _id.toString(),
      _customer == null ? "입주고객 없음" : _customer!.name,
      _customerMember == null ? "입주멤버 없음" : _customerMember!.name,
      _office == null ? "사무실 없음" : _office!.name,
      _contract == null
          ? "계약 없음"
          : _contract!.description == null
              ? "계약존재하지만 설명없음"
              : _contract!.description!,
      _manager.name,
      _content ?? "없음"
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "customerName":
        return _customer?.name;
      case "customerId":
        return _customer?.id;
      case "customerMemberName":
        return _customerMember?.name;
      case "customerMemberId":
        return _customerMember?.id;
      case "officeName":
        return _office?.name;
      case "officeId":
        return _office?.id;
      case "contractDescription":
        return _contract?.description;
      case "contractId":
        return _contract?.id;
      case "managerName":
        return _manager.name;
      case "managerId":
        return _manager.id;
      case "content":
        return _content;
      default:
    }
  }

  @override
  void setMemberByText(String member, String text) {
    switch (member) {
      case "content":
        _content = (text == "") ? null : text;
        break;
      default:
    }
  }

  @override
  void setMemberById(String member, int id) {
    switch (member) {
      case "customerId":
        _customer!.id = id;
        break;
      case "customerMemberId":
        _customerMember!.id = id;
        break;
      case "officeId":
        _office!.id = id;
        break;
      case "contractId":
        _contract!.id = id;
        break;
      case "managerId":
        _manager.id = id;
        break;

      default:
    }
  }
}
