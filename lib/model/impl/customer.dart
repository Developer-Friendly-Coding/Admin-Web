import 'package:clean_arch/common/constants/enum/business_type.dart';
import 'package:clean_arch/common/constants/enum/customer_status.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';

class Customer implements Base {
  final int _id;
  final String _name;
  final BusinessType? _type;
  final String _registrationNumber;
  final String _companyRegistrationNumber;
  final CustomerStatus? _status;
  final String _description;
  final ServiceProviderInCustomer? _serviceProviderInCustomer;

  Customer(
      {int id = -1,
      String name = "",
      BusinessType? type,
      String registrationNumber = "",
      String companyRegistrationNumber = "",
      CustomerStatus? status,
      String description = "",
      ServiceProviderInCustomer? serviceProviderInCustomer})
      : _id = id,
        _name = name,
        _type = type,
        _registrationNumber = registrationNumber,
        _companyRegistrationNumber = companyRegistrationNumber,
        _status = status,
        _description = description,
        _serviceProviderInCustomer = serviceProviderInCustomer;

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
      serviceProviderInCustomer:
          ServiceProviderInCustomer.fromJson(data['serviceProvider']),
    );
  }

  @override
  Customer fromTEC(List<TextEditingController> list) {
    Customer customer = Customer(
      id: list[0].text == "" ? -1 : int.parse(list[0].text),
      name: list[1].text,
      type: BusinessType.fromString(list[2].text),
      registrationNumber: list[3].text,
      companyRegistrationNumber: list[4].text,
      status: CustomerStatus.fromString(list[5].text),
      description: list[6].text,
      serviceProviderInCustomer:
          _serviceProviderInCustomer ?? ServiceProviderInCustomer(),
    );

    customer._serviceProviderInCustomer!.id = int.parse(list[7].text);
    return customer;
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
      'serviceProviderId': customer._serviceProviderInCustomer!.id,
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
      _description,
      _serviceProviderInCustomer!.name.toString()
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "name":
        return _name;
      case "type":
        return _type;
      case "registrationNumber":
        return _registrationNumber;
      case "companyRegistrationNumber":
        return _companyRegistrationNumber;
      case "status":
        return _status;
      case "description":
        return _description;
      case "serviceProviderId":
        return _serviceProviderInCustomer!.id;
      case "serviceProviderName":
        return _serviceProviderInCustomer!.name;
      default:
    }
  }
}

class ServiceProviderInCustomer {
  int id;
  String name;
  String registrationNumber;
  String companyRegistrationNumber;
  String hejhomeToken;

  ServiceProviderInCustomer({
    int id = -1,
    String name = "",
    String registrationNumber = "",
    String companyRegistrationNumber = "",
    String hejhomeToken = "",
  })  : id = id,
        name = name,
        registrationNumber = registrationNumber,
        companyRegistrationNumber = companyRegistrationNumber,
        hejhomeToken = hejhomeToken;

  factory ServiceProviderInCustomer.fromJson(Map<String, dynamic> data) {
    return ServiceProviderInCustomer(
      id: data['id'],
      name: data['name'],
      registrationNumber: data['registrationNumber'],
      companyRegistrationNumber: data['companyRegistrationNumber'],
      hejhomeToken: data['hejhomeToken'],
    );
  }
}
