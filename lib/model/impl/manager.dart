import 'package:clean_arch/common/constants/enum/contract_type.dart';
import 'package:clean_arch/common/constants/enum/employee_type.dart';
import 'package:clean_arch/common/constants/enum/job.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Manager implements Base {
  int _id;
  String _name;
  EmployeeType? _employeeType;
  DateTime? _expireDate;
  DateTime? _effectiveDate;
  String? _phoneNumber;
  String? _email;
  Job? _job;
  ServiceProviderInManager _serviceProvider;
  Manager({
    int id = -1,
    String name = "",
    EmployeeType? employeeType,
    DateTime? expireDate,
    DateTime? effectiveDate,
    String? phoneNumber,
    String? email,
    Job? job,
    ServiceProviderInManager? serviceProvider,
  })  : _id = id,
        _serviceProvider = serviceProvider ?? ServiceProviderInManager(),
        _name = name,
        _employeeType = employeeType,
        _expireDate = expireDate,
        _effectiveDate = effectiveDate,
        _phoneNumber = phoneNumber,
        _email = email,
        _job = job;
  @override
  Manager getDummy() {
    return Manager();
  }

  @override
  Manager fromJson(Map<String, dynamic> data) {
    return Manager(
      id: data['id'],
      name: data['name'],
      employeeType: data['employeeType'] == null
          ? null
          : EmployeeType.values.byName(data['employeeType']),
      expireDate: data['expireDate'] == null
          ? null
          : DateTime.parse(data['expireDate']),
      effectiveDate: data['effectiveDate'] == null
          ? null
          : DateTime.parse(data['effectiveDate']),
      phoneNumber: data['phoneNumber'],
      email: data['email'],
      job: data['job'] == null ? null : Job.values.byName(data['job']),
      serviceProvider:
          ServiceProviderInManager.fromJson(data['serviceProvider']),
    );
  }

  @override
  Map<String, dynamic> toJsonForCreate(Manager manager) {
    Map<String, dynamic> json = {
      'name': manager.getMember("name"),
      'employeeType': manager.getMember("employeeType"),
      'expireDate': manager.getMember("expireDate"),
      'effectiveDate': manager.getMember("effectiveDate"),
      'phoneNumber': manager.getMember("phoneNumber"),
      'email': manager.getMember("email"),
      'job': manager.getMember("job"),
      'serviceProviderId': manager.getMember("serviceProviderId"),
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate(Manager manager) {
    Map<String, dynamic> json = {
      'name': manager.getMember("name"),
      'employeeType': manager.getMember("employeeType"),
      'expireDate': manager.getMember("expireDate"),
      'effectiveDate': manager.getMember("effectiveDate"),
      'phoneNumber': manager.getMember("phoneNumber"),
      'email': manager.getMember("email"),
      'job': manager.getMember("job"),
      'serviceProviderId': manager.getMember("serviceProviderId"),
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _serviceProvider.name,
      _name.toString(),
      _employeeType.toString(),
      _expireDate == null
          ? null.toString()
          : DateFormat('yyyy/MM/dd').format(_expireDate!),
      _effectiveDate == null
          ? null.toString()
          : DateFormat('yyyy/MM/dd').format(_effectiveDate!),
      _phoneNumber.toString(),
      _email.toString(),
      _job.toString(),
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "serviceProvider":
        return _serviceProvider;
      case "serviceProviderId":
        return _serviceProvider.id;
      case "serviceProviderName":
        return _serviceProvider.name;
      case "name":
        return _name;
      case "employeeType":
        return _employeeType;
      case "expireDate":
        return _expireDate;
      case "effectiveDate":
        return _effectiveDate;
      case "phoneNumber":
        return _phoneNumber;
      case "email":
        return _email;
      case "job":
        return _job;

      default:
    }
  }

  @override
  void setMember(String member, dynamic value) {
    switch (member) {
      case "id":
        _id = value;
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
      case "name":
        _name = value;
        break;
      case "employeeType":
        _employeeType = value;
        break;
      case "expireDate":
        _expireDate = value;
        break;
      case "effectiveDate":
        _effectiveDate = value;
        break;
      case "phoneNumber":
        _phoneNumber = value;
        break;
      case "email":
        _email = value;
        break;
      case "job":
        _job = value;
        break;
      default:
    }
  }
}

class ServiceProviderInManager {
  int id;
  String name;
  String registrationNumber;
  String companyRegistrationNumber;
  String hejhomeToken;

  ServiceProviderInManager({
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

  factory ServiceProviderInManager.fromJson(Map<String, dynamic> data) {
    return ServiceProviderInManager(
      id: data['id'],
      name: data['name'],
      registrationNumber: data['registrationNumber'],
      companyRegistrationNumber: data['companyRegistrationNumber'],
      hejhomeToken: data['hejhomeToken'],
    );
  }
}
