import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/gate.dart';
import 'package:clean_arch/model/impl/gate_credential.dart';
import 'package:clean_arch/model/impl/manager.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:clean_arch/model/impl/sensor.dart';
import 'package:clean_arch/model/impl/sensor_value.dart';
import 'package:clean_arch/model/impl/service_provider.dart';
import 'package:clean_arch/model/impl/tax_bill.dart';

Map<String, String> tableNameMapper = {
  "Customer": "입주사",
  "Contract": "계약",
  "Office": "사무실",
  "CustomerMember": "입주고객",
  "OfficeBranch": "지점",
  "Manager": "매니저",
  "ServiceProvider": "운영사",
  "TaxBill": "세금계산서",
  "Sensor": "센서",
  "SensorValue": "센서측정값",
  "GateCredential": "출입권한",
  "Gate": "출입문"
};

Map<String, dynamic> modelNameToModelMapper = {
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
  // "gateCredential": GateCredential,
  // "gate": Gate
};

Map<String, dynamic> modelNameToModelConstructor = {
  "customer": Customer(),
  "contract": Contract(),
  "office": Office(),
  "customerMember": CustomerMember(),
  "officeBranch": OfficeBranch(),
  "manager": Manager(),
  "serviceProvider": ServiceProvider(),
  "taxBill": TaxBill(),
  "sensor": Sensor(),
  "sensorValue": SensorValue(),
  // "gateCredential": GateCredential(),
  // "gate": Gate()
};
