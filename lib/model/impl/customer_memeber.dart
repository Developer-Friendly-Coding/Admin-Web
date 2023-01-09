import 'package:clean_arch/common/constants/enum/business_type.dart';
import 'package:clean_arch/common/constants/enum/customer_member_status.dart';
import 'package:clean_arch/common/constants/enum/customer_member_type.dart';
import 'package:clean_arch/common/constants/enum/customer_status.dart';
import 'package:clean_arch/model/base_model.dart';

class CustomerMember implements Base {
  int _id;
  String? _name;
  String? _email;
  String? _phoneNumber;
  CustomerMemberStatus? _status;
  CustomerMemberType? _type;
  String? _description;
  CustomerInCustomerMember _customer;
  CustomerMember({
    int id = -1,
    String? name,
    String? email,
    String? phoneNumber,
    CustomerMemberStatus? status,
    CustomerMemberType? type,
    String? description,
    CustomerInCustomerMember? customer,
  })  : _id = id,
        _name = name,
        _email = email,
        _phoneNumber = phoneNumber,
        _status = status,
        _type = type,
        _description = description,
        _customer = customer ?? CustomerInCustomerMember();
  @override
  CustomerMember getDummy() {
    return CustomerMember();
  }

  @override
  CustomerMember fromJson(Map<String, dynamic> data) {
    return CustomerMember(
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
        customer: CustomerInCustomerMember.fromJson(data['customer']));
  }

  @override
  Map<String, dynamic> toJsonForCreate(CustomerMember customerMember) {
    CustomerMemberStatus status = customerMember.getMember("status");
    CustomerMemberType type = customerMember.getMember("type");
    Map<String, dynamic> json = {
      'name': customerMember.getMember("name"),
      'email': customerMember.getMember("email"),
      'phoneNumber': customerMember.getMember("phoneNumber"),
      'status': status.name,
      'type': type.name,
      'description': customerMember.getMember("description"),
      'customerId': customerMember.getMember("customerId"),
    };
    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate(CustomerMember customerMember) {
    CustomerMemberStatus status = customerMember.getMember("status");
    CustomerMemberType type = customerMember.getMember("type");
    Map<String, dynamic> json = {
      'name': customerMember.getMember("name"),
      'email': customerMember.getMember("email"),
      'phoneNumber': customerMember.getMember("phoneNumber"),
      'status': status.name,
      'type': type.name,
      'description': customerMember.getMember("description"),
      'customerId': customerMember.getMember("customerId"),
    };
    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _customer.name,
      _name.toString(),
      _email.toString(),
      _phoneNumber.toString(),
      _status.toString(),
      _type.toString(),
      _description.toString()
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "name":
        return _name;
      case "email":
        return _email;
      case "phoneNumber":
        return _phoneNumber;
      case "status":
        return _status;
      case "type":
        return _type;
      case "description":
        return _description;
      case "customer":
        return _customer;
      case "customerId":
        return _customer.id;
      case "customerName":
        return _customer.name;
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
      case "email":
        _email = value;
        break;
      case "phoneNumber":
        _phoneNumber = value;
        break;
      case "status":
        _status = CustomerMemberStatus.fromString(value);
        break;
      case "type":
        _type = CustomerMemberType.fromString(value);
        break;
      case "description":
        _description = value;
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
      default:
    }
  }
}

class CustomerInCustomerMember {
  int id;
  String name;
  BusinessType? type;
  String registrationNumber;
  String companyRegistrationNumber;
  CustomerStatus? status;
  String description;

  CustomerInCustomerMember({
    int id = -1,
    String name = "",
    BusinessType? type,
    String registrationNumber = "",
    String companyRegistrationNumber = "",
    CustomerStatus? status,
    String description = "",
  })  : id = id,
        name = name,
        type = type,
        registrationNumber = registrationNumber,
        companyRegistrationNumber = companyRegistrationNumber,
        status = status,
        description = description;

  factory CustomerInCustomerMember.fromJson(Map<String, dynamic> data) {
    return CustomerInCustomerMember(
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
