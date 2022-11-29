import 'package:clean_arch/common/constants/enum/business_type.dart';
import 'package:clean_arch/common/constants/enum/customer_status.dart';

String? Function(String?) stringValidor = (value) {
  if (value == null || value.isEmpty) {
    return '이필드를 반드시 입력해주세요';
  }

  return null;
};
//리턴값이 함수고 매
String? Function(String?) passWordValidator = (value) {
  if (value == null || value.isEmpty) {
    return '이 필드를 반드시 입력해주세요';
  } else if (!(RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
      .hasMatch(value))) {
    return '영어, 숫자 포함 8자 이상의 구성으로 작성해주세용';
  }

  return null;
};

String? Function(String?) phoneValidator = (value) {
  if (value == null || value.isEmpty) {
    return '필수적으로 기입해야하는 항목입니다.';
  } else if (!(RegExp(r'^[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}$').hasMatch(value))) {
    return '올바른 휴대번호 형식이 아닙니다. ex) 010-7777-7777';
  }
  return null;
};

String? Function(String?) businessTypeValidator = (value) {
  List<String> check = [];
  List<BusinessType> valueList = BusinessType.values;
  for (int i = 0; i < valueList.length; i++) {
    check.add(valueList[i].toString());
  }
  if (value == null || value.isEmpty) {
    return '필수적으로 기입해야하는 항목입니다.';
  } else if (!(check.contains(value))) {
    return '사업자 유형을 기입(ex: 개인사업자, 법인사업자, 개인이용)';
  }
  return null;
};

String? Function(String?) customerStatusValidator = (value) {
  List<String> check = [];
  List<CustomerStatus> valueList = CustomerStatus.values;
  for (int i = 0; i < valueList.length; i++) {
    check.add(valueList[i].toString());
  }
  if (value == null || value.isEmpty) {
    return '필수적으로 기입해야하는 항목입니다.';
  } else if (!(check.contains(value))) {
    return '고객 유형을 기입(ex: 만료, 테스트, 계약중)';
  }
  return null;
};
