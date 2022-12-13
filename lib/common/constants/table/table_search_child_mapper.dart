import 'package:clean_arch/common/constants/enum/business_type.dart';
import 'package:clean_arch/common/constants/enum/contract_type.dart';
import 'package:clean_arch/common/constants/enum/customer_member_status.dart';
import 'package:clean_arch/common/constants/enum/customer_member_type.dart';
import 'package:clean_arch/common/constants/enum/customer_status.dart';
import 'package:clean_arch/common/constants/enum/employee_type.dart';
import 'package:clean_arch/common/constants/enum/job.dart';
import 'package:clean_arch/common/constants/enum/office_type.dart';
import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/manager.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:clean_arch/model/impl/service_provider.dart';
import 'package:clean_arch/view/widget/table/base_table_search/base_table_calendar.dart';
import 'package:clean_arch/view/widget/table/base_table_search/base_table_radiobox.dart';
import 'package:clean_arch/view/widget/table/base_table_search/base_table_rangebox.dart';
import 'package:clean_arch/view/widget/table/base_table_search/base_table_search_bar.dart';
import 'package:clean_arch/view/widget/table/base_table_search/base_table_search_child.dart';

List<SearchChild> contractSearchChildList = [
  SearchChild(
    columnName: "입주사ID",
    child: BaseTableSearchBar<Contract>(
      memberName: "customerId",
    ),
  ),
  SearchChild(
    columnName: "계약담당자ID",
    child: BaseTableSearchBar<Contract>(
      memberName: "contractRepId",
    ),
  ),
  SearchChild(
    columnName: "알림담당자ID",
    child: BaseTableSearchBar<Contract>(
      memberName: "contactRepId",
    ),
  ),
  SearchChild(
    columnName: "보증금",
    child: BaseTableRangeBox<Contract>(
      startMemberName: "deposit",
      endMemberName: "deposit",
    ),
  ),
  SearchChild(
    columnName: "대여비",
    child: BaseTableRangeBox<Contract>(
      startMemberName: "rent",
      endMemberName: "rent",
    ),
  ),
  SearchChild(
    columnName: "계약일시",
    child: BaseTableCalendar<Contract>(
      startMemberName: "contractDatetime",
      endMemberName: "contractDatetime",
    ),
  ),
  SearchChild(
    columnName: "시작&종료 일시",
    child: BaseTableCalendar<Contract>(
      startMemberName: "startDatetime",
      endMemberName: "endDatetime",
    ),
  ),
  SearchChild(
    columnName: "계약 상태",
    child: const BaseTableRadioBox<Contract>(
      memberName: "type",
      enumList: ContractType.values,
    ),
  ),
  SearchChild(
    columnName: "설명",
    child: BaseTableSearchBar<Contract>(
      memberName: "description",
    ),
  ),
];
List<SearchChild> officeSearchChildList = [
  SearchChild(
    columnName: "호실",
    child: BaseTableSearchBar<Office>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "지점ID",
    child: BaseTableSearchBar<Office>(
      memberName: "officeBranchId",
    ),
  ),
  SearchChild(
    columnName: "정원",
    child: BaseTableSearchBar<Office>(
      memberName: "capacity",
    ),
  ),
  SearchChild(
    columnName: "사무실 형태",
    child: const BaseTableRadioBox<Office>(
      memberName: "type",
      enumList: OfficeType.values,
    ),
  ),
  SearchChild(
    columnName: "설명",
    child: BaseTableSearchBar<Office>(
      memberName: "description",
    ),
  ),
];
List<SearchChild> customerSearchChildList = [
  SearchChild(
    columnName: "이름",
    child: BaseTableSearchBar<Customer>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "사업자형태",
    child: BaseTableRadioBox<Customer>(
      enumList: BusinessType.values,
      memberName: "type",
    ),
  ),
  SearchChild(
    columnName: "법인등록번호",
    child: BaseTableSearchBar<Customer>(
      memberName: "registrationNumber",
    ),
  ),
  SearchChild(
    columnName: "회사등록번호",
    child: BaseTableSearchBar<Customer>(
      memberName: "companyRegistrationNumber",
    ),
  ),
  SearchChild(
    columnName: "고객상태",
    child: const BaseTableRadioBox<Customer>(
      memberName: "status",
      enumList: CustomerStatus.values,
    ),
  ),
  SearchChild(
    columnName: "설명",
    child: BaseTableSearchBar<Customer>(
      memberName: "description",
    ),
  ),
];
List<SearchChild> customerMemberSearchChildList = [
  SearchChild(
    columnName: "입주사ID",
    child: BaseTableSearchBar<CustomerMember>(
      memberName: "customerId",
    ),
  ),
  SearchChild(
    columnName: "이름",
    child: BaseTableSearchBar<CustomerMember>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "이메일",
    child: BaseTableSearchBar<CustomerMember>(
      memberName: "email",
    ),
  ),
  SearchChild(
    columnName: "휴대번호",
    child: BaseTableSearchBar<CustomerMember>(
      memberName: "phoneNumber",
    ),
  ),
  SearchChild(
    columnName: "고객상태",
    child: const BaseTableRadioBox<CustomerMember>(
      memberName: "status",
      enumList: CustomerMemberStatus.values,
    ),
  ),
  SearchChild(
    columnName: "입주형태",
    child: const BaseTableRadioBox<CustomerMember>(
      enumList: CustomerMemberType.values,
      memberName: "type",
    ),
  ),
  SearchChild(
    columnName: "설명",
    child: BaseTableSearchBar<CustomerMember>(
      memberName: "description",
    ),
  ),
];
List<SearchChild> officeBranchSearchChildList = [
  SearchChild(
    columnName: "지점명",
    child: BaseTableSearchBar<OfficeBranch>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "운영사ID",
    child: BaseTableSearchBar<OfficeBranch>(
      memberName: "serviceProviderId",
    ),
  ),
  SearchChild(
    columnName: "위치",
    child: BaseTableSearchBar<OfficeBranch>(
      memberName: "location",
    ),
  ),
];
List<SearchChild> managerSearchChildList = [
  SearchChild(
    columnName: "운영사ID",
    child: BaseTableSearchBar<Manager>(
      memberName: "serviceProviderId",
    ),
  ),
  SearchChild(
    columnName: "이름",
    child: BaseTableSearchBar<Manager>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "고용형태",
    child: BaseTableRadioBox<Manager>(
      enumList: EmployeeType.values,
      memberName: "employeeType",
    ),
  ),
  SearchChild(
    columnName: "계약기간",
    child: BaseTableCalendar<Manager>(
      startMemberName: "effectiveDate",
      endMemberName: "expireDate",
    ),
  ),
  SearchChild(
    columnName: "휴대번호",
    child: BaseTableSearchBar<Manager>(
      memberName: "phoneNumber",
    ),
  ),
  SearchChild(
    columnName: "이메일",
    child: BaseTableSearchBar<Manager>(
      memberName: "email",
    ),
  ),
  SearchChild(
    columnName: "직업",
    child: BaseTableRadioBox<Manager>(
      enumList: Job.values,
      memberName: "job",
    ),
  ),
];
List<SearchChild> serviceProviderSearchChildList = [
  SearchChild(
    columnName: "운영사 이름",
    child: BaseTableSearchBar<ServiceProvider>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "법인등록번호",
    child: BaseTableSearchBar<ServiceProvider>(
      memberName: "registrationNumber",
    ),
  ),
  SearchChild(
    columnName: "사업자등록번호",
    child: BaseTableSearchBar<ServiceProvider>(
      memberName: "companyRegistrationNumber",
    ),
  ),
  SearchChild(
    columnName: "헤이홈토큰",
    child: BaseTableSearchBar<ServiceProvider>(
      memberName: "hejhomeToken",
    ),
  ),
];
List<SearchChild> sensorSearchChildList = [
  SearchChild(
    columnName: "운영사 이름",
    child: BaseTableSearchBar<ServiceProvider>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "법인등록번호",
    child: BaseTableSearchBar<ServiceProvider>(
      memberName: "registrationNumber",
    ),
  ),
  SearchChild(
    columnName: "사업자등록번호",
    child: BaseTableSearchBar<ServiceProvider>(
      memberName: "companyRegistrationNumber",
    ),
  ),
  SearchChild(
    columnName: "헤이홈토큰",
    child: BaseTableSearchBar<ServiceProvider>(
      memberName: "hejhomeToken",
    ),
  ),
];

List<SearchChild> gateCredentialSearchChildList = [
  SearchChild(
    columnName: "운영사 이름",
    child: BaseTableSearchBar<ServiceProvider>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "법인등록번호",
    child: BaseTableSearchBar<ServiceProvider>(
      memberName: "registrationNumber",
    ),
  ),
  SearchChild(
    columnName: "사업자등록번호",
    child: BaseTableSearchBar<ServiceProvider>(
      memberName: "companyRegistrationNumber",
    ),
  ),
  SearchChild(
    columnName: "헤이홈토큰",
    child: BaseTableSearchBar<ServiceProvider>(
      memberName: "hejhomeToken",
    ),
  ),
];

List<SearchChild> gateSearchChildList = [
  SearchChild(
    columnName: "운영사 이름",
    child: BaseTableSearchBar<ServiceProvider>(
      memberName: "name",
    ),
  ),
  SearchChild(
    columnName: "법인등록번호",
    child: BaseTableSearchBar<ServiceProvider>(
      memberName: "registrationNumber",
    ),
  ),
  SearchChild(
    columnName: "사업자등록번호",
    child: BaseTableSearchBar<ServiceProvider>(
      memberName: "companyRegistrationNumber",
    ),
  ),
  SearchChild(
    columnName: "헤이홈토큰",
    child: BaseTableSearchBar<ServiceProvider>(
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
  "GateCredential": gateCredentialSearchChildList,
  "Gate": gateSearchChildList
};
