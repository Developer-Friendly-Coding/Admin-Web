import 'package:clean_arch/common/constants/enum/business_type.dart';
import 'package:clean_arch/common/constants/enum/customer_status.dart';
import 'package:clean_arch/common/constants/mapper/cu_dialog_mapper.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';

class Customer implements Base {
  int _id;
  String _name;
  BusinessType? _type;
  String _registrationNumber;
  String _companyRegistrationNumber;
  CustomerStatus? _status;
  String _description;
  ServiceProviderInCustomer _serviceProvider;

  Customer(
      {int id = -1,
      String name = "",
      BusinessType? type,
      String registrationNumber = "",
      String companyRegistrationNumber = "",
      CustomerStatus? status,
      String description = "",
      ServiceProviderInCustomer? serviceProvider})
      : _id = id,
        _name = name,
        _type = type,
        _registrationNumber = registrationNumber,
        _companyRegistrationNumber = companyRegistrationNumber,
        _status = status,
        _description = description,
        _serviceProvider = serviceProvider ?? ServiceProviderInCustomer();
  @override
  Customer getDummy() {
    return Customer();
  }

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
      serviceProvider:
          ServiceProviderInCustomer.fromJson(data['serviceProvider']),
    );
  }

  @override
  Map<String, dynamic> toJsonForCreate(Customer customer) {
    BusinessType type = customer.getMember("type");
    CustomerStatus status = customer.getMember("status");
    Map<String, dynamic> json = {
      'name': customer.getMember("name"),
      'type': type.name,
      'registrationNumber': customer.getMember("registrationNumber"),
      'companyRegistrationNumber':
          customer.getMember("companyRegistrationNumber"),
      'status': status.name,
      'description': customer.getMember("description"),
      'serviceProviderId': customer.getMember("serviceProviderId"),
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate(Customer customer) {
    BusinessType type = customer.getMember("type");
    CustomerStatus status = customer.getMember("status");
    Map<String, dynamic> json = {
      'name': customer.getMember("name"),
      'type': type.name,
      'registrationNumber': customer.getMember("registrationNumber"),
      'companyRegistrationNumber':
          customer.getMember("companyRegistrationNumber"),
      'status': status.name,
      'description': customer.getMember("description"),
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
      _serviceProvider.name.toString()
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
      case "serviceProvider":
        return _serviceProvider;
      case "serviceProviderId":
        return _serviceProvider.id;
      case "serviceProviderName":
        return _serviceProvider.name;
      default:
    }
  }

  @override
  void setMember(String member, dynamic value) {
    switch (member) {
      case "id":
        _id = value;
        break;
      case "name":
        _name = value;
        break;
      case "type":
        _type = BusinessType.fromString(value);
        break;
      case "registrationNumber":
        _registrationNumber = value;
        break;
      case "companyRegistrationNumber":
        _companyRegistrationNumber = value;
        break;
      case "status":
        _status = CustomerStatus.fromString(value);
        break;
      case "description":
        _description = value;
        break;
      case "serviceProvider":
        _serviceProvider = value;
        break;
      case "serviceProviderId":
        _serviceProvider.id = value;
        break;
      case "serviceProviderName":
        _serviceProvider.name = value;
        break;
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
