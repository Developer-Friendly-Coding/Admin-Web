import 'package:clean_arch/model/base_model.dart';

class ServiceProvider implements Base {
  int _id;
  String _name;
  String? _registrationNumber;
  String? _companyRegistrationNumber;
  String? _hejhomeToken;

  ServiceProvider({
    required int id,
    required String name,
    String? registrationNumber,
    String? companyRegistrationNumber,
    String? hejhomeToken,
  })  : _id = id,
        _name = name,
        _registrationNumber = registrationNumber,
        _companyRegistrationNumber = companyRegistrationNumber,
        _hejhomeToken = hejhomeToken;

  factory ServiceProvider.fromJson(Map<String, dynamic> data) {
    return ServiceProvider(
      id: data['id'],
      name: data['name'],
      registrationNumber: data['registrationNumber'],
      companyRegistrationNumber: data['companyRegistrationNumber'],
      hejhomeToken: data['hejhomeToken'],
    );
  }

  @override
  Map<String, dynamic> toJsonForCreate() {
    Map<String, dynamic> json = {
      'name': _name,
      'registrationNumber': _registrationNumber,
      'companyRegistrationNumber': _companyRegistrationNumber,
      'hejhomeToken': _hejhomeToken,
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate() {
    Map<String, dynamic> json = {
      'name': _name,
      'registrationNumber': _registrationNumber,
      'companyRegistrationNumber': _companyRegistrationNumber,
      'hejhomeToken': _hejhomeToken,
    };

    return json;
  }

  @override
  List<String> toRow() {
    return [
      _id.toString(),
      _name,
      _registrationNumber ?? "없음",
      _companyRegistrationNumber ?? "없음",
      _hejhomeToken ?? "없음",
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
  void setMemberByText(String member, String text) {
    switch (member) {
      case "name":
        _name = text;
        break;
      case "registrationNumber":
        _registrationNumber = (text == "") ? null : text;
        break;
      case "companyRegistrationNumber":
        _companyRegistrationNumber = (text == "") ? null : _name;
        break;
      case "hejhomeToken":
        _hejhomeToken = (text == "") ? null : text;
        break;

      default:
    }
  }

  @override
  void setMemberById(String member, int id) {
    switch (member) {
      default:
    }
  }
}
