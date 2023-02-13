import 'package:clean_arch/common/constants/enum/customer_member_status.dart';
import 'package:clean_arch/common/constants/enum/customer_member_type.dart';

class CustomerMemberSub {
  int id;
  String name;
  String email;
  String phoneNumber;
  CustomerMemberStatus? status;
  CustomerMemberType? type;
  String description;

  CustomerMemberSub(
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

  factory CustomerMemberSub.fromJson(Map<String, dynamic> data) {
    return CustomerMemberSub(
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
