import 'package:clean_arch/common/constants/enum/employee_type.dart';
import 'package:clean_arch/common/constants/enum/job.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/sub_model/service_provider.dart';
import 'package:intl/intl.dart';

class Manager implements Base {
  int _id;
  String _name;
  EmployeeType _employeeType;
  DateTime? _expireDate;
  DateTime? _effectiveDate;
  String? _phoneNumber;
  String? _email;
  Job _job;
  ServiceProviderSub _serviceProvider;
  Manager({
    required int id,
    required String name,
    required EmployeeType employeeType,
    DateTime? expireDate,
    DateTime? effectiveDate,
    String? phoneNumber,
    String? email,
    required Job job,
    required ServiceProviderSub serviceProvider,
  })  : _id = id,
        _serviceProvider = serviceProvider,
        _name = name,
        _employeeType = employeeType,
        _expireDate = expireDate,
        _effectiveDate = effectiveDate,
        _phoneNumber = phoneNumber,
        _email = email,
        _job = job;

  factory Manager.fromJson(Map<String, dynamic> data) {
    return Manager(
      id: data['id'],
      name: data['name'],
      employeeType: EmployeeType.values.byName(data['employeeType']),
      expireDate: data['expireDate'] == null
          ? null
          : DateTime.tryParse(data['expireDate']),
      effectiveDate: data['effectiveDate'] == null
          ? null
          : DateTime.tryParse(data['effectiveDate']),
      phoneNumber: data['phoneNumber'],
      email: data['email'],
      job: Job.values.byName(data['job']),
      serviceProvider: ServiceProviderSub.fromJson(data['serviceProvider']),
    );
  }

  @override
  Map<String, dynamic> toJsonForCreate() {
    Map<String, dynamic> json = {
      'name': _name,
      'employeeType': _employeeType.name,
      'expireDate': _expireDate == null
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(_expireDate!),
      'effectiveDate': _effectiveDate == null
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(_effectiveDate!),
      'phoneNumber': _phoneNumber,
      'email': _email,
      'job': _job.name,
      'serviceProviderId': _serviceProvider.id,
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate() {
    Map<String, dynamic> json = {
      'name': _name,
      'employeeType': _employeeType.name,
      'expireDate': _expireDate == null
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(_expireDate!),
      'effectiveDate': _effectiveDate == null
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(_effectiveDate!),
      'phoneNumber': _phoneNumber,
      'email': _email,
      'job': _job.name,
      'serviceProviderId': _serviceProvider.id,
    };

    return json;
  }

  @override
  List<String> toRow() {
    return [
      _id.toString(),
      _serviceProvider.name,
      _name,
      _employeeType.toString(),
      _effectiveDate == null
          ? "없음"
          : DateFormat('yyyy-MM-dd').format(_effectiveDate!),
      _expireDate == null
          ? "없음"
          : DateFormat('yyyy-MM-dd').format(_expireDate!),
      _phoneNumber ?? "없음",
      _email ?? "없음",
      _job.toString(),
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
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
  void setMemberByText(String member, String text) {
    switch (member) {
      // case "serviceProviderName":
      //   _serviceProvider.name = text;
      //   break;
      case "name":
        _name = text;
        break;
      case "employeeType":
        _employeeType = EmployeeType.fromString(text);
        break;
      case "expireDate":
        _expireDate = (text == "") ? null : DateTime.parse(text);
        break;
      case "effectiveDate":
        _effectiveDate = (text == "") ? null : DateTime.parse(text);
        break;
      case "phoneNumber":
        _phoneNumber = (text == "") ? null : text;
        break;
      case "email":
        _email = (text == "") ? null : text;
        break;
      case "job":
        _job = Job.fromString(text);
        break;
      default:
    }
  }

  @override
  void setMemberById(String member, int value) {
    switch (member) {
      case "serviceProviderId":
        _serviceProvider.id = value;
        break;
      default:
    }
  }
}
