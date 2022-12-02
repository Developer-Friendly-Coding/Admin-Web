import 'package:clean_arch/common/constants/enum/business_type.dart';
import 'package:clean_arch/common/constants/enum/customer_status.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:flutter/widgets.dart';

class Customer implements Base {
  final int _id;
  final String _name;
  final BusinessType? _type;
  final String _registrationNumber;
  final String _companyRegistrationNumber;
  final CustomerStatus? _status;
  final String _description;

  Customer(
      {int id = -1,
      String name = "",
      BusinessType? type,
      String registrationNumber = "",
      String companyRegistrationNumber = "",
      CustomerStatus? status,
      String description = ""})
      : _id = id,
        _name = name,
        _type = type,
        _registrationNumber = registrationNumber,
        _companyRegistrationNumber = companyRegistrationNumber,
        _status = status,
        _description = description;

  @override
  Customer fromJson(Map<String, dynamic> data) {
    return Customer(
      id: data['id'],
      name: data['name'],
      type: BusinessType.values.byName(data['type']),
      registrationNumber: data['registrationNumber'],
      companyRegistrationNumber: data['companyRegistrationNumber'],
      status: CustomerStatus.values.byName(data['status']),
      description: data['description'],
    );
  }

  @override
  Customer fromTEC(List<TextEditingController> list) {
    return Customer(
      id: list[0].text == "" ? -1 : int.parse(list[0].text),
      name: list[1].text,
      type: BusinessType.fromString(list[2].text),
      registrationNumber: list[3].text,
      companyRegistrationNumber: list[4].text,
      status: CustomerStatus.fromString(list[5].text),
      description: list[6].text,
    );
  }

  @override
  Map<String, dynamic> toJson(Customer customer) {
    Map<String, dynamic> json = {
      'name': customer._name,
      'type': customer._type!.name,
      'registrationNumber': customer._registrationNumber,
      'companyRegistrationNumber': customer._companyRegistrationNumber,
      'status': customer._status!.name,
      'description': customer._description,
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _name,
      _type.toString(),
      _registrationNumber,
      _companyRegistrationNumber,
      _status.toString(),
      _description
    ];
  }

  @override
  int getId() {
    return _id;
  }
}
