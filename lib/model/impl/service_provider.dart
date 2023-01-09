import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';

class ServiceProvider implements Base {
  int _id;
  String _name;
  String _registrationNumber;
  String _companyRegistrationNumber;
  String? _hejhomeToken;

  ServiceProvider({
    id = -1,
    name = "",
    registrationNumber = "",
    companyRegistrationNumber = "",
    String? hejhomeToken = "",
  })  : _id = id,
        _name = name,
        _registrationNumber = registrationNumber,
        _companyRegistrationNumber = companyRegistrationNumber,
        _hejhomeToken = hejhomeToken;
  @override
  ServiceProvider getDummy() {
    return ServiceProvider();
  }

  @override
  ServiceProvider fromJson(Map<String, dynamic> data) {
    return ServiceProvider(
      id: data['id'],
      name: data['name'],
      registrationNumber: data['registrationNumber'],
      companyRegistrationNumber: data['companyRegistrationNumber'],
      hejhomeToken: data['hejhomeToken'],
    );
  }

  @override
  Map<String, dynamic> toJsonForCreate(ServiceProvider customer) {
    Map<String, dynamic> json = {
      'name': customer.getMember("name"),
      'registrationNumber': customer.getMember("registrationNumber"),
      'companyRegistrationNumber':
          customer.getMember("companyRegistrationNumber"),
      'hejhomeToken': customer.getMember("hejhomeToken"),
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate(ServiceProvider customer) {
    Map<String, dynamic> json = {
      'name': customer.getMember("name"),
      'registrationNumber': customer.getMember("registrationNumber"),
      'companyRegistrationNumber':
          customer.getMember("companyRegistrationNumber"),
      'hejhomeToken': customer.getMember("hejhomeToken"),
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _name,
      _registrationNumber,
      _companyRegistrationNumber,
      _hejhomeToken.toString(),
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "name":
        return _name;
      case "registrationNumber":
        return _registrationNumber;
      case "companyRegistrationNumber":
        return _companyRegistrationNumber;
      case "hejhomeToken":
        return _hejhomeToken;

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
      case "registrationNumber":
        _registrationNumber = value;
        break;
      case "companyRegistrationNumber":
        _companyRegistrationNumber = value;
        break;
      case "hejhomeToken":
        _hejhomeToken = value;
        break;

      default:
    }
  }
}
