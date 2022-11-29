import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:flutter/widgets.dart';

class ServiceProvider implements Base {
  final int _id;
  final String _name;
  final String _registrationNumber;
  final String _companyRegistrationNumber;
  final String _hejhomeToken;

  ServiceProvider({
    id = -1,
    name = "",
    registrationNumber = "",
    companyRegistrationNumber = "",
    hejhomeToken = "",
  })  : _id = id,
        _name = name,
        _registrationNumber = registrationNumber,
        _companyRegistrationNumber = companyRegistrationNumber,
        _hejhomeToken = hejhomeToken;

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
  ServiceProvider fromTEC(List<TextEditingController> list) {
    return ServiceProvider(
      id: (list[0].text == "") ? -1 : int.parse(list[0].text),
      name: list[1].text,
      registrationNumber: list[2].text,
      companyRegistrationNumber: list[3].text,
      hejhomeToken: list[4].text,
    );
  }

  @override
  Map<String, dynamic> toJson(ServiceProvider customer) {
    Map<String, dynamic> json = {
      'name': customer._name,
      'registrationNumber': customer._registrationNumber,
      'companyRegistrationNumber': customer._companyRegistrationNumber,
      'hejhomeToken': customer._hejhomeToken,
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
      _hejhomeToken,
    ];
  }

  @override
  int getId() {
    return _id;
  }
}
