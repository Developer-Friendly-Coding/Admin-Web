import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/gate.dart';
import 'package:clean_arch/model/impl/office.dart';

Map<Type, Map<int, Map<String, dynamic>>> cuDialogMapper = {
  Contract: {
    4: {
      "targetModel": CustomerMember,
      "targetMapper": {1: "customerId", 4: "id", 5: "id"}
    },
  },
};

Map<Type, Map<String, Type>> multipleCuDialogMapper = {
  Contract: {
    "targetModel": Office,
  },
};
