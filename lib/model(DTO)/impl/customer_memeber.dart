import 'package:clean_arch/common/constants/enum/customer_member_status.dart';
import 'package:clean_arch/common/constants/enum/customer_member_type.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:flutter/widgets.dart';

class CustomerMember implements Base {
  final int _id;
  final int _customerId;
  final String? _name;
  final String? _email;
  final String? _phoneNumber;
  final CustomerMemberStatus? _status;
  final CustomerMemberType? _type;
  final String? _description;

  CustomerMember({
    int id = -1,
    int customerId = -1,
    String? name,
    String? email,
    String? phoneNumber,
    CustomerMemberStatus? status,
    CustomerMemberType? type,
    String? description,
  })  : _id = id,
        _customerId = customerId,
        _name = name,
        _email = email,
        _phoneNumber = phoneNumber,
        _status = status,
        _type = type,
        _description = description;

  @override
  CustomerMember fromJson(Map<String, dynamic> data) {
    return CustomerMember(
      id: data['id'],
      customerId: data['customerId'],
      name: data['name'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
      status: data['status'] == null
          ? null
          : CustomerMemberStatus.values.byName(data['status']),
      type: data['type'] == null
          ? null
          : CustomerMemberType.values.byName(data['type']),
      description: data['description'],
    );
  }

  @override
  CustomerMember fromTEC(List<TextEditingController> list) {
    return CustomerMember(
      id: list[0].text == "" ? -1 : int.parse(list[0].text),
      customerId: int.parse(list[1].text),
      name: list[2].text,
      email: list[3].text,
      phoneNumber: list[4].text,
      status: list[5].text == ""
          ? null
          : CustomerMemberStatus.fromString(list[5].text),
      type: list[6].text == ""
          ? null
          : CustomerMemberType.fromString(list[6].text),
      description: list[7].text,
    );
  }

  @override
  Map<String, dynamic> toJson(CustomerMember customer) {
    Map<String, dynamic> json = {
      'customerId': customer._customerId,
      'name': customer._name,
      'email': customer._email,
      'phoneNumber': customer._phoneNumber,
      'status': customer._status?.name,
      'type': customer._type?.name,
      'description': customer._description,
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _customerId.toString(),
      _name.toString(),
      _email.toString(),
      _phoneNumber.toString(),
      _status.toString(),
      _type.toString(),
      _description.toString()
    ];
  }

  @override
  int getId() {
    return _id;
  }
}
