import 'package:clean_arch/common/constants/enum/business_type.dart';
import 'package:clean_arch/common/constants/enum/customer_status.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/sub_model/service_provider.dart';

class Customer implements Base {
  final int _id;
  String _name;
  BusinessType _type;
  String? _registrationNumber;
  String? _companyRegistrationNumber;
  CustomerStatus _status;
  String? _description;
  ServiceProviderSub _serviceProvider;

  Customer(
      {required int id,
      required String name,
      required BusinessType type,
      String? registrationNumber,
      String? companyRegistrationNumber,
      required CustomerStatus status,
      String? description,
      required ServiceProviderSub serviceProvider})
      : _id = id,
        _name = name,
        _type = type,
        _registrationNumber = registrationNumber,
        _companyRegistrationNumber = companyRegistrationNumber,
        _status = status,
        _description = description,
        _serviceProvider = serviceProvider;

  factory Customer.fromJson(Map<String, dynamic> data) {
    return Customer(
      id: data['id'],
      name: data['name'],
      type: BusinessType.values.byName(data['type']),
      registrationNumber: data['registrationNumber'],
      companyRegistrationNumber: data['companyRegistrationNumber'],
      status: CustomerStatus.values.byName(data['status']),
      description: data['description'],
      serviceProvider: ServiceProviderSub.fromJson(data['serviceProvider']),
    );
  }

  @override
  Map<String, dynamic> toJsonForCreate() {
    Map<String, dynamic> json = {
      'name': _name,
      'type': _type.name,
      'registrationNumber': _registrationNumber,
      'companyRegistrationNumber': _companyRegistrationNumber,
      'status': _status.name,
      'description': _description,
      'serviceProviderId': _serviceProvider.id,
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate() {
    Map<String, dynamic> json = {
      'name': _name,
      'type': _type.name,
      'registrationNumber': _registrationNumber,
      'companyRegistrationNumber': _companyRegistrationNumber,
      'status': _status.name,
      'description': _description,
    };

    return json;
  }

  @override
  List<String> toRow() {
    return [
      _id.toString(),
      _name,
      _type.toString(),
      _registrationNumber ?? "없음",
      _companyRegistrationNumber ?? "없음",
      _status.toString(),
      _serviceProvider.name,
      _description ?? "없음",
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
  void setMemberByText(String member, String text) {
    switch (member) {
      case "name":
        _name = text;
        break;
      case "type":
        _type = BusinessType.fromString(text);
        break;
      case "registrationNumber":
        _registrationNumber = (text == "") ? null : text;
        break;
      case "companyRegistrationNumber":
        _companyRegistrationNumber = (text == "") ? null : text;
        break;
      case "status":
        _status = CustomerStatus.fromString(text);
        break;
      case "description":
        _description = (text == "") ? null : text;
        break;

      default:
    }
  }

  @override
  void setMemberById(String member, int id) {
    switch (member) {
      case "serviceProviderId":
        _serviceProvider.id = id;
        break;

      default:
    }
  }
}
