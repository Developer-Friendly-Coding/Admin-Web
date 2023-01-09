import 'package:clean_arch/common/constants/enum/business_type.dart';
import 'package:clean_arch/common/constants/enum/contract_type.dart';
import 'package:clean_arch/common/constants/enum/customer_member_status.dart';
import 'package:clean_arch/common/constants/enum/customer_member_type.dart';
import 'package:clean_arch/common/constants/enum/customer_status.dart';
import 'package:clean_arch/common/constants/enum/employee_type.dart';
import 'package:clean_arch/common/constants/enum/job.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Contract implements Base {
  int _id;
  double? _deposit;
  double? _rent;
  String? _description;
  DateTime? _contractDatetime;
  DateTime? _startDatetime;
  DateTime? _endDatetime;
  CustomerMemberInContract _contractRep;
  CustomerMemberInContract _contactRep;
  CustomerInContract _customer;
  ManagerInContract _manager;
  ContractType? _type;

  Contract(
      {int id = -1,
      double? deposit,
      double? rent,
      String? description,
      DateTime? contractDatetime,
      DateTime? startDatetime,
      DateTime? endDatetime,
      CustomerMemberInContract? contractRep,
      CustomerMemberInContract? contactRep,
      CustomerInContract? customer,
      ManagerInContract? manager,
      ContractType? type})
      : _id = id,
        _deposit = deposit,
        _rent = rent,
        _description = description,
        _contractDatetime = contractDatetime,
        _startDatetime = startDatetime,
        _endDatetime = endDatetime,
        _contractRep = contractRep ?? CustomerMemberInContract(),
        _contactRep = contactRep ?? CustomerMemberInContract(),
        _customer = customer ?? CustomerInContract(),
        _manager = manager ?? ManagerInContract(),
        _type = type;
  @override
  Contract getDummy() {
    return Contract();
  }

  @override
  Contract fromJson(Map<String, dynamic> data) {
    return Contract(
        id: data['id'],
        deposit: data['deposit'],
        rent: data['rent'],
        description: data['description'],
        contractDatetime: data['contractDatetime'] == null
            ? null
            : DateTime.parse(data['contractDatetime']),
        startDatetime: data['startDatetime'] == null
            ? null
            : DateTime.parse(data['startDatetime']),
        endDatetime: data['endDatetime'] == null
            ? null
            : DateTime.parse(data['endDatetime']),
        contractRep: CustomerMemberInContract.fromJson(data['contractRep']),
        contactRep: CustomerMemberInContract.fromJson(
          data['contactRep'],
        ),
        customer: CustomerInContract.fromJson(data['customer']),
        manager: ManagerInContract.fromJson(data['manager']),
        type: data['type'] == null
            ? null
            : ContractType.values.byName(data['type']));
  }

  @override
  Map<String, dynamic> toJsonForCreate(Contract contract) {
    ContractType type = contract.getMember("type");

    Map<String, dynamic> json = {
      'deposit': contract.getMember("deposit"),
      'rent': contract.getMember("rent"),
      'description': contract.getMember("description"),
      'contractDatetime': DateFormat("yyyy-MM-dd hh:mm:ss")
          .format(contract.getMember("contractDatetime")),
      'startDatetime': DateFormat("yyyy-MM-dd hh:mm:ss")
          .format(contract.getMember("startDatetime")),
      'endDatetime': DateFormat("yyyy-MM-dd hh:mm:ss")
          .format(contract.getMember("endDatetime")),
      'contractRepId': contract.getMember("contractRepId"),
      'contactRepId': contract.getMember("contactRepId"),
      'customerId': contract.getMember("customerId"),
      'managerId': contract.getMember("managerId"),
      'type': type.name,
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate(Contract contract) {
    ContractType type = contract.getMember("type");
    Map<String, dynamic> json = {
      'deposit': contract.getMember("deposit"),
      'rent': contract.getMember("rent"),
      'description': contract.getMember("description"),
      'contractDatetime': DateFormat("yyyy-MM-dd hh:mm:ss")
          .format(contract.getMember("contractDatetime")),
      'startDatetime': DateFormat("yyyy-MM-dd hh:mm:ss")
          .format(contract.getMember("startDatetime")),
      'endDatetime': DateFormat("yyyy-MM-dd hh:mm:ss")
          .format(contract.getMember("endDatetime")),
      'contractRepId': contract.getMember("contractRepId"),
      'contactRepId': contract.getMember("contactRepId"),
      'type': type.name,
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _customer.name,
      _deposit.toString(),
      _rent.toString(),
      _contractRep.name,
      _contactRep.name,
      _manager.name,
      _contractDatetime == null
          ? null.toString()
          : DateFormat('yyyy-MM-dd').format(_contractDatetime!),
      _startDatetime == null
          ? null.toString()
          : DateFormat('yyyy-MM-dd').format(_startDatetime!),
      _endDatetime == null
          ? null.toString()
          : DateFormat('yyyy-MM-dd').format(_endDatetime!),
      _type.toString(),
      _description.toString()
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "deposit":
        return _deposit;
      case "rent":
        return _rent;
      case "description":
        return _description;
      case "contractDatetime":
        return _contractDatetime;
      case "startDatetime":
        return _startDatetime;
      case "endDatetime":
        return _endDatetime;
      case "contractRep":
        return _contractRep;
      case "contractRepId":
        return _contractRep.id;
      case "contractRepName":
        return _contractRep.name;
      case "contactRep":
        return _contactRep;
      case "contactRepId":
        return _contactRep.id;
      case "contactRepName":
        return _contactRep.name;
      case "customer":
        return _customer;
      case "customerId":
        return _customer.id;
      case "customerName":
        return _customer.name;
      case "manager":
        return _manager;
      case "managerId":
        return _manager.id;
      case "managerName":
        return _manager.name;
      case "type":
        return _type;

      default:
    }
  }

  void setMember(String member, dynamic value) {
    switch (member) {
      case "id":
        _id = value;
        break;
      case "deposit":
        _deposit = double.parse(value);
        break;
      case "rent":
        _rent = double.parse(value);
        break;
      case "description":
        _description = value;
        break;
      case "contractDatetime":
        _contractDatetime = DateTime.parse(value);
        break;
      case "startDatetime":
        _startDatetime = DateTime.parse(value);
        break;
      case "endDatetime":
        _endDatetime = DateTime.parse(value);
        break;
      case "contractRep":
        _contractRep = value;
        break;
      case "contractRepId":
        _contractRep.id = value;
        break;
      case "contractRepName":
        _contractRep.name = value;
        break;
      case "contactRep":
        _contactRep = value;
        break;
      case "contactRepId":
        _contactRep.id = value;
        break;
      case "contactRepName":
        _contactRep.name = value;
        break;
      case "customer":
        _customer = value;
        break;
      case "customerId":
        _customer.id = value;
        break;
      case "customerName":
        _customer.name = value;
        break;
      case "manager":
        _manager = value;
        break;
      case "managerId":
        _manager.id = value;
        break;
      case "managerName":
        _manager.name = value;
        break;
      case "type":
        _type = ContractType.fromString(value);
        break;
      default:
    }
  }
}

class CustomerMemberInContract {
  int id;
  String name;
  String email;
  String phoneNumber;
  CustomerMemberStatus? status;
  CustomerMemberType? type;
  String description;

  CustomerMemberInContract(
      {int id = -1,
      String name = "",
      String email = "",
      String phoneNumber = "",
      CustomerMemberStatus? status,
      CustomerMemberType? type,
      String description = ""})
      : id = id,
        name = name,
        email = email,
        phoneNumber = phoneNumber,
        status = status,
        type = type,
        description = description;

  factory CustomerMemberInContract.fromJson(Map<String, dynamic> data) {
    return CustomerMemberInContract(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
      status: data['status'] == null
          ? null
          : CustomerMemberStatus.values.byName(data['status']),
      type: data['type'] == null
          ? null
          : CustomerMemberType.values.byName(data['type']),
      description: data['description'],
    );
  }
}

class CustomerInContract {
  int id;
  String name;
  BusinessType? type;
  String registrationNumber;
  String companyRegistrationNumber;
  CustomerStatus? status;
  String description;

  CustomerInContract(
      {int id = -1,
      String name = "",
      BusinessType? type,
      String registrationNumber = "",
      String companyRegistrationNumber = "",
      CustomerStatus? status,
      String description = ""})
      : id = id,
        name = name,
        type = type,
        registrationNumber = registrationNumber,
        companyRegistrationNumber = companyRegistrationNumber,
        status = status,
        description = description;

  factory CustomerInContract.fromJson(Map<String, dynamic> data) {
    return CustomerInContract(
      id: data['id'],
      name: data['name'],
      type: BusinessType.values.byName(data['type']),
      registrationNumber: data['registrationNumber'],
      companyRegistrationNumber: data['companyRegistrationNumber'],
      status: CustomerStatus.values.byName(data['status']),
      description: data['description'],
    );
  }
}

class ManagerInContract {
  int id;
  String name;
  EmployeeType? employeeType;
  DateTime? expireDate;
  DateTime? effectiveDate;
  String? phoneNumber;
  String? email;
  Job? job;

  ManagerInContract({
    int id = -1,
    String name = "",
    EmployeeType? employeeType,
    DateTime? expireDate,
    DateTime? effectiveDate,
    String? phoneNumber,
    String? email,
    Job? job,
  })  : id = id,
        name = name,
        employeeType = employeeType,
        expireDate = expireDate,
        effectiveDate = effectiveDate,
        phoneNumber = phoneNumber,
        email = email,
        job = job;

  factory ManagerInContract.fromJson(Map<String, dynamic> data) {
    return ManagerInContract(
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
    );
  }
}
