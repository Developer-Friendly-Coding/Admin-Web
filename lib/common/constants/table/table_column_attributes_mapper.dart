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
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';

List<ColumnAttributes> contractColumnAttributes = [
  ColumnAttributes(
    columnName: 'id',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.012,
  ),
  ColumnAttributes(
    columnName: '입주사ID',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.038,
  ),
  ColumnAttributes(
    columnName: '보증금',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.08,
  ),
  ColumnAttributes(
    columnName: '대여비',
    columntWidthRate: 0.0409,
    columnLeftMarginRate: 0.12,
  ),
  ColumnAttributes(
    columnName: '계약담당ID',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.16,
  ),
  ColumnAttributes(
    columnName: '알림담당ID',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.215,
  ),
  ColumnAttributes(
    columnName: '담당매니저ID',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.27,
  ),
  ColumnAttributes(
      columnName: '계약일',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.34,
      type: DateTime),
  ColumnAttributes(
      columnName: '시작일',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.40,
      type: DateTime),
  ColumnAttributes(
      columnName: '종료일',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.46,
      type: DateTime),
  ColumnAttributes(
      columnName: '계약상태',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.53,
      enumValus: ContractType.values),
  ColumnAttributes(
    columnName: '설명',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.59,
  )
];
List<ColumnAttributes> customerColumnAttributes = [
  ColumnAttributes(
    columnName: 'id',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.03,
  ),
  ColumnAttributes(
    columnName: '이름',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.08,
  ),
  ColumnAttributes(
      columnName: '사업자형태',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.15,
      enumValus: BusinessType.values),
  ColumnAttributes(
    columnName: '법인등록번호',
    columntWidthRate: 0.08,
    columnLeftMarginRate: 0.24,
  ),
  ColumnAttributes(
    columnName: '사업자등록번호',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.35,
  ),
  ColumnAttributes(
      columnName: '고객상태',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.45,
      enumValus: CustomerStatus.values),
  ColumnAttributes(
    columnName: '설명',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.55,
  ),
];
List<ColumnAttributes> officeColumnAttributes = [
  ColumnAttributes(
    columnName: 'id',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.05,
  ),
  ColumnAttributes(
    columnName: '지점ID',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.11,
  ),
  ColumnAttributes(
    columnName: '호실',
    columntWidthRate: 0.059,
    columnLeftMarginRate: 0.18,
  ),
  ColumnAttributes(
    columnName: '정원',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.3,
  ),
  ColumnAttributes(
      columnName: '사무실 형태',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.38,
      enumValus: OfficeType.values),
  ColumnAttributes(
    columnName: '설명',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.5,
  ),
];
List<ColumnAttributes> customerMemberColumnAttributes = [
  ColumnAttributes(
    columnName: 'id',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.03,
  ),
  ColumnAttributes(
    columnName: '입주사ID',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.08,
  ),
  ColumnAttributes(
    columnName: '이름',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.14,
  ),
  ColumnAttributes(
    columnName: '이메일',
    columntWidthRate: 0.089,
    columnLeftMarginRate: 0.21,
  ),
  ColumnAttributes(
    columnName: '휴대번호',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.32,
  ),
  ColumnAttributes(
      columnName: '고객상태',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.41,
      enumValus: CustomerMemberStatus.values),
  ColumnAttributes(
      columnName: '입주형태',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.49,
      enumValus: CustomerMemberType.values),
  ColumnAttributes(
    columnName: '설명',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.555,
  ),
];
List<ColumnAttributes> officeBranchColumnAttributes = [
  ColumnAttributes(
    columnName: 'id',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.03,
  ),
  ColumnAttributes(
    columnName: '지점명',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.1,
  ),
  ColumnAttributes(
    columnName: '운영사ID',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.2,
  ),
  ColumnAttributes(
    columnName: '위치',
    columntWidthRate: 0.08,
    columnLeftMarginRate: 0.28,
  ),
  ColumnAttributes(
    columnName: '위도',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.4,
  ),
  ColumnAttributes(
    columnName: '경도',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.5,
  ),
];
List<ColumnAttributes> managerColumnAttributes = [
  ColumnAttributes(
    columnName: 'id',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.03,
  ),
  ColumnAttributes(
    columnName: '운영사ID',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.07,
  ),
  ColumnAttributes(
    columnName: '이름',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.13,
  ),
  ColumnAttributes(
      columnName: '고용형태',
      columntWidthRate: 0.059,
      columnLeftMarginRate: 0.18,
      enumValus: EmployeeType.values),
  ColumnAttributes(
      columnName: '계약마감일',
      columntWidthRate: 0.07,
      columnLeftMarginRate: 0.24,
      type: DateTime),
  ColumnAttributes(
      columnName: '계약시작일',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.31,
      type: DateTime),
  ColumnAttributes(
    columnName: '휴대번호',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.38,
  ),
  ColumnAttributes(
    columnName: '이메일',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.46,
  ),
  ColumnAttributes(
      columnName: '직업',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.57,
      enumValus: Job.values),
];
List<ColumnAttributes> serviceProviderColumnAttributes = [
  ColumnAttributes(
    columnName: 'id',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.03,
  ),
  ColumnAttributes(
    columnName: '운영사 이름',
    columntWidthRate: 0.1,
    columnLeftMarginRate: 0.08,
  ),
  ColumnAttributes(
    columnName: '등록번호',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.18,
  ),
  ColumnAttributes(
    columnName: '회사등록번호',
    columntWidthRate: 0.08,
    columnLeftMarginRate: 0.28,
  ),
  ColumnAttributes(
    columnName: '헤이홈토큰',
    columntWidthRate: 0.2,
    columnLeftMarginRate: 0.38,
  ),
];
List<ColumnAttributes> taxBillColumnAttributes = [
  ColumnAttributes(
    columnName: 'id',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.03,
  ),
  ColumnAttributes(
    columnName: '계약ID',
    columntWidthRate: 0.1,
    columnLeftMarginRate: 0.1,
  ),
  ColumnAttributes(
      columnName: '발행일',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.18,
      type: DateTime),
  ColumnAttributes(
    columnName: '공급가액',
    columntWidthRate: 0.08,
    columnLeftMarginRate: 0.28,
  ),
  ColumnAttributes(
    columnName: '세액',
    columntWidthRate: 0.2,
    columnLeftMarginRate: 0.38,
  ),
  ColumnAttributes(
    columnName: '총액',
    columntWidthRate: 0.2,
    columnLeftMarginRate: 0.48,
  ),
  ColumnAttributes(
      columnName: '발행상태',
      columntWidthRate: 0.2,
      columnLeftMarginRate: 0.58,
      enumValus: TaxBillStatus.values),
];
List<ColumnAttributes> sensorColumnAttributes = [
  ColumnAttributes(
    columnName: 'id',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.02,
  ),
  ColumnAttributes(
    columnName: '계약ID',
    columntWidthRate: 0.1,
    columnLeftMarginRate: 0.06,
  ),
  ColumnAttributes(
    columnName: '이름',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.11,
  ),
  ColumnAttributes(
      columnName: '측정타입',
      columntWidthRate: 0.08,
      columnLeftMarginRate: 0.17,
      enumValus: SensorType.values),
  ColumnAttributes(
      columnName: '측정단위',
      columntWidthRate: 0.2,
      columnLeftMarginRate: 0.23,
      enumValus: MeasureUnit.values),
  ColumnAttributes(
    columnName: '측정간격',
    columntWidthRate: 0.2,
    columnLeftMarginRate: 0.27,
  ),
  ColumnAttributes(
    columnName: '설명',
    columntWidthRate: 0.2,
    columnLeftMarginRate: 0.32,
  ),
  ColumnAttributes(
    columnName: '모델명',
    columntWidthRate: 0.2,
    columnLeftMarginRate: 0.35,
  ),
  ColumnAttributes(
    columnName: '기기이름',
    columntWidthRate: 0.2,
    columnLeftMarginRate: 0.43,
  ),
  ColumnAttributes(
    columnName: '헤이홈센서ID',
    columntWidthRate: 0.2,
    columnLeftMarginRate: 0.5,
  ),
];
List<ColumnAttributes> gateCredentialColumnAttributes = [
  ColumnAttributes(
    columnName: 'id',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.03,
  ),
  ColumnAttributes(
    columnName: '출입문ID',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.08,
  ),
  ColumnAttributes(
    columnName: '카드데이터(QR)',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.15,
  ),
  ColumnAttributes(
      columnName: '타입',
      columntWidthRate: 0.059,
      columnLeftMarginRate: 0.24,
      enumValus: GateCredentialType.values),
  ColumnAttributes(
      columnName: '상태',
      columntWidthRate: 0.07,
      columnLeftMarginRate: 0.33,
      enumValus: GateCredentialStatus.values),
  ColumnAttributes(
      columnName: '유효 종료시간',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.4,
      type: DateTime),
  ColumnAttributes(
    columnName: '입주자ID',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.52,
  ),
];
List<ColumnAttributes> gateColumnAttributes = [
  ColumnAttributes(
    columnName: 'id',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.03,
  ),
  ColumnAttributes(
    columnName: '출입장치 IP',
    columntWidthRate: 0.1,
    columnLeftMarginRate: 0.08,
  ),
  ColumnAttributes(
    columnName: '포트번호',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.18,
  ),
  ColumnAttributes(
    columnName: '설명',
    columntWidthRate: 0.19,
    columnLeftMarginRate: 0.25,
  ),
  ColumnAttributes(
    columnName: '사무실ID',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.45,
  ),
  ColumnAttributes(
    columnName: '열림상태',
    columntWidthRate: 0.100,
    columnLeftMarginRate: 0.55,
  ),
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
