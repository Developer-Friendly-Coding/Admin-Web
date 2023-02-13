import 'package:clean_arch/common/constants/enum/customer_member_status.dart';
import 'package:clean_arch/common/constants/enum/customer_member_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/sub_model/customer_sub.dart';

class CustomerMember implements Base {
  final int _id;
  String _name;
  String? _email;
  String? _phoneNumber;
  CustomerMemberStatus _status;
  CustomerMemberType _type;
  String? _description;
  CustomerSub _customer;
  CustomerMember({
    required int id,
    required String name,
    String? email,
    String? phoneNumber,
    required CustomerMemberStatus status,
    required CustomerMemberType type,
    String? description,
    required CustomerSub customer,
  })  : _id = id,
        _name = name,
        _email = email,
        _phoneNumber = phoneNumber,
        _status = status,
        _type = type,
        _description = description,
        _customer = customer;

  factory CustomerMember.fromJson(Map<String, dynamic> data) {
    return CustomerMember(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        phoneNumber: data['phoneNumber'],
        status: CustomerMemberStatus.values.byName(data['status']),
        type: CustomerMemberType.values.byName(data['type']),
        description: data['description'],
        customer: CustomerSub.fromJson(data['customer']));
  }

  @override
  Map<String, dynamic> toJsonForCreate() {
    Map<String, dynamic> json = {
      'name': _name,
      'email': _email,
      'phoneNumber': _phoneNumber,
      'status': _status.name,
      'type': _type.name,
      'description': _description,
      'customerId': _customer.id,
    };
    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate() {
    Map<String, dynamic> json = {
      'name': _name,
      'email': _email,
      'phoneNumber': _phoneNumber,
      'status': _status.name,
      'type': _type.name,
      'description': _description,
      'customerId': _customer.id,
    };
    return json;
  }

  @override
  List<String> toRow() {
    return [
      _id.toString(),
      _customer.name,
      _name,
      _email ?? "없음",
      _phoneNumber ?? "없음",
      _status.toString(),
      _type.toString(),
      _description ?? "없음"
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "name":
        return _name;
      case "email":
        return _email;
      case "phoneNumber":
        return _phoneNumber;
      case "status":
        return _status;
      case "type":
        return _type;
      case "description":
        return _description;
      case "customerId":
        return _customer.id;
      case "customerName":
        return _customer.name;
      default:
    }
  }

  @override
  void setMemberByText(String member, String text) {
    switch (member) {
      case "name":
        _name = text;
        break;
      case "email":
        _email = (text == "") ? null : text;
        break;
      case "phoneNumber":
        _phoneNumber = (text == "") ? null : text;
        break;
      case "status":
        _status = CustomerMemberStatus.fromString(text);
        break;
      case "type":
        _type = CustomerMemberType.fromString(text);
        break;
      case "description":
        _description = (text == "") ? null : text;
        break;
      // case "customerName":
      //   _customer.name = text;
      //   break;
      default:
    }
  }

  @override
  void setMemberById(String member, int id) {
    switch (member) {
      case "customerId":
        _customer.id = id;
        break;
      default:
    }
  }
}
