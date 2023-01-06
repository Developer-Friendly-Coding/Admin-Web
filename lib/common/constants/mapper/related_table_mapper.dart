import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/gate_credential.dart';
import 'package:clean_arch/model/impl/manager.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:clean_arch/model/impl/sensor.dart';
import 'package:clean_arch/model/impl/tax_bill.dart';
import 'package:clean_arch/view/widget/table/table_detail_view/related_table_view.dart';

List<RelatedTableView>? getRelatedTableList(String modelName, int id) {
  switch (modelName) {
    case 'Contract': //세금계산서서
      return [
        RelatedTableView<TaxBill>(
          id: id,
          modelName: modelName,
        ),
      ];

    case 'CustomerMember': //출입권한
      return [
        RelatedTableView<GateCredential>(
          id: id,
          modelName: modelName,
        ),
      ];

    case 'Customer': // 계약, 입주멤버
      return [
        RelatedTableView<Contract>(
          id: id,
          modelName: modelName,
        ),
        RelatedTableView<CustomerMember>(
          id: id,
          modelName: modelName,
        ),
      ];
    case 'Office': //센서
      return [
        RelatedTableView<Sensor>(
          id: id,
          modelName: modelName,
        ),
      ];
    case 'OfficeBranch': //사무실
      return [
        RelatedTableView<Office>(
          id: id,
          modelName: modelName,
        ),
      ];
    case 'Manager': //계약
      return [
        RelatedTableView<Contract>(
          id: id,
          modelName: modelName,
        ),
      ];
    case 'ServiceProvider': //매니저, 지점
      return [
        RelatedTableView<Manager>(
          id: id,
          modelName: modelName,
        ),
        RelatedTableView<OfficeBranch>(
          id: id,
          modelName: modelName,
        )
      ];
    case 'TaxBill': //지점 사무실
      return [];
    case 'Sensor': //지점 사무실
      return [];
    case 'GateCredential': //지점 사무실
      return [];
    case 'Gate': //지점 사무실
      return [];

    default:
      return null;
  }
}

List<String> contractRelatedTableName = ["세금계산서"];
List<String> customerRelatedTableName = ["계약", "입주멤버"];
List<String> officeRelatedTableName = ["센서"];
List<String> officeBranchRelatedTableName = ["사무실"];
List<String> customerMemberRelatedTableName = ["출입권한"];
List<String> managerRelatedTableName = ["계약"];
List<String> serviceProviderRelatedTableName = ["매니저", "지점"];
List<String> taxBillRelatedTableName = [];
List<String> sensorRelatedTableName = [];
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
  "GateCredential": gateCredentialRelatedTableName,
  "Gate": gateRelatedTableName
};
