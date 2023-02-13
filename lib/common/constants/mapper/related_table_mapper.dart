import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/manager.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:clean_arch/model/impl/sensor.dart';
import 'package:clean_arch/model/impl/sensor_value.dart';
import 'package:clean_arch/model/impl/service_provider.dart';
import 'package:clean_arch/view/widget/table/table_related_view/related_table_view.dart';

List<RelatedTableView>? getRelatedTableList(
    String modelName, int id, Base model) {
  switch (modelName) {
    case 'Contract': //입주사, 매니저, 사무실
      return [
        RelatedTableView<Customer>(
          id: id,
          modelName: modelName,
          relation: "N:1",
          model: model,
          isCreate: false,
          isDelete: false,
        ),
        RelatedTableView<Manager>(
          id: id,
          modelName: modelName,
          relation: "N:1",
          model: model,
          isCreate: false,
          isDelete: false,
        ),
        // RelatedTableView<Office>(
        //   id: id,
        //   modelName: modelName,
        //   relation: "N:1",
        //   model: model,
        // ),
      ];

    case 'CustomerMember': //출입권한, 입주사
      return [
        // RelatedTableView<GateCredential>(
        //   id: id,
        //   modelName: modelName,
        //   relation: "1:N",
        // ),
        RelatedTableView<Customer>(
          id: id,
          modelName: modelName,
          relation: "N:1",
          model: model,
          isCreate: false,
          isDelete: false,
        ),
      ];

    case 'Customer': // 계약, 입주멤버 ,사무실,매니저
      return [
        RelatedTableView<Contract>(
          id: id,
          modelName: modelName,
          relation: "1:N",
          isCreate: true,
          isDelete: false,
        ),
        RelatedTableView<CustomerMember>(
          id: id,
          modelName: modelName,
          relation: "1:N",
          isCreate: true,
          isDelete: true,
        ),
        // RelatedTableView<Office>(
        //   id: id,
        //   modelName: modelName,
        //   relation: "1:N",
        // ),
        // RelatedTableView<Manager>(
        //   id: id,
        //   modelName: modelName,
        //   relation: "1:N",
        // ),
      ];
    case 'Office': //입주사 ,매니저 , 지점 ,센서
      return [
        // RelatedTableView<Customer>(
        //   id: id,
        //   modelName: modelName,
        //   relation: "1:N",
        // ),
        // RelatedTableView<Manager>(
        //   id: id,
        //   modelName: modelName,
        //   relation: "1:N",
        // ),
        RelatedTableView<OfficeBranch>(
          id: id,
          modelName: modelName,
          relation: "N:1",
          model: model,
          isCreate: false,
          isDelete: false,
        ),
        RelatedTableView<Sensor>(
          id: id,
          modelName: modelName,
          relation: "1:N",
          isCreate: true,
          isDelete: true,
        ),
      ];
    case 'OfficeBranch': // 운영사, 사무실,매니저
      return [
        RelatedTableView<ServiceProvider>(
          id: id,
          modelName: modelName,
          relation: "N:1",
          model: model,
          isCreate: false,
          isDelete: false,
        ),
        RelatedTableView<Office>(
          id: id,
          modelName: modelName,
          relation: "1:N",
          isCreate: true,
          isDelete: true,
        ),
        // RelatedTableView<Manager>(
        //   id: id,
        //   modelName: modelName,
        //   relation: "1:N",
        // ),
      ];
    case 'Manager': //계약 ,지점 ,운영사
      return [
        RelatedTableView<Contract>(
          id: id,
          modelName: modelName,
          relation: "1:N",
          isCreate: false,
          isDelete: false,
        ),
        // RelatedTableView<OfficeBranch>(
        //   id: id,
        //   modelName: modelName,
        //   relation: "1:N",
        // ),
        RelatedTableView<ServiceProvider>(
          id: id,
          modelName: modelName,
          relation: "N:1",
          model: model,
          isCreate: false,
          isDelete: false,
        ),
      ];
    case 'ServiceProvider': //매니저, 지점
      return [
        RelatedTableView<Manager>(
          id: id,
          modelName: modelName,
          relation: "1:N",
          isCreate: true,
          isDelete: true,
        ),
        RelatedTableView<OfficeBranch>(
          id: id,
          modelName: modelName,
          relation: "1:N",
          isCreate: true,
          isDelete: true,
        )
      ];
    case 'TaxBill': //계약
      return [
        RelatedTableView<Contract>(
          id: id,
          modelName: modelName,
          relation: "N:1",
          model: model,
          isCreate: false,
          isDelete: false,
        ),
      ];
    case 'Sensor': //센서측정값 사무실
      return [
        RelatedTableView<SensorValue>(
          id: id,
          modelName: modelName,
          relation: "1:N",
          isCreate: false,
          isDelete: true,
        ),
        RelatedTableView<Office>(
          id: id,
          modelName: modelName,
          relation: "N:1",
          model: model,
          isCreate: false,
          isDelete: false,
        ),
      ];
    case 'SensorValue': //센서
      return [
        RelatedTableView<Sensor>(
          id: id,
          modelName: modelName,
          relation: "N:1",
          model: model,
          isCreate: false,
          isDelete: false,
        ),
      ];
    case 'GateCredential':
      return [];
    case 'Gate':
      return [];

    default:
      return null;
  }
}

List<String> contractRelatedTableName = [
  "입주고객", "매니저",
// "사무실"
];
List<String> customerRelatedTableName = [
  "계약", "입주멤버",
// "사무실", "매니저"
];
List<String> officeRelatedTableName = [
  // "입주사", "매니저",
  "지점", "센서"
];
List<String> officeBranchRelatedTableName = [
  "운영사", "사무실",
// "매니저"
];
List<String> customerMemberRelatedTableName = [
  // '출입권한',
  '입주고객'
];
List<String> managerRelatedTableName = [
  "계약",
//  "지점",
  "운영사"
];
List<String> serviceProviderRelatedTableName = ["매니저", "지점"];
List<String> taxBillRelatedTableName = ["계약"];
List<String> sensorRelatedTableName = ["센서측정값", "사무실"];
List<String> sensorValueRelatedTableName = ["센서"];
List<String> gateCredentialRelatedTableName = [];
List<String> gateRelatedTableName = [];
Map<String, List<String>> relatedTableNameListMapper = {
  "Customer": customerRelatedTableName,
  "Contract": contractRelatedTableName,
  "Office": officeRelatedTableName,
  "CustomerMember": customerMemberRelatedTableName,
  "OfficeBranch": officeBranchRelatedTableName,
  "Manager": managerRelatedTableName,
  "ServiceProvider": serviceProviderRelatedTableName,
  "TaxBill": taxBillRelatedTableName,
  "Sensor": sensorRelatedTableName,
  "SensorValue": sensorValueRelatedTableName,
  "GateCredential": gateCredentialRelatedTableName,
  "Gate": gateRelatedTableName
};
