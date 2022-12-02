import 'package:clean_arch/common/constants/enum/contract_type.dart';
import 'package:clean_arch/common/constants/enum/employee_type.dart';
import 'package:clean_arch/common/constants/enum/job.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Manager implements Base {
  final int _id;
  final int _serviceProviderId;
  final String _name;
  final EmployeeType? _employeeType;
  final DateTime? _expireDate;
  final DateTime? _effectiveDate;
  final String? _phoneNumber;
  final String? _email;
  final Job? _job;

  Manager({
    int id = -1,
    int serviceProviderId = -1,
    String name = "",
    EmployeeType? employeeType,
    DateTime? expireDate,
    DateTime? effectiveDate,
    String? phoneNumber,
    String? email,
    Job? job,
  })  : _id = id,
        _serviceProviderId = serviceProviderId,
        _name = name,
        _employeeType = employeeType,
        _expireDate = expireDate,
        _effectiveDate = effectiveDate,
        _phoneNumber = phoneNumber,
        _email = email,
        _job = job;

  @override
  Manager fromJson(Map<String, dynamic> data) {
    return Manager(
      id: data['id'],
      serviceProviderId: data['serviceProviderId'],
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
    );
  }

  @override
  Manager fromTEC(List<TextEditingController> list) {
    return Manager(
      id: list[0].text == "" ? -1 : int.parse(list[0].text),
      serviceProviderId: int.parse(list[1].text),
      name: list[2].text,
      employeeType:
          list[3].text == "" ? null : EmployeeType.fromString(list[3].text),
      expireDate: list[4].text == "" ? null : DateTime.parse(list[4].text),
      effectiveDate: list[5].text == "" ? null : DateTime.parse(list[5].text),
      phoneNumber: list[6].text == "" ? null : list[6].text,
      email: list[7].text == "" ? null : list[7].text,
      job: list[8].text == "" ? null : Job.fromString(list[8].text),
    );
  }

  @override
  Map<String, dynamic> toJson(Manager manager) {
    Map<String, dynamic> json = {
      'servicProviderId': manager._serviceProviderId,
      'name': manager._name,
      'employeeType': manager._employeeType?.name,
      'expireDate': (manager._expireDate == null)
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(manager._expireDate!),
      // manager._expireDate?.toString(),
      'effectiveDate': (manager._effectiveDate == null)
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(manager._effectiveDate!),
      'phoneNumber': manager._phoneNumber,
      'email': manager._email,
      'job': manager._job?.name,
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _serviceProviderId.toString(),
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
  int getId() {
    return _id;
  }
}
