import 'package:clean_arch/common/constants/enum/business_type.dart';
import 'package:clean_arch/common/constants/enum/contract_type.dart';
import 'package:clean_arch/common/constants/enum/customer_member_status.dart';
import 'package:clean_arch/common/constants/enum/customer_member_type.dart';
import 'package:clean_arch/common/constants/enum/customer_status.dart';
import 'package:clean_arch/common/constants/enum/employee_type.dart';
import 'package:clean_arch/common/constants/enum/job.dart';
import 'package:clean_arch/common/constants/enum/office_type.dart';
import 'package:clean_arch/common/constants/validator.dart';
import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/manager.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:clean_arch/model/impl/service_provider.dart';
import 'package:clean_arch/view/widget/table/table_search/table_calendar.dart';
import 'package:clean_arch/view/widget/table/table_search/table_cu_dialog.dart';
import 'package:clean_arch/view/widget/table/table_search/table_radiobox.dart';
import 'package:clean_arch/view/widget/table/table_search/table_rangebox.dart';
import 'package:clean_arch/view/widget/table/table_search/table_search_bar.dart';
import 'package:clean_arch/view/widget/table/table_search/table_search_child.dart';
import 'package:flutter/widgets.dart';

List<SearchChild> contractSearchChildList = [
  SearchChild(
    columnName: "입주사ID",
    child: TableSearchBar<Contract>(
      memberName: "customerId",
    ),
  ),
  SearchChild(
    columnName: "계약담당자ID",
    child: TableSearchBar<Contract>(
      memberName: "contractRepId",
    ),
  ),
  SearchChild(
    columnName: "알림담당자ID",
    child: TableSearchBar<Contract>(
      memberName: "contactRepId",
    ),
  ),
  SearchChild(
    columnName: "보증금",
    child: TableRangeBox<Contract>(
      startMemberName: "deposit",
      endMemberName: "deposit",
    ),
  ),
  SearchChild(
    columnName: "대여비",
    child: TableRangeBox<Contract>(
      startMemberName: "rent",
      endMemberName: "rent",
    ),
  ),
  SearchChild(
    columnName: "계약일시",
    child: TableCalendar<Contract>(
      startMemberName: "contractDatetime",
      endMemberName: "contractDatetime",
    ),
  ),
  SearchChild(
    columnName: "시작&종료 일시",
    child: TableCalendar<Contract>(
      startMemberName: "startDatetime",
      endMemberName: "endDatetime",
    ),
  ),
  SearchChild(
    columnName: "계약 상태",
    child: const TableRadioBox<Contract>(
      memberName: "type",
      enumList: ContractType.values,
    ),
  ),
  SearchChild(
    columnName: "설명",
    child: TableSearchBar<Contract>(
      memberName: "description",
    ),
  ),
];
List<SearchChild> officeSearchChildList = [
  SearchChild(
    columnName: "호실",
    child: TableSearchBar<Office>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "지점ID",
    child: TableSearchBar<Office>(
      memberName: "officeBranchId",
    ),
  ),
  SearchChild(
    columnName: "정원",
    child: TableSearchBar<Office>(
      memberName: "capacity",
    ),
  ),
  SearchChild(
    columnName: "사무실 형태",
    child: const TableRadioBox<Office>(
      memberName: "type",
      enumList: OfficeType.values,
    ),
  ),
  SearchChild(
    columnName: "설명",
    child: TableSearchBar<Office>(
      memberName: "description",
    ),
  ),
];
List<SearchChild> customerSearchChildList = [
  SearchChild(
    columnName: "이름",
    child: TableSearchBar<Customer>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "사업자형태",
    child: TableRadioBox<Customer>(
      enumList: BusinessType.values,
      memberName: "type",
    ),
  ),
  SearchChild(
    columnName: "법인등록번호",
    child: TableSearchBar<Customer>(
      memberName: "registrationNumber",
    ),
  ),
  SearchChild(
    columnName: "회사등록번호",
    child: TableSearchBar<Customer>(
      memberName: "companyRegistrationNumber",
    ),
  ),
  SearchChild(
    columnName: "고객상태",
    child: const TableRadioBox<Customer>(
      memberName: "status",
      enumList: CustomerStatus.values,
    ),
  ),
  SearchChild(
    columnName: "설명",
    child: TableSearchBar<Customer>(
      memberName: "description",
    ),
  ),
];
List<SearchChild> customerMemberSearchChildList = [
  SearchChild(
    columnName: "입주사ID",
    child: TableSearchBar<CustomerMember>(
      memberName: "customerId",
      validator: idSearchValidator,
    ),
  ),
  SearchChild(
    columnName: "이름",
    child: TableSearchBar<CustomerMember>(
      memberName: "name",
      validator: stringValidor,
    ),
  ),
  SearchChild(
    columnName: "이메일",
    child: TableSearchBar<CustomerMember>(
      memberName: "email",
    ),
  ),
  SearchChild(
    columnName: "휴대번호",
    child: TableSearchBar<CustomerMember>(
      memberName: "phoneNumber",
    ),
  ),
  SearchChild(
    columnName: "고객상태",
    child: const TableRadioBox<CustomerMember>(
      memberName: "status",
      enumList: CustomerMemberStatus.values,
    ),
  ),
  SearchChild(
    columnName: "입주형태",
    child: const TableRadioBox<CustomerMember>(
      enumList: CustomerMemberType.values,
      memberName: "type",
    ),
  ),
  SearchChild(
    columnName: "설명",
    child: TableSearchBar<CustomerMember>(
      memberName: "description",
    ),
  ),
];
List<SearchChild> officeBranchSearchChildList = [
  SearchChild(
    columnName: "지점명",
    child: TableSearchBar<OfficeBranch>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "운영사ID",
    child: TableSearchBar<OfficeBranch>(
      memberName: "serviceProviderId",
    ),
  ),
  SearchChild(
    columnName: "위치",
    child: TableSearchBar<OfficeBranch>(
      memberName: "location",
    ),
  ),
];
List<SearchChild> managerSearchChildList = [
  SearchChild(
    columnName: "운영사ID",
    child: TableSearchBar<Manager>(
      memberName: "serviceProviderId",
    ),
  ),
  SearchChild(
    columnName: "이름",
    child: TableSearchBar<Manager>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "고용형태",
    child: TableRadioBox<Manager>(
      enumList: EmployeeType.values,
      memberName: "employeeType",
    ),
  ),
  SearchChild(
    columnName: "계약기간",
    child: TableCalendar<Manager>(
      startMemberName: "effectiveDate",
      endMemberName: "expireDate",
    ),
  ),
  SearchChild(
    columnName: "휴대번호",
    child: TableSearchBar<Manager>(
      memberName: "phoneNumber",
    ),
  ),
  SearchChild(
    columnName: "이메일",
    child: TableSearchBar<Manager>(
      memberName: "email",
    ),
  ),
  SearchChild(
    columnName: "직업",
    child: TableRadioBox<Manager>(
      enumList: Job.values,
      memberName: "job",
    ),
  ),
];
List<SearchChild> serviceProviderSearchChildList = [
  SearchChild(
    columnName: "운영사 이름",
    child: TableSearchBar<ServiceProvider>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "법인등록번호",
    child: TableSearchBar<ServiceProvider>(
      memberName: "registrationNumber",
    ),
  ),
  SearchChild(
    columnName: "사업자등록번호",
    child: TableSearchBar<ServiceProvider>(
      memberName: "companyRegistrationNumber",
    ),
  ),
  SearchChild(
    columnName: "헤이홈토큰",
    child: TableSearchBar<ServiceProvider>(
      memberName: "hejhomeToken",
    ),
  ),
];
List<SearchChild> sensorSearchChildList = [
  SearchChild(
    columnName: "운영사 이름",
    child: TableSearchBar<ServiceProvider>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "법인등록번호",
    child: TableSearchBar<ServiceProvider>(
      memberName: "registrationNumber",
    ),
  ),
  SearchChild(
    columnName: "사업자등록번호",
    child: TableSearchBar<ServiceProvider>(
      memberName: "companyRegistrationNumber",
    ),
  ),
  SearchChild(
    columnName: "헤이홈토큰",
    child: TableSearchBar<ServiceProvider>(
      memberName: "hejhomeToken",
    ),
  ),
];
List<SearchChild> gateCredentialSearchChildList = [
  SearchChild(
    columnName: "운영사 이름",
    child: TableSearchBar<ServiceProvider>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "법인등록번호",
    child: TableSearchBar<ServiceProvider>(
      memberName: "registrationNumber",
    ),
  ),
  SearchChild(
    columnName: "사업자등록번호",
    child: TableSearchBar<ServiceProvider>(
      memberName: "companyRegistrationNumber",
    ),
  ),
  SearchChild(
    columnName: "헤이홈토큰",
    child: TableSearchBar<ServiceProvider>(
      memberName: "hejhomeToken",
    ),
  ),
];
List<SearchChild> gateSearchChildList = [
  SearchChild(
    columnName: "운영사 이름",
    child: TableSearchBar<ServiceProvider>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "법인등록번호",
    child: TableSearchBar<ServiceProvider>(
      memberName: "registrationNumber",
    ),
  ),
  SearchChild(
    columnName: "사업자등록번호",
    child: TableSearchBar<ServiceProvider>(
      memberName: "companyRegistrationNumber",
    ),
  ),
  SearchChild(
    columnName: "헤이홈토큰",
    child: TableSearchBar<ServiceProvider>(
      memberName: "hejhomeToken",
    ),
  ),
];
List<SearchChild> sensorValueSearchChildList = [
  SearchChild(
    columnName: "운영사 이름",
    child: TableSearchBar<ServiceProvider>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "법인등록번호",
    child: TableSearchBar<ServiceProvider>(
      memberName: "registrationNumber",
    ),
  ),
  SearchChild(
    columnName: "사업자등록번호",
    child: TableSearchBar<ServiceProvider>(
      memberName: "companyRegistrationNumber",
    ),
  ),
  SearchChild(
    columnName: "헤이홈토큰",
    child: TableSearchBar<ServiceProvider>(
      memberName: "hejhomeToken",
    ),
  ),
];
Map<String, List<SearchChild>> searchChildMapper = {
  "Contract": contractSearchChildList,
  "Office": officeSearchChildList,
  "Customer": customerSearchChildList,
  "OfficeBranch": officeBranchSearchChildList,
  "Manager": managerSearchChildList,
  "CustomerMember": customerMemberSearchChildList,
  "ServiceProvider": serviceProviderSearchChildList,
  "TaxBill": serviceProviderSearchChildList,
  "Sensor": sensorSearchChildList,
  "SensorValue": sensorValueSearchChildList,
  "GateCredential": gateCredentialSearchChildList,
  "Gate": gateSearchChildList
};
