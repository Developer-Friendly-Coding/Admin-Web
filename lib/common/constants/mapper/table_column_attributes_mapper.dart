import 'package:clean_arch/common/constants/enum/business_type.dart';
import 'package:clean_arch/common/constants/enum/contract_type.dart';
import 'package:clean_arch/common/constants/enum/customer_member_status.dart';
import 'package:clean_arch/common/constants/enum/customer_member_type.dart';
import 'package:clean_arch/common/constants/enum/customer_status.dart';
import 'package:clean_arch/common/constants/enum/employee_type.dart';
import 'package:clean_arch/common/constants/enum/gate_credential_status.dart';
import 'package:clean_arch/common/constants/enum/gate_credential_type.dart';
import 'package:clean_arch/common/constants/enum/job.dart';
import 'package:clean_arch/common/constants/enum/measure_unit.dart';
import 'package:clean_arch/common/constants/enum/office_type.dart';
import 'package:clean_arch/common/constants/enum/sensor_type.dart';
import 'package:clean_arch/common/constants/enum/tax_bill_status.dart';
import 'package:clean_arch/common/constants/validator.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';

List<ColumnAttributes> contractColumnAttributes = [
  ColumnAttributes(
    name: 'id',
    widthRate: 0.07,
    leftMarginRate: 0.012,
    validator: idValidator,
  ),
  ColumnAttributes(
      name: '입주사ID',
      widthRate: 0.07,
      leftMarginRate: 0.038,
      validator: idValidator),
  ColumnAttributes(
      name: '보증금',
      widthRate: 0.100,
      leftMarginRate: 0.08,
      validator: intValidator),
  ColumnAttributes(
      name: '대여비',
      widthRate: 0.0409,
      leftMarginRate: 0.12,
      validator: intValidator),
  ColumnAttributes(
      name: '계약자ID',
      widthRate: 0.07,
      leftMarginRate: 0.16,
      validator: idValidator,
      isCuDialog: true),
  ColumnAttributes(
      name: '알림수신자ID',
      widthRate: 0.100,
      leftMarginRate: 0.215,
      validator: idValidator),
  ColumnAttributes(
      name: '담당매니저ID',
      widthRate: 0.100,
      leftMarginRate: 0.27,
      validator: idValidator),
  ColumnAttributes(
      name: '계약일', widthRate: 0.100, leftMarginRate: 0.34, type: DateTime),
  ColumnAttributes(
      name: '시작일', widthRate: 0.100, leftMarginRate: 0.40, type: DateTime),
  ColumnAttributes(
      name: '종료일', widthRate: 0.100, leftMarginRate: 0.46, type: DateTime),
  ColumnAttributes(
      name: '계약상태',
      widthRate: 0.100,
      leftMarginRate: 0.53,
      enumValus: ContractType.values),
  ColumnAttributes(
      name: '설명',
      widthRate: 0.100,
      leftMarginRate: 0.59,
      validator: stringValidor)
];
List<ColumnAttributes> customerColumnAttributes = [
  ColumnAttributes(
      name: 'id',
      widthRate: 0.07,
      leftMarginRate: 0.03,
      validator: idValidator),
  ColumnAttributes(
      name: '이름',
      widthRate: 0.07,
      leftMarginRate: 0.08,
      validator: stringValidor),
  ColumnAttributes(
      name: '사업자형태',
      widthRate: 0.100,
      leftMarginRate: 0.15,
      enumValus: BusinessType.values),
  ColumnAttributes(
      name: '법인등록번호',
      widthRate: 0.08,
      leftMarginRate: 0.24,
      validator: corporateRegistrationNumberValidator),
  ColumnAttributes(
      name: '사업자등록번호',
      widthRate: 0.07,
      leftMarginRate: 0.35,
      validator: companyRegistrationNumberValidator),
  ColumnAttributes(
      name: '고객상태',
      widthRate: 0.100,
      leftMarginRate: 0.45,
      enumValus: CustomerStatus.values),
  ColumnAttributes(
      name: '설명',
      widthRate: 0.100,
      leftMarginRate: 0.55,
      validator: stringValidor),
  ColumnAttributes(
      name: '운영사ID',
      widthRate: 0.100,
      leftMarginRate: 0.55,
      validator: idValidator),
];
List<ColumnAttributes> officeColumnAttributes = [
  ColumnAttributes(
      name: 'id',
      widthRate: 0.07,
      leftMarginRate: 0.05,
      validator: idValidator),
  ColumnAttributes(
      name: '지점ID',
      widthRate: 0.07,
      leftMarginRate: 0.11,
      validator: idValidator),
  ColumnAttributes(
      name: '호실',
      widthRate: 0.059,
      leftMarginRate: 0.18,
      validator: stringValidor),
  ColumnAttributes(
      name: '정원',
      widthRate: 0.07,
      leftMarginRate: 0.3,
      validator: intValidator),
  ColumnAttributes(
      name: '사무실 형태',
      widthRate: 0.100,
      leftMarginRate: 0.38,
      enumValus: OfficeType.values),
  ColumnAttributes(
      name: '설명',
      widthRate: 0.100,
      leftMarginRate: 0.5,
      validator: stringValidor),
];
List<ColumnAttributes> customerMemberColumnAttributes = [
  ColumnAttributes(
      name: 'id',
      widthRate: 0.07,
      leftMarginRate: 0.03,
      validator: idValidator),
  ColumnAttributes(
    name: '입주사',
    widthRate: 0.03,
    leftMarginRate: 0.08,
    validator: idValidator,
    isHyperLink: true,
    hyperLinkTargetModel: Customer,
  ),
  ColumnAttributes(
      name: '이름',
      widthRate: 0.100,
      leftMarginRate: 0.14,
      validator: stringValidor),
  ColumnAttributes(
    name: '이메일',
    widthRate: 0.089,
    leftMarginRate: 0.21,
    validator: emailValidator,
  ),
  ColumnAttributes(
      name: '휴대번호',
      widthRate: 0.07,
      leftMarginRate: 0.32,
      validator: phoneValidator),
  ColumnAttributes(
      name: '고객상태',
      widthRate: 0.100,
      leftMarginRate: 0.41,
      enumValus: CustomerMemberStatus.values),
  ColumnAttributes(
      name: '입주형태',
      widthRate: 0.100,
      leftMarginRate: 0.49,
      enumValus: CustomerMemberType.values),
  ColumnAttributes(
      name: '설명',
      widthRate: 0.100,
      leftMarginRate: 0.555,
      validator: stringValidor),
];
List<ColumnAttributes> officeBranchColumnAttributes = [
  ColumnAttributes(
      name: 'id',
      widthRate: 0.07,
      leftMarginRate: 0.03,
      validator: idValidator),
  ColumnAttributes(
      name: '지점명',
      widthRate: 0.07,
      leftMarginRate: 0.1,
      validator: stringValidor),
  ColumnAttributes(
      name: '운영사ID',
      widthRate: 0.100,
      leftMarginRate: 0.2,
      validator: idValidator),
  ColumnAttributes(
      name: '위치',
      widthRate: 0.08,
      leftMarginRate: 0.28,
      validator: stringValidor),
  ColumnAttributes(
      name: '위도',
      widthRate: 0.07,
      leftMarginRate: 0.4,
      validator: floatValidator),
  ColumnAttributes(
      name: '경도',
      widthRate: 0.100,
      leftMarginRate: 0.5,
      validator: floatValidator),
];
List<ColumnAttributes> managerColumnAttributes = [
  ColumnAttributes(
      name: 'id',
      widthRate: 0.07,
      leftMarginRate: 0.03,
      validator: idValidator),
  ColumnAttributes(
      name: '운영사ID',
      widthRate: 0.07,
      leftMarginRate: 0.07,
      validator: idValidator),
  ColumnAttributes(
      name: '이름',
      widthRate: 0.100,
      leftMarginRate: 0.13,
      validator: stringValidor),
  ColumnAttributes(
      name: '고용형태',
      widthRate: 0.059,
      leftMarginRate: 0.18,
      enumValus: EmployeeType.values),
  ColumnAttributes(
      name: '계약마감일', widthRate: 0.07, leftMarginRate: 0.24, type: DateTime),
  ColumnAttributes(
      name: '계약시작일', widthRate: 0.100, leftMarginRate: 0.31, type: DateTime),
  ColumnAttributes(
      name: '휴대번호',
      widthRate: 0.100,
      leftMarginRate: 0.38,
      validator: phoneValidator),
  ColumnAttributes(
      name: '이메일',
      widthRate: 0.100,
      leftMarginRate: 0.46,
      validator: emailValidator),
  ColumnAttributes(
      name: '직업',
      widthRate: 0.100,
      leftMarginRate: 0.57,
      enumValus: Job.values),
];
List<ColumnAttributes> serviceProviderColumnAttributes = [
  ColumnAttributes(
      name: 'id',
      widthRate: 0.07,
      leftMarginRate: 0.03,
      validator: idValidator),
  ColumnAttributes(
      name: '운영사 이름',
      widthRate: 0.1,
      leftMarginRate: 0.08,
      validator: stringValidor),
  ColumnAttributes(
      name: '법인등록번호',
      widthRate: 0.100,
      leftMarginRate: 0.18,
      validator: corporateRegistrationNumberValidator),
  ColumnAttributes(
      name: '회사등록번호',
      widthRate: 0.08,
      leftMarginRate: 0.28,
      validator: companyRegistrationNumberValidator),
  ColumnAttributes(
      name: '헤이홈토큰',
      widthRate: 0.2,
      leftMarginRate: 0.38,
      validator: stringValidor),
];
List<ColumnAttributes> taxBillColumnAttributes = [
  ColumnAttributes(
      name: 'id',
      widthRate: 0.07,
      leftMarginRate: 0.03,
      validator: idValidator),
  ColumnAttributes(
      name: '계약ID',
      widthRate: 0.1,
      leftMarginRate: 0.1,
      validator: idValidator),
  ColumnAttributes(
      name: '발행일', widthRate: 0.100, leftMarginRate: 0.18, type: DateTime),
  ColumnAttributes(
      name: '공급가액',
      widthRate: 0.08,
      leftMarginRate: 0.28,
      validator: floatValidator),
  ColumnAttributes(
      name: '세액',
      widthRate: 0.2,
      leftMarginRate: 0.38,
      validator: floatValidator),
  ColumnAttributes(
      name: '총액',
      widthRate: 0.2,
      leftMarginRate: 0.48,
      validator: floatValidator),
  ColumnAttributes(
      name: '발행상태',
      widthRate: 0.2,
      leftMarginRate: 0.58,
      enumValus: TaxBillStatus.values),
];
List<ColumnAttributes> sensorColumnAttributes = [
  ColumnAttributes(
      name: 'id',
      widthRate: 0.07,
      leftMarginRate: 0.02,
      validator: idValidator),
  ColumnAttributes(
      name: '사무실ID',
      widthRate: 0.1,
      leftMarginRate: 0.06,
      validator: idValidator),
  ColumnAttributes(
      name: '이름',
      widthRate: 0.100,
      leftMarginRate: 0.11,
      validator: stringValidor),
  ColumnAttributes(
      name: '측정타입',
      widthRate: 0.08,
      leftMarginRate: 0.17,
      enumValus: SensorType.values),
  ColumnAttributes(
      name: '측정단위',
      widthRate: 0.2,
      leftMarginRate: 0.23,
      enumValus: MeasureUnit.values),
  ColumnAttributes(
      name: '측정간격',
      widthRate: 0.2,
      leftMarginRate: 0.27,
      validator: intValidator),
  ColumnAttributes(
      name: '설명',
      widthRate: 0.2,
      leftMarginRate: 0.32,
      validator: stringValidor),
  ColumnAttributes(
      name: '모델명',
      widthRate: 0.2,
      leftMarginRate: 0.35,
      validator: stringValidor),
  ColumnAttributes(
      name: '헤이홈센서 ID',
      widthRate: 0.08,
      leftMarginRate: 0.4,
      validator: idValidator),
  ColumnAttributes(
      name: '헤이홈 토큰',
      widthRate: 0.22,
      leftMarginRate: 0.5,
      validator: stringValidor),
];
List<ColumnAttributes> gateCredentialColumnAttributes = [
  ColumnAttributes(
      name: 'id',
      widthRate: 0.07,
      leftMarginRate: 0.03,
      validator: idValidator),
  ColumnAttributes(
      name: '출입문ID',
      widthRate: 0.07,
      leftMarginRate: 0.08,
      validator: idValidator),
  ColumnAttributes(
      name: '카드데이터(QR)',
      widthRate: 0.100,
      leftMarginRate: 0.15,
      validator: intValidator),
  ColumnAttributes(
      name: '타입',
      widthRate: 0.059,
      leftMarginRate: 0.24,
      enumValus: GateCredentialType.values),
  ColumnAttributes(
      name: '상태',
      widthRate: 0.07,
      leftMarginRate: 0.33,
      enumValus: GateCredentialStatus.values),
  ColumnAttributes(
      name: '유효 종료시간', widthRate: 0.100, leftMarginRate: 0.4, type: DateTime),
  ColumnAttributes(
      name: '입주자ID',
      widthRate: 0.100,
      leftMarginRate: 0.52,
      validator: idValidator),
];
List<ColumnAttributes> gateColumnAttributes = [
  ColumnAttributes(
      name: 'id',
      widthRate: 0.07,
      leftMarginRate: 0.03,
      validator: idValidator),
  ColumnAttributes(
      name: '출입장치 IP',
      widthRate: 0.1,
      leftMarginRate: 0.08,
      validator: stringValidor),
  ColumnAttributes(
      name: '포트번호',
      widthRate: 0.100,
      leftMarginRate: 0.18,
      validator: intValidator),
  ColumnAttributes(
      name: '설명',
      widthRate: 0.19,
      leftMarginRate: 0.25,
      validator: stringValidor),
  ColumnAttributes(
      name: '사무실ID',
      widthRate: 0.07,
      leftMarginRate: 0.45,
      validator: idValidator),
  ColumnAttributes(
      name: '열림상태',
      widthRate: 0.100,
      leftMarginRate: 0.55,
      validator: stringValidor),
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
  "GateCredential": gateCredentialColumnAttributes,
  "Gate": gateColumnAttributes
};
