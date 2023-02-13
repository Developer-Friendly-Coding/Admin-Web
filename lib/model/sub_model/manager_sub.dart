import 'package:clean_arch/common/constants/enum/employee_type.dart';
import 'package:clean_arch/common/constants/enum/job.dart';

class ManagerSub {
  int id;
  String name;
  EmployeeType? employeeType;
  DateTime? expireDate;
  DateTime? effectiveDate;
  String? phoneNumber;
  String? email;
  Job? job;

  ManagerSub({
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

  factory ManagerSub.fromJson(Map<String, dynamic> data) {
    return ManagerSub(
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
