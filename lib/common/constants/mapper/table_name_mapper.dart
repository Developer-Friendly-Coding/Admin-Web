import 'package:clean_arch/common/constants/enum/business_type.dart';
import 'package:clean_arch/common/constants/enum/contract_status.dart';
import 'package:clean_arch/common/constants/enum/contract_type.dart';
import 'package:clean_arch/common/constants/enum/customer_member_status.dart';
import 'package:clean_arch/common/constants/enum/customer_member_type.dart';
import 'package:clean_arch/common/constants/enum/customer_status.dart';
import 'package:clean_arch/common/constants/enum/employee_type.dart';
import 'package:clean_arch/common/constants/enum/gate_credential_status.dart';
import 'package:clean_arch/common/constants/enum/gate_credential_type.dart';
import 'package:clean_arch/common/constants/enum/guide_type.dart';
import 'package:clean_arch/common/constants/enum/job.dart';
import 'package:clean_arch/common/constants/enum/measure_unit.dart';
import 'package:clean_arch/common/constants/enum/office_type.dart';
import 'package:clean_arch/common/constants/enum/sensor_type.dart';
import 'package:clean_arch/common/constants/enum/tax_bill_status.dart';
import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/event.dart';
import 'package:clean_arch/model/impl/gate.dart';
import 'package:clean_arch/model/impl/gate_credential.dart';
import 'package:clean_arch/model/impl/guide.dart';
import 'package:clean_arch/model/impl/log_message.dart';
import 'package:clean_arch/model/impl/log_operation.dart';
import 'package:clean_arch/model/impl/manager.dart';
import 'package:clean_arch/model/impl/notice.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:clean_arch/model/impl/sensor.dart';
import 'package:clean_arch/model/impl/sensor_value.dart';
import 'package:clean_arch/model/impl/service_provider.dart';
import 'package:clean_arch/model/impl/tax_bill.dart';
import 'package:clean_arch/model/sub_model/contract_sub.dart';
import 'package:clean_arch/model/sub_model/customer_member_sub.dart';
import 'package:clean_arch/model/sub_model/customer_sub.dart';
import 'package:clean_arch/model/sub_model/gate_sub.dart';
import 'package:clean_arch/model/sub_model/manager_sub.dart';
import 'package:clean_arch/model/sub_model/officeBranch_sub.dart';
import 'package:clean_arch/model/sub_model/office_sub.dart';
import 'package:clean_arch/model/sub_model/sensor_sub.dart';
import 'package:clean_arch/model/sub_model/service_provider.dart';

Map<String, String> tableNameMapper = {
  "Customer": "입주고객",
  "Contract": "계약",
  "Office": "사무실",
  "CustomerMember": "입주멤버",
  "OfficeBranch": "지점",
  "Manager": "매니저",
  "ServiceProvider": "운영사",
  "TaxBill": "세금계산서",
  "Sensor": "센서",
  "SensorValue": "센서측정값",
  "GateCredential": "출입권한",
  "Gate": "출입문",
  "LogOperation": "운영기록",
  "MessageOperation": "메세지기록",
  "Notice": "공지사항",
  "Event": "이벤트",
  "Guide": "이용가이드",
  "ContractManage": "결제관리"
};

Map<String, dynamic> modelNameToModelTypeMapper = {
  "customer": Customer,
  "contract": Contract,
  "office": Office,
  "customerMember": CustomerMember,
  "officeBranch": OfficeBranch,
  "manager": Manager,
  "serviceProvider": ServiceProvider,
  "taxBill": TaxBill,
  "sensor": Sensor,
  "sensorValue": SensorValue,
  "gateCredential": GateCredential,
  "gate": Gate,
  "logOperation": LogOperation,
  "logMessage": LogMessage,
  "notice": Notice,
  "guide": Guide,
  "event": Event
};

Map<String, dynamic> modelNameToModelConstructor = {
  "customer": Customer(
      id: -1,
      name: "",
      type: BusinessType.PERSONAL,
      status: CustomerStatus.NOTHING,
      serviceProvider: ServiceProviderSub()),
  "contract": Contract(
      id: -1,
      contactRep: CustomerMemberSub(),
      contractRep: CustomerMemberSub(),
      customer: CustomerSub(),
      manager: ManagerSub(),
      type: ContractType.MEMBERSHIP,
      status: ContractStatus.EXPIRED),
  "office": Office(
    id: -1,
    officeBranch: OfficeBranchSub(),
    name: "",
    type: OfficeType.VIRTUAL_OFFICE,
    capacity: -1,
  ),
  "customerMember": CustomerMember(
    id: -1,
    name: "",
    status: CustomerMemberStatus.NOTHING,
    type: CustomerMemberType.TYPE1,
    customer: CustomerSub(),
  ),
  "officeBranch": OfficeBranch(
    id: -1,
    name: "",
    serviceProvider: ServiceProviderSub(),
  ),
  "manager": Manager(
    id: -1,
    name: "",
    employeeType: EmployeeType.PARTTIME,
    job: Job.DEVELOPER,
    serviceProvider: ServiceProviderSub(),
  ),
  "serviceProvider": ServiceProvider(
    id: -1,
    name: "",
  ),
  "taxBill": TaxBill(
    id: -1,
    contract: ContractSub(),
    status: TaxBillStatus.NO,
  ),
  "sensor": Sensor(
      id: -1,
      office: OfficeSub(),
      type: SensorType.LUMINOSITY,
      valueUnit: MeasureUnit.PERCENT,
      hejhomeId: ""),
  "sensorValue": SensorValue(
    id: -1,
    dateTime: DateTime(1),
    measureValue: -1,
    sensor: SensorSub(),
  ),
  "gateCredential": GateCredential(
      id: -1,
      gate: GateSub(),
      csnCardData: -1,
      type: GateCredentialType.VISITOR,
      status: GateCredentialStatus.EXPIRED,
      endTime: DateTime(9999),
      customerMember: CustomerMemberSub()),
  "gate": Gate(
    id: -1,
    office: OfficeSub(),
    devicePort: 8080,
  ),
  "gudie": Guide(
    id: -1,
    provider: ServiceProviderSub(),
    type: GuideType.WIFI,
  )
};
