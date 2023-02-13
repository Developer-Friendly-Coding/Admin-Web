import 'package:clean_arch/common/constants/enum/business_type.dart';
import 'package:clean_arch/common/constants/enum/customer_status.dart';

class CustomerSub {
  int id;
  String name;
  BusinessType? type;
  String registrationNumber;
  String companyRegistrationNumber;
  CustomerStatus? status;
  String description;

  CustomerSub(
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

  factory CustomerSub.fromJson(Map<String, dynamic> data) {
    return CustomerSub(
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
