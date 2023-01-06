import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/gate.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/office_branch.dart';

Map<Type, Map<int, Map<String, dynamic>>> cuDialogMapper = {
  Contract: {
    4: {
      "targetModel": OfficeBranch,
      "targetMapper": {1: "customerId", 4: "id", 5: "id"}
    },
  },
};

Map<Type, Map<String, dynamic>> multipleCuDialogMapper = {
  Contract: {
    "targetModel": OfficeBranch,
    "buttonName": "사무실 목록 추가",
  },
};
