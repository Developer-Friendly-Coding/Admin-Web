import 'package:clean_arch/common/constants/validator.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';

List<ColumnAttributes> contractColumnAttributes = [
  ColumnAttributes(
    columnName: 'id',
    columntWidthRate: 0.07,
    columnLeftMarginRate: 0.018,
  ),
  ColumnAttributes(
      columnName: '고객 id',
      columntWidthRate: 0.07,
      columnLeftMarginRate: 0.065,
      validator: stringValidor),
  ColumnAttributes(
      columnName: '보증금',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.12,
      validator: businessTypeValidator),
  ColumnAttributes(
      columnName: '대여비',
      columntWidthRate: 0.0409,
      columnLeftMarginRate: 0.17,
      validator: passWordValidator),
  ColumnAttributes(
      columnName: '계약id',
      columntWidthRate: 0.07,
      columnLeftMarginRate: 0.22,
      validator: phoneValidator),
  ColumnAttributes(
      columnName: '담당자id',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.27,
      validator: customerStatusValidator),
  ColumnAttributes(
      columnName: '계약일',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.33,
      validator: stringValidor),
  ColumnAttributes(
      columnName: '시작일',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.39,
      validator: stringValidor),
  ColumnAttributes(
      columnName: '종료일',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.45,
      validator: stringValidor),
  ColumnAttributes(
      columnName: '계약형태',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.50,
      validator: stringValidor),
  ColumnAttributes(
      columnName: '설명',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.56,
      validator: stringValidor)
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
      validator: stringValidor),
  ColumnAttributes(
      columnName: '사업자형태',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.15,
      validator: businessTypeValidator),
  ColumnAttributes(
      columnName: '등록번호',
      columntWidthRate: 0.059,
      columnLeftMarginRate: 0.24,
      validator: passWordValidator),
  ColumnAttributes(
      columnName: '화사등록번호',
      columntWidthRate: 0.07,
      columnLeftMarginRate: 0.35,
      validator: phoneValidator),
  ColumnAttributes(
      columnName: '고객상태',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.45,
      validator: customerStatusValidator),
  ColumnAttributes(
      columnName: '설명',
      columntWidthRate: 0.100,
      columnLeftMarginRate: 0.55,
      validator: stringValidor),
];

Map<String, List<ColumnAttributes>> columnAttributesMapper = {
  "Customer": customerColumnAttributes,
  "Contract": contractColumnAttributes
};
