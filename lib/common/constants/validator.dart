String? Function(String?) stringValidor = (value) {
  if (value == null || value.isEmpty) {
    return '반드시 입력해주세요';
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

String? Function(String?) intValidator = (value) {
  if (value == null || value.isEmpty) {
    return '반드시 입력해주세요';
  } else if (!(RegExp(r'^[0-9]+$').hasMatch(value))) {
    return '정수만 입력해주세요';
  }

  return null;
};

String? Function(String?) floatValidator = (value) {
  if (value == null || value.isEmpty) {
    return '비워놓지 마세요';
  } else if (!(RegExp(r'^[0-9]*\.?[0-9]+$').hasMatch(value))) {
    return '실수만 입력해주세요';
  }

  return null;
};

String? Function(String?) emailValidator = (value) {
  if (value == null || value.isEmpty) {
    return '이메일을 입력해주세요';
  } else if (!(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value))) {
    return ' ex) name@example.com';
  }
  return null;
};

String? Function(String?) phoneValidator = (value) {
  if (value == null || value.isEmpty) {
    return '휴대번호를 입력해주세요';
  } else if (!(RegExp(r'^[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}$').hasMatch(value))) {
    return 'ex) 010-7777-7777';
  }
  return null;
};

String? Function(String?) corporateRegistrationNumberValidator = (value) {
  if (value == null || value.isEmpty) {
    return '법인등록번호 필수 기입';
  } else if (!(RegExp(r'^([0-9]{3})-([0-9]{2})-([0-9]{5})$').hasMatch(value))) {
    return 'ex): 123-44-55555';
  }
  return null;
};

String? Function(String?) companyRegistrationNumberValidator = (value) {
  if (value == null || value.isEmpty) {
    return '사업자등록번호 필수 기입';
  } else if (!(RegExp(r'^[0-9]{3}-+[0-9]{4}-+[0-9]{4}$').hasMatch(value))) {
    return 'ex): 123-4444-5555';
  }
  return null;
};
