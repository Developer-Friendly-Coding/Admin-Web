import 'package:clean_arch/common/constants/enum/business_type.dart';
import 'package:clean_arch/common/constants/enum/contract_status.dart';
import 'package:clean_arch/common/constants/enum/contract_type.dart';
import 'package:clean_arch/common/constants/enum/customer_member_status.dart';
import 'package:clean_arch/common/constants/enum/customer_member_type.dart';
import 'package:clean_arch/common/constants/enum/customer_status.dart';
import 'package:clean_arch/common/constants/enum/employee_type.dart';
import 'package:clean_arch/common/constants/enum/event_type.dart';
import 'package:clean_arch/common/constants/enum/gate_credential_status.dart';
import 'package:clean_arch/common/constants/enum/gate_credential_type.dart';
import 'package:clean_arch/common/constants/enum/guide_type.dart';
import 'package:clean_arch/common/constants/enum/job.dart';
import 'package:clean_arch/common/constants/enum/measure_unit.dart';
import 'package:clean_arch/common/constants/enum/office_type.dart';
import 'package:clean_arch/common/constants/enum/sensor_type.dart';
import 'package:clean_arch/common/constants/enum/tax_bill_status.dart';
import 'package:clean_arch/common/constants/validator.dart';
import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/gate.dart';
import 'package:clean_arch/model/impl/manager.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:clean_arch/model/impl/sensor.dart';
import 'package:clean_arch/model/impl/service_provider.dart';

List<ColumnAttributes> contractColumnAttributes = [
  ColumnAttributes(
    name: 'id',
    width: 27,
    leftMargin: 80,
    validator: idValidator,
    toJson: 'id',
  ),
  ColumnAttributes(
      name: '입주고객',
      width: 120,
      leftMargin: 150,
      validator: stringNotNullValidor,
      isHyperLink: true,
      hyperLinkTargetModel: Customer,
      isCuDialog: true,
      cuDialogTextMapper: {1: "name"},
      cuDialogTargetModel: Customer,
      cuDialogJsonMapper: {
        "customerId": "id",
      },
      cuDialogSearchQueryTarget: "customerId",
      cuDialogSearchTextTarget: "name"),
  ColumnAttributes(
      name: '계약상태',
      width: 70,
      leftMargin: 270,
      enumValus: ContractStatus.values,
      toJson: "status"),
  ColumnAttributes(
      name: '보증금',
      width: 80,
      leftMargin: 400,
      validator: intNullableValidator,
      toJson: "deposit"),
  ColumnAttributes(
      name: '대여비',
      width: 80,
      leftMargin: 550,
      validator: intNullableValidator,
      toJson: "rent"),
  ColumnAttributes(
    name: '계약자',
    width: 60,
    leftMargin: 690,
    validator: stringNotNullValidor,
    isHyperLink: true,
    hyperLinkTargetModel: CustomerMember,
    isCuDialog: true,
    cuDialogTextMapper: {1: "customerName", 4: "name", 5: "name"},
    cuDialogTargetModel: CustomerMember,
    cuDialogJsonMapper: {
      "customerId": "customerId",
      "contractRepId": "id",
      "contactRepId": "id",
    },
    cuDialogSearchQueryTarget: "contractRepId",
    cuDialogSearchTextTarget: "name",
  ),
  ColumnAttributes(
    name: '알림수신자',
    width: 80,
    leftMargin: 810,
    validator: stringNotNullValidor,
    isHyperLink: true,
    hyperLinkTargetModel: CustomerMember,
    isCuDialog: true,
    cuDialogTextMapper: {1: "customerName", 5: "name"},
    cuDialogTargetModel: CustomerMember,
    cuDialogJsonMapper: {
      "customerId": "customerId",
      "contactRepId": "id",
    },
    cuDialogSearchQueryTarget: "contactRepId",
    cuDialogSearchTextTarget: "name",
  ),
  ColumnAttributes(
    name: '담당매니저',
    width: 80,
    leftMargin: 930,
    validator: stringNotNullValidor,
    isHyperLink: true,
    hyperLinkTargetModel: Manager,
    isCuDialog: true,
    cuDialogTextMapper: {6: "name"},
    cuDialogTargetModel: Manager,
    cuDialogJsonMapper: {
      "managerId": "id",
    },
    cuDialogSearchQueryTarget: "managerId",
    cuDialogSearchTextTarget: "name",
  ),
  ColumnAttributes(
      name: '계약일',
      width: 90,
      leftMargin: 1100,
      type: DateTime,
      toJson: "contractDatetime"),
  ColumnAttributes(
      name: '시작일',
      width: 90,
      leftMargin: 1250,
      type: DateTime,
      toJson: "startDatetime"),
  ColumnAttributes(
      name: '종료일',
      width: 90,
      leftMargin: 1400,
      type: DateTime,
      toJson: "endDatetime"),
  ColumnAttributes(
      name: '계약타입',
      width: 70,
      leftMargin: 1550,
      enumValus: ContractType.values,
      toJson: "type"),
  ColumnAttributes(
    name: '설명',
    width: 0,
    leftMargin: 0,
    toJson: "description",
  )
];
List<ColumnAttributes> customerColumnAttributes = [
  ColumnAttributes(
      name: 'ID',
      width: 58,
      leftMargin: 96,
      validator: idValidator,
      toJson: 'id'),
  ColumnAttributes(
      name: '이름',
      width: 138,
      leftMargin: 177,
      validator: customerNameValidator,
      toJson: "name"),
  ColumnAttributes(
      name: '사업자형태',
      width: 98,
      leftMargin: 337,
      enumValus: BusinessType.values,
      toJson: "type"),
  ColumnAttributes(
      name: '법인등록번호',
      width: 130,
      leftMargin: 460,
      validator: corporateRegistrationNumberNullableValidator,
      toJson: "registrationNumber"),
  ColumnAttributes(
      name: '사업자등록번호',
      width: 130,
      leftMargin: 620,
      validator: companyRegistrationNumberNullableValidator,
      toJson: "companyRegistrationNumber"),
  ColumnAttributes(
      name: '고객상태',
      width: 95,
      leftMargin: 785,
      enumValus: CustomerStatus.values,
      toJson: "status"),
  ColumnAttributes(
      name: '운영사',
      width: 150,
      leftMargin: 914,
      validator: stringNotNullValidor,
      hyperLinkTargetModel: ServiceProvider,
      isHyperLink: true,
      isCuDialog: true,
      cuDialogTextMapper: {6: "name"},
      cuDialogTargetModel: ServiceProvider,
      cuDialogJsonMapper: {
        "serviceProviderId": "id",
      },
      cuDialogSearchTextTarget: "name",
      cuDialogSearchQueryTarget: "serviceProviderId"),
  ColumnAttributes(
      name: '설명',
      width: 0,
      leftMargin: 0,
      validator: descriptionNullableValidator,
      toJson: "description"),
];
List<ColumnAttributes> officeColumnAttributes = [
  ColumnAttributes(
      name: 'id', width: 30, leftMargin: 80, validator: idValidator),
  ColumnAttributes(
      name: '지점',
      width: 100,
      leftMargin: 160,
      validator: stringNotNullValidor,
      isHyperLink: true,
      hyperLinkTargetModel: OfficeBranch,
      isCuDialog: true,
      cuDialogTextMapper: {1: "name"},
      cuDialogTargetModel: OfficeBranch,
      cuDialogJsonMapper: {
        "officeBranchId": "id",
      },
      cuDialogSearchQueryTarget: "officeBranchId",
      cuDialogSearchTextTarget: "name"),
  ColumnAttributes(
      name: '호실',
      width: 80,
      leftMargin: 300,
      validator: officeNameValidator,
      toJson: "name"),
  ColumnAttributes(
      name: '정원',
      width: 30,
      leftMargin: 430,
      validator: intNotNullValidator,
      toJson: "capacity"),
  ColumnAttributes(
      name: '사무실 형태',
      width: 100,
      leftMargin: 550,
      enumValus: OfficeType.values,
      toJson: "type"),
  ColumnAttributes(
      name: '설명',
      width: 0,
      leftMargin: 0,
      validator: descriptionNullableValidator,
      toJson: "description"),
];
List<ColumnAttributes> customerMemberColumnAttributes = [
  ColumnAttributes(
      name: 'id', width: 30, leftMargin: 80, validator: idValidator),
  ColumnAttributes(
    name: '입주고객',
    width: 150,
    leftMargin: 150,
    validator: stringNotNullValidor,
    isHyperLink: true,
    hyperLinkTargetModel: Customer,
    isCuDialog: true,
    cuDialogSearchTextTarget: "name",
    cuDialogSearchQueryTarget: "customerId",
    cuDialogTextMapper: {1: "name"},
    cuDialogTargetModel: Customer,
    cuDialogJsonMapper: {
      "customerId": "id",
    },
  ),
  ColumnAttributes(
      name: '이름',
      width: 60,
      leftMargin: 320,
      validator: customerMemberNameValidator,
      toJson: "name"),
  ColumnAttributes(
      name: '이메일',
      width: 150,
      leftMargin: 420,
      validator: emailValidator,
      toJson: "email"),
  ColumnAttributes(
      name: '휴대번호',
      width: 120,
      leftMargin: 620,
      validator: phoneNullableValidator,
      toJson: "phoneNumber"),
  ColumnAttributes(
      name: '고객상태',
      width: 70,
      leftMargin: 770,
      enumValus: CustomerMemberStatus.values,
      toJson: "status"),
  ColumnAttributes(
      name: '입주형태',
      width: 80,
      leftMargin: 900,
      enumValus: CustomerMemberType.values,
      toJson: "type"),
  ColumnAttributes(
      name: '설명',
      width: 0,
      leftMargin: 0,
      validator: descriptionNullableValidator,
      toJson: "description"),
];
List<ColumnAttributes> officeBranchColumnAttributes = [
  ColumnAttributes(
      name: 'id', width: 30, leftMargin: 80, validator: idValidator),
  ColumnAttributes(
      name: '지점명',
      width: 90,
      leftMargin: 160,
      validator: officeBranchNameValidator,
      toJson: "name"),
  ColumnAttributes(
      name: '운영사',
      width: 90,
      leftMargin: 300,
      validator: stringNotNullValidor,
      isHyperLink: true,
      hyperLinkTargetModel: ServiceProvider,
      isCuDialog: true,
      cuDialogTextMapper: {2: "name"},
      cuDialogTargetModel: ServiceProvider,
      cuDialogJsonMapper: {
        "serviceProviderId": "id",
      },
      cuDialogSearchQueryTarget: "serviceProviderId",
      cuDialogSearchTextTarget: "name"),
  ColumnAttributes(
    name: '위치',
    width: 120,
    leftMargin: 440,
    toJson: "location",
  ),
  ColumnAttributes(
      name: '위도',
      width: 100,
      leftMargin: 600,
      validator: floatNullableValidator,
      toJson: "latitude"),
  ColumnAttributes(
      name: '경도',
      width: 100,
      leftMargin: 750,
      validator: floatNullableValidator,
      toJson: "longitude"),
];
List<ColumnAttributes> managerColumnAttributes = [
  ColumnAttributes(
      name: 'id', width: 30, leftMargin: 80, validator: idValidator),
  ColumnAttributes(
      name: '운영사',
      width: 80,
      leftMargin: 160,
      validator: stringNotNullValidor,
      isHyperLink: true,
      hyperLinkTargetModel: ServiceProvider,
      isCuDialog: true,
      cuDialogTextMapper: {1: "name"},
      cuDialogTargetModel: ServiceProvider,
      cuDialogJsonMapper: {
        "serviceProviderId": "id",
      },
      cuDialogSearchQueryTarget: "serviceProviderId",
      cuDialogSearchTextTarget: "name"),
  ColumnAttributes(
      name: '이름',
      width: 80,
      leftMargin: 280,
      validator: managerValidator,
      toJson: "name"),
  ColumnAttributes(
      name: '고용형태',
      width: 80,
      leftMargin: 390,
      enumValus: EmployeeType.values,
      toJson: "employeeType"),
  ColumnAttributes(
      name: '고용계약시작일',
      width: 120,
      leftMargin: 500,
      type: DateTime,
      toJson: "effectiveDate"),
  ColumnAttributes(
      name: '고용계약마감일',
      width: 120,
      leftMargin: 680,
      type: DateTime,
      toJson: "expireDate"),
  ColumnAttributes(
      name: '휴대번호',
      width: 130,
      leftMargin: 830,
      validator: phoneNullableValidator,
      toJson: "phoneNumber"),
  ColumnAttributes(
      name: '이메일',
      width: 130,
      leftMargin: 980,
      validator: emailValidator,
      toJson: "email"),
  ColumnAttributes(
      name: '직업',
      width: 60,
      leftMargin: 1170,
      enumValus: Job.values,
      toJson: "job"),
];
List<ColumnAttributes> serviceProviderColumnAttributes = [
  ColumnAttributes(
      name: 'id',
      width: 80,
      leftMargin: 70,
      validator: idValidator,
      toJson: "id"),
  ColumnAttributes(
      name: '운영사 이름',
      width: 80,
      leftMargin: 130,
      validator: serviceProviderNameValidator,
      toJson: "name"),
  ColumnAttributes(
      name: '법인등록번호',
      width: 100,
      leftMargin: 280,
      validator: corporateRegistrationNumberNullableValidator,
      toJson: "registrationNumber"),
  ColumnAttributes(
      name: '회사등록번호',
      width: 100,
      leftMargin: 430,
      validator: companyRegistrationNumberNullableValidator,
      toJson: "companyRegistrationNumber"),
  ColumnAttributes(
    name: '헤이홈토큰',
    width: 200,
    leftMargin: 600,
    toJson: "hejhomeToken",
  ),
];
List<ColumnAttributes> taxBillColumnAttributes = [
  ColumnAttributes(
      name: 'id', width: 30, leftMargin: 80, validator: idValidator),
  ColumnAttributes(
      name: '계약타입',
      width: 80,
      leftMargin: 170,
      validator: stringNotNullValidor,
      isHyperLink: true,
      hyperLinkTargetModel: Contract,
      isCuDialog: true,
      cuDialogTextMapper: {1: "contractRepName"},
      cuDialogTargetModel: Contract,
      cuDialogJsonMapper: {
        "contractId": "id",
      },
      cuDialogSearchQueryTarget: "contractId",
      cuDialogSearchTextTarget: "contractRepName"),
  ColumnAttributes(
      name: '발행일',
      width: 100,
      leftMargin: 280,
      type: DateTime,
      toJson: "issuedDate"),
  ColumnAttributes(
      name: '공급가액',
      width: 70,
      leftMargin: 420,
      validator: floatNullableValidator,
      toJson: "subTotal"),
  ColumnAttributes(
      name: '세액',
      width: 70,
      leftMargin: 540,
      validator: floatNullableValidator,
      toJson: "tax"),
  ColumnAttributes(
      name: '총액',
      width: 70,
      leftMargin: 660,
      validator: floatNullableValidator,
      toJson: "total"),
  ColumnAttributes(
      name: '발행상태',
      width: 80,
      leftMargin: 780,
      enumValus: TaxBillStatus.values,
      toJson: 'status'),
];
List<ColumnAttributes> sensorColumnAttributes = [
  ColumnAttributes(
      name: 'id', width: 30, leftMargin: 80, validator: idValidator),
  ColumnAttributes(
      name: '사무실',
      width: 90,
      leftMargin: 150,
      validator: stringNotNullValidor,
      isHyperLink: true,
      hyperLinkTargetModel: Office,
      isCuDialog: true,
      cuDialogTextMapper: {1: "name"},
      cuDialogTargetModel: Office,
      cuDialogJsonMapper: {
        "officeId": "id",
      },
      cuDialogSearchQueryTarget: "officeId",
      cuDialogSearchTextTarget: "name"),
  ColumnAttributes(
    name: '이름',
    width: 90,
    leftMargin: 270,
    toJson: "name",
  ),
  ColumnAttributes(
      name: '측정타입',
      width: 90,
      leftMargin: 400,
      enumValus: SensorType.values,
      toJson: "type"),
  ColumnAttributes(
      name: '측정단위',
      width: 80,
      leftMargin: 530,
      enumValus: MeasureUnit.values,
      toJson: "valueUnit"),
  ColumnAttributes(
      name: '측정간격',
      width: 80,
      leftMargin: 640,
      validator: intNullableValidator,
      toJson: "measureInterval"),
  ColumnAttributes(
    name: '모델명',
    width: 100,
    leftMargin: 760,
    toJson: "modelName",
  ),
  ColumnAttributes(
      name: '헤이홈센서 ID',
      width: 120,
      leftMargin: 900,
      validator: stringNotNullValidor,
      toJson: "hejhomeId"),
  ColumnAttributes(
    name: '헤이홈 토큰',
    width: 140,
    leftMargin: 1100,
    toJson: "token",
  ),
  ColumnAttributes(
    name: '설명',
    width: 0,
    leftMargin: 0,
    toJson: "description",
  ),
];
List<ColumnAttributes> gateCredentialColumnAttributes = [
  ColumnAttributes(
    name: 'id',
    width: 30,
    leftMargin: 80,
    validator: idValidator,
    toJson: 'id',
  ),
  ColumnAttributes(
      name: '출입문 장치IP',
      width: 120,
      leftMargin: 150,
      validator: stringNotNullValidor,
      isHyperLink: true,
      hyperLinkTargetModel: Gate,
      isCuDialog: true,
      cuDialogTextMapper: {1: "deviceIp"},
      cuDialogTargetModel: Gate,
      cuDialogJsonMapper: {
        "gateId": "id",
      },
      cuDialogSearchQueryTarget: "gateId",
      cuDialogSearchTextTarget: "deviceIp"),
  ColumnAttributes(
    name: '카드데이터(QR)',
    width: 120,
    leftMargin: 330,
    validator: intNotNullValidator,
    toJson: 'csnCardData',
  ),
  ColumnAttributes(
    name: '타입',
    width: 50,
    leftMargin: 490,
    enumValus: GateCredentialType.values,
    toJson: 'type',
  ),
  ColumnAttributes(
    name: '상태',
    width: 50,
    leftMargin: 600,
    enumValus: GateCredentialStatus.values,
    toJson: 'status',
  ),
  ColumnAttributes(
    name: '유효 종료시간',
    width: 130,
    leftMargin: 710,
    type: DateTime,
    toJson: 'endTime',
    validator: stringNotNullValidor,
  ),
  ColumnAttributes(
      name: '입주멤버',
      width: 60,
      leftMargin: 870,
      validator: stringNotNullValidor,
      toJson: 'id',
      isHyperLink: true,
      hyperLinkTargetModel: CustomerMember,
      isCuDialog: true,
      cuDialogTextMapper: {6: "name"},
      cuDialogTargetModel: CustomerMember,
      cuDialogJsonMapper: {
        "customerMemberId": "id",
      },
      cuDialogSearchQueryTarget: "customerMemberId",
      cuDialogSearchTextTarget: "name"),
];
List<ColumnAttributes> gateColumnAttributes = [
  ColumnAttributes(
      name: 'id',
      width: 30,
      leftMargin: 80,
      validator: idValidator,
      toJson: "id"),
  ColumnAttributes(
      name: '사무실',
      width: 70,
      leftMargin: 150,
      validator: stringNotNullValidor,
      isHyperLink: true,
      hyperLinkTargetModel: Office,
      isCuDialog: true,
      cuDialogTextMapper: {1: "name"},
      cuDialogTargetModel: Office,
      cuDialogJsonMapper: {
        "officeId": "id",
      },
      cuDialogSearchQueryTarget: "officeId",
      cuDialogSearchTextTarget: "name"),
  ColumnAttributes(
      name: '출입장치 ID',
      width: 100,
      leftMargin: 270,
      validator: intNullableValidator,
      toJson: "deviceId"),
  ColumnAttributes(
    name: '출입장치 IP',
    width: 150,
    leftMargin: 410,
    toJson: "deviceIp",
  ),
  ColumnAttributes(
    name: '포트번호',
    width: 70,
    leftMargin: 550,
    validator: intNotNullValidator,
    toJson: "devicePort",
  ),
  ColumnAttributes(
    name: '설명',
    width: 0,
    leftMargin: 0,
    toJson: "description",
  ),
];
List<ColumnAttributes> sensorValuseColumnAttributes = [
  ColumnAttributes(
      name: 'id', width: 30, leftMargin: 80, validator: idValidator),
  ColumnAttributes(
      name: '측정일시',
      width: 80,
      leftMargin: 150,
      validator: stringNotNullValidor,
      toJson: "dateTime",
      type: DateTime),
  ColumnAttributes(
      name: '측정값',
      width: 120,
      leftMargin: 280,
      validator: floatNotNullValidator,
      toJson: "measureValue"),
  ColumnAttributes(
      name: '센서이름',
      width: 100,
      leftMargin: 430,
      validator: stringNotNullValidor,
      isCuDialog: true,
      cuDialogTextMapper: {3: "name"},
      cuDialogTargetModel: Sensor,
      cuDialogJsonMapper: {
        "sensorId": "id",
      },
      cuDialogSearchQueryTarget: "sensorId",
      cuDialogSearchTextTarget: "name"),
];
List<ColumnAttributes> guideColumnAttributes = [
  ColumnAttributes(
      name: 'id',
      width: 30,
      leftMargin: 80,
      validator: idValidator,
      toJson: 'id'),
  ColumnAttributes(
    name: '운영사',
    width: 100,
    leftMargin: 160,
    validator: stringNotNullValidor,
    isHyperLink: true,
    hyperLinkTargetModel: ServiceProvider,
    isCuDialog: true,
    cuDialogTextMapper: {1: "name"},
    cuDialogTargetModel: ServiceProvider,
    cuDialogJsonMapper: {
      "serviceProviderId": "id",
    },
    cuDialogSearchQueryTarget: "serviceProviderId",
    cuDialogSearchTextTarget: "name",
  ),
  ColumnAttributes(
    name: '지점',
    width: 100,
    leftMargin: 300,
    validator: floatNotNullValidator,
    isHyperLink: true,
    hyperLinkTargetModel: OfficeBranch,
    isCuDialog: true,
    cuDialogTextMapper: {1: "name"},
    cuDialogTargetModel: OfficeBranch,
    cuDialogJsonMapper: {
      "officeBranchId": "id",
    },
    cuDialogSearchQueryTarget: "officeBranchId",
    cuDialogSearchTextTarget: "name",
  ),
  ColumnAttributes(
      name: '공지타입',
      width: 80,
      leftMargin: 450,
      validator: stringNotNullValidor,
      enumValus: GuideType.values,
      toJson: "type"),
  ColumnAttributes(
      name: '제목',
      width: 120,
      leftMargin: 580,
      validator: floatNotNullValidator,
      toJson: "title"),
  ColumnAttributes(
      name: '내용',
      width: 150,
      leftMargin: 760,
      validator: floatNotNullValidator,
      toJson: "content"),
];
List<ColumnAttributes> eventColumnAttributes = [
  ColumnAttributes(
      name: 'id', width: 30, leftMargin: 80, validator: idValidator),
  ColumnAttributes(
    name: '운영사',
    width: 100,
    leftMargin: 170,
    validator: stringNotNullValidor,
    isHyperLink: true,
    hyperLinkTargetModel: ServiceProvider,
    isCuDialog: true,
    cuDialogTextMapper: {1: "name"},
    cuDialogTargetModel: ServiceProvider,
    cuDialogJsonMapper: {
      "serviceProviderId": "id",
    },
    cuDialogSearchQueryTarget: "serviceProviderId",
    cuDialogSearchTextTarget: "name",
  ),
  ColumnAttributes(
    name: '지점',
    width: 100,
    leftMargin: 300,
    validator: floatNotNullValidator,
    isHyperLink: true,
    hyperLinkTargetModel: OfficeBranch,
    isCuDialog: true,
    cuDialogTextMapper: {1: "name"},
    cuDialogTargetModel: OfficeBranch,
    cuDialogJsonMapper: {
      "officeBranchId": "id",
    },
    cuDialogSearchQueryTarget: "officeBranchId",
    cuDialogSearchTextTarget: "name",
  ),
  ColumnAttributes(
      name: '이벤트타입',
      width: 80,
      leftMargin: 430,
      validator: stringNotNullValidor,
      enumValus: EventType.values,
      toJson: "type"),
  ColumnAttributes(
      name: '제목',
      width: 120,
      leftMargin: 560,
      validator: stringNotNullValidor,
      toJson: "title"),
  ColumnAttributes(
      name: '내용',
      width: 160,
      leftMargin: 740,
      validator: stringNotNullValidor,
      toJson: "content"),
  ColumnAttributes(
      name: '시작 기간',
      width: 120,
      leftMargin: 940,
      validator: stringNotNullValidor,
      type: DateTime,
      toJson: "startDatetime"),
  ColumnAttributes(
      name: '마감 기간',
      width: 120,
      leftMargin: 1100,
      validator: stringNotNullValidor,
      type: DateTime,
      toJson: "endDatetime"),
  ColumnAttributes(
      name: '이미지Url',
      width: 200,
      leftMargin: 1270,
      validator: stringNotNullValidor,
      toJson: "imageUrl"),
];
List<ColumnAttributes> noticeColumnAttributes = [
  ColumnAttributes(
      name: 'id', width: 30, leftMargin: 80, validator: idValidator),
  ColumnAttributes(
      name: '운영사',
      width: 100,
      leftMargin: 170,
      validator: stringNotNullValidor,
      isHyperLink: true,
      hyperLinkTargetModel: ServiceProvider,
      isCuDialog: true,
      cuDialogTextMapper: {1: "name"},
      cuDialogTargetModel: ServiceProvider,
      cuDialogJsonMapper: {
        "serviceProviderId": "id",
      },
      cuDialogSearchQueryTarget: "serviceProviderId",
      cuDialogSearchTextTarget: "name"),
  ColumnAttributes(
      name: '지점',
      width: 100,
      leftMargin: 310,
      validator: floatNotNullValidator,
      toJson: "measureValue",
      isHyperLink: true,
      hyperLinkTargetModel: OfficeBranch,
      isCuDialog: true,
      cuDialogTextMapper: {1: "name"},
      cuDialogTargetModel: OfficeBranch,
      cuDialogJsonMapper: {
        "officeBranchId": "id",
      },
      cuDialogSearchQueryTarget: "officeBranchId",
      cuDialogSearchTextTarget: "name"),
  ColumnAttributes(
      name: '제목',
      width: 120,
      leftMargin: 450,
      validator: stringNotNullValidor,
      toJson: "title"),
  ColumnAttributes(
      name: '내용',
      width: 120,
      leftMargin: 620,
      validator: stringNotNullValidor,
      toJson: "content"),
  ColumnAttributes(
      name: '이미지Url',
      width: 200,
      leftMargin: 800,
      validator: stringNotNullValidor,
      toJson: "imageUrl"),
];
Map<String, List<ColumnAttributes>> columnAttributesMapper = {
  "Customer": customerColumnAttributes,
  "Contract": contractColumnAttributes,
  "Office": officeColumnAttributes,
  "CustomerMember": customerMemberColumnAttributes,
  "OfficeBranch": officeBranchColumnAttributes,
  "Manager": managerColumnAttributes,
  "ServiceProvider": serviceProviderColumnAttributes,
  "TaxBill": taxBillColumnAttributes,
  "Sensor": sensorColumnAttributes,
  "SensorValue": sensorValuseColumnAttributes,
  "GateCredential": gateCredentialColumnAttributes,
  "Gate": gateColumnAttributes,
  "Guide": guideColumnAttributes,
  "Event": eventColumnAttributes,
  "Notice": noticeColumnAttributes,
};
