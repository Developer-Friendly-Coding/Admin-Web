import 'package:clean_arch/common/constants/enum/business_type.dart';
import 'package:clean_arch/common/constants/enum/customer_member_status.dart';
import 'package:clean_arch/common/constants/enum/customer_member_type.dart';
import 'package:clean_arch/common/constants/enum/customer_status.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';

class CustomerMember implements Base {
  final int _id;
  final String? _name;
  final String? _email;
  final String? _phoneNumber;
  final CustomerMemberStatus? _status;
  final CustomerMemberType? _type;
  final String? _description;
  final CustomerInCustomerMember? _customerInCustomerMember;
  CustomerMember({
    int id = -1,
    String? name,
    String? email,
    String? phoneNumber,
    CustomerMemberStatus? status,
    CustomerMemberType? type,
    String? description,
    CustomerInCustomerMember? customerInCustomerMember,
  })  : _id = id,
        _name = name,
        _email = email,
        _phoneNumber = phoneNumber,
        _status = status,
        _type = type,
        _description = description,
        _customerInCustomerMember = customerInCustomerMember;

  @override
  CustomerMember fromJson(Map<String, dynamic> data) {
    return CustomerMember(
        id: data['id'],
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
        customerInCustomerMember:
            CustomerInCustomerMember.fromJson(data['customer']));
  }

  @override
  CustomerMember fromTEC(List<TextEditingController> list) {
    CustomerMember customerMember = CustomerMember(
      id: list[0].text == "" ? -1 : int.parse(list[0].text),
      customerInCustomerMember: _customerInCustomerMember,
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

    customerMember._customerInCustomerMember!.id = int.parse(list[1].text);
    return customerMember;
  }

  @override
  Map<String, dynamic> toJson(CustomerMember customer) {
    Map<String, dynamic> json = {
      'customerId': customer._customerInCustomerMember!.id,
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
      _customerInCustomerMember?.name.toString(),
      _name.toString(),
      _email.toString(),
      _phoneNumber.toString(),
      _status.toString(),
      _type.toString(),
      _description.toString()
    ];
  }

  @override
  List<String?> forUpdate() {
    return [
      _id.toString(),
      _customerInCustomerMember?.name.toString(),
      _name.toString(),
      _email.toString(),
      _phoneNumber.toString(),
      _status.toString(),
      _type.toString(),
      _description.toString()
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
        return _customerInCustomerMember!.id;
      case "customerName":
        return _customerInCustomerMember!.name;
      default:
    }
  }
}

class CustomerInCustomerMember {
  int id;
  String name;
  BusinessType? type;
  String registrationNumber;
  String companyRegistrationNumber;
  CustomerStatus? status;
  String description;

  CustomerInCustomerMember({
    int id = -1,
    String name = "",
    BusinessType? type,
    String registrationNumber = "",
    String companyRegistrationNumber = "",
    CustomerStatus? status,
    String description = "",
  })  : id = id,
        name = name,
        type = type,
        registrationNumber = registrationNumber,
        companyRegistrationNumber = companyRegistrationNumber,
        status = status,
        description = description;

  factory CustomerInCustomerMember.fromJson(Map<String, dynamic> data) {
    return CustomerInCustomerMember(
      id: data['id'],
      name: data['name'],
      type: BusinessType.values.byName(data['type']),
      registrationNumber: data['registrationNumber'],
      companyRegistrationNumber: data['companyRegistrationNumber'],
      status: CustomerStatus.values.byName(data['status']),
      description: data['description'],
    );
  }
}
