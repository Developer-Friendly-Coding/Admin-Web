String? Function(String?) stringNotNullValidor = (value) {
  if (value == null || value.isEmpty || value == "") {
    return '반드시 입력해주세요';
  }
  return null;
};

String? Function(String?) customerNameValidator = (value) {
  String allowed_special_characters = "[(),.]";
  if (value == null || value.isEmpty) {
    return '반드시 입력해주세요';
  } else if ((RegExp(
          r"(?<![\uac00-\ud7af])[\u1100-\u11ff\u3130-\u318f\ua960-\ua97f](?![\u1100-\u11ff\u3130-\u318f\ua960-\ua97f])")
      .hasMatch(value))) {
    return '완성된 한글을 입력';
  } else if ((!RegExp(r"^[\s\uac00-\ud7af\u0041-\u005a\u0061-\u007a0-9(),.]+$")
      .hasMatch(value))) {
    return '(),. 공백 한글 영어 숫자';
  } else if (value.length > 20) {
    return '공백, 특수문자 포함 20자';
  }
  return null;
};

String? Function(String?) customerMemberNameValidator = (value) {
  if (value == null || value.isEmpty) {
    return '반드시 입력해주세요';
  } else if ((RegExp(
          r"(?<![\uac00-\ud7af])[\u1100-\u11ff\u3130-\u318f\ua960-\ua97f](?![\u1100-\u11ff\u3130-\u318f\ua960-\ua97f])")
      .hasMatch(value))) {
    return '완성된 한글을 입력';
  } else if ((!RegExp(r"^[가-힣|a-z|A-Z|]+$").hasMatch(value))) {
    return '한글,영어만 가능 공백불가';
  } else if (value.length > 8) {
    return '8자 이내로 가능';
  }
  return null;
};
String? Function(String?) serviceProviderNameValidator = (value) {
  String allowed_special_characters = "[(),.]";
  if (value == null || value.isEmpty) {
    return '반드시 입력해주세요';
  } else if ((RegExp(
          r"(?<![\uac00-\ud7af])[\u1100-\u11ff\u3130-\u318f\ua960-\ua97f](?![\u1100-\u11ff\u3130-\u318f\ua960-\ua97f])")
      .hasMatch(value))) {
    return '완성된 한글을 입력';
  } else if ((!RegExp(r"^[\s\uac00-\ud7af\u0041-\u005a\u0061-\u007a0-9(),.]+$")
      .hasMatch(value))) {
    return '(),. 공백 한글 영어 숫자';
  } else if (value.length > 20) {
    return '공백, 특수문자 포함 20자';
  }
  return null;
};

String? Function(String?) managerValidator = (value) {
  if (value == null || value.isEmpty) {
    return '반드시 입력해주세요';
  } else if ((RegExp(
          r"(?<![\uac00-\ud7af])[\u1100-\u11ff\u3130-\u318f\ua960-\ua97f](?![\u1100-\u11ff\u3130-\u318f\ua960-\ua97f])")
      .hasMatch(value))) {
    return '완성된 한글을 입력';
  } else if ((!RegExp(r"^[가-힣|a-z|A-Z|]+$").hasMatch(value))) {
    return '한글,영어만 가능 공백불가';
  } else if (value.length > 8) {
    return '8자 이내로 가능';
  }
  return null;
};

String? Function(String?) descriptionNullableValidator = (value) {
  if (value == null || value.isEmpty) {
    return null;
  } else if (value.length > 70) {
    return '70자 이내로 입력';
  }

  return null;
};

String? Function(String?) officeNameValidator = (value) {
  if (value == null || value.isEmpty) {
    return '반드시 입력해주세요';
  } else if ((RegExp(
          r"(?<![\uac00-\ud7af])[\u1100-\u11ff\u3130-\u318f\ua960-\ua97f](?![\u1100-\u11ff\u3130-\u318f\ua960-\ua97f])")
      .hasMatch(value))) {
    return '완성된 한글을 입력';
  } else if ((!RegExp(r"^[\s\uac00-\ud7af\u0041-\u005a\u0061-\u007a0-9]+$")
      .hasMatch(value))) {
    return '한글 영어 숫자 공백 가능';
  } else if (value.length > 20) {
    return '공백 포함 20자';
  }
  return null;
};

String? Function(String?) officeBranchNameValidator = (value) {
  if (value == null || value.isEmpty) {
    return '반드시 입력해주세요';
  } else if ((RegExp(
          r"(?<![\uac00-\ud7af])[\u1100-\u11ff\u3130-\u318f\ua960-\ua97f](?![\u1100-\u11ff\u3130-\u318f\ua960-\ua97f])")
      .hasMatch(value))) {
    return '완성된 한글을 입력';
  } else if ((!RegExp(r"^[\s\uac00-\ud7af\u0041-\u005a\u0061-\u007a0-9]+$")
      .hasMatch(value))) {
    return '한글 영어 숫자 공백 가능';
  } else if (value.length > 20) {
    return '공백 포함 20자';
  }
  return null;
};

String? Function(String?) idValidator = (value) {
  if (value == null || value.isEmpty) {
    return 'ID를 입력해주세요';
  } else if (!(RegExp(r'^[0-9]+$').hasMatch(value))) {
    return '정수만 입력해주세요';
  }

  return null;
};

String? Function(String?) idSearchValidator = (value) {
  if (value == null || value.isEmpty) {
    return null;
  } else if (!(RegExp(r'^[0-9]+$').hasMatch(value))) {
    return '정수만 입력해주세요';
  }

  return null;
};

String? Function(String?) intNullableValidator = (value) {
  if (value == null || value.isEmpty) {
    return null;
  } else if (!(RegExp(r'^[0-9]+$').hasMatch(value))) {
    return '정수만 입력해주세요';
  } else if (value.length > 10) {
    return '10자리 이내로 입력가능';
  }

  return null;
};

String? Function(String?) intNotNullValidator = (value) {
  if (value == null || value.isEmpty) {
    return "반드시 입력해주세요";
  } else if (!(RegExp(r'^[0-9]+$').hasMatch(value))) {
    return '정수만 입력해주세요';
  } else if (value.length > 10) {
    return '10자리 이내로 입력가능';
  }

  return null;
};

String? Function(String?) floatNullableValidator = (value) {
  if (value == null || value.isEmpty) {
    return null;
  } else if (!(RegExp(r'^[0-9]*\.?[0-9]+$').hasMatch(value))) {
    return '실수만 입력해주세요';
  }
  return null;
};
String? Function(String?) floatNotNullValidator = (value) {
  if (value == null || value.isEmpty) {
    return "반드시 입력해주세요";
  } else if (!(RegExp(r'^[0-9]*\.?[0-9]+$').hasMatch(value))) {
    return '실수만 입력해주세요';
  }
  return null;
};

String? Function(String?) emailValidator = (value) {
  if (value == null || value.isEmpty) {
    return "이메일을 입력해주세요";
  } else if (!(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value))) {
    return ' ex) name@example.com';
  }
  return null;
};

String? Function(String?) phoneNullableValidator = (value) {
  if (value == null || value.isEmpty) {
    return null;
  } else if (!(RegExp(r'^[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}$').hasMatch(value))) {
    return 'ex) 010-7777-7777';
  }
  return null;
};

String? Function(String?) corporateRegistrationNumberNullableValidator =
    (value) {
  if (value == null || value.isEmpty) {
    return null;
  } else if (!(RegExp(r'^([0-9]{3})-([0-9]{2})-([0-9]{5})$').hasMatch(value))) {
    return 'ex): 123-44-55555';
  }
  return null;
};

String? Function(String?) companyRegistrationNumberNullableValidator = (value) {
  if (value == null || value.isEmpty) {
    return null;
  } else if (!(RegExp(r'^[0-9]{3}-+[0-9]{4}-+[0-9]{4}$').hasMatch(value))) {
    return 'ex): 123-4444-5555';
  }
  return null;
};
