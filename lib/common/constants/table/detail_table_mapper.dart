import 'package:clean_arch/model(DTO)/impl/contract.dart';
import 'package:clean_arch/model(DTO)/impl/customer_memeber.dart';
import 'package:clean_arch/model(DTO)/impl/gate_credential.dart';
import 'package:clean_arch/model(DTO)/impl/manager.dart';
import 'package:clean_arch/model(DTO)/impl/office.dart';
import 'package:clean_arch/model(DTO)/impl/office_branch.dart';
import 'package:clean_arch/model(DTO)/impl/sensor.dart';
import 'package:clean_arch/model(DTO)/impl/tax_bill.dart';
import 'package:clean_arch/view/widget/table/base_table_detail_view/detail__table_view.dart';

List<DetailTableView>? detailTableMapper(String modelName, int id) {
  switch (modelName) {
    case 'Contract': //세금계산서서
      return [
        DetailTableView<TaxBill>(
          id: id,
          modelName: modelName,
        ),
      ];

    case 'CustomerMember': //출입권한
      return [
        DetailTableView<GateCredential>(
          id: id,
          modelName: modelName,
        ),
      ];

    case 'Customer': // 계약, 입주멤버
      return [
        DetailTableView<Contract>(
          id: id,
          modelName: modelName,
        ),
        DetailTableView<CustomerMember>(
          id: id,
          modelName: modelName,
        ),
      ];
    case 'Office': //센서
      return [
        DetailTableView<Sensor>(
          id: id,
          modelName: modelName,
        ),
      ];
    case 'OfficeBranch': //사무실
      return [
        DetailTableView<Office>(
          id: id,
          modelName: modelName,
        ),
      ];
    case 'Manager': //계약
      return [
        DetailTableView<Contract>(
          id: id,
          modelName: modelName,
        ),
      ];
    case 'ServiceProvider': //매니저, 지점
      return [
        DetailTableView<Manager>(
          id: id,
          modelName: modelName,
        ),
        DetailTableView<OfficeBranch>(
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

List<String> contractDetailTableName = ["세금계산서"];
List<String> customerDetailTableName = ["계약", "입주멤버"];
List<String> officeDetailTableName = ["센서"];
List<String> officeBranchDetailTableName = ["사무실"];
List<String> customerMemberDetailTableName = ["출입권한"];
List<String> managerDetailTableName = ["계약"];
List<String> serviceProviderDetailTableName = ["매니저", "지점"];
List<String> taxBillDetailTableName = [];
List<String> sensorDetailTableName = [];
List<String> gateCredentialDetailTableName = [];
List<String> gateDetailTableName = [];
Map<String, List<String>> detailTableNameListMapper = {
  "Customer": customerDetailTableName,
  "Contract": contractDetailTableName,
  "Office": officeDetailTableName,
  "CustomerMember": customerMemberDetailTableName,
  "OfficeBranch": officeBranchDetailTableName,
  "Manager": managerDetailTableName,
  "ServiceProvider": serviceProviderDetailTableName,
  "TaxBill": taxBillDetailTableName,
  "Sensor": sensorDetailTableName,
  "GateCredential": gateCredentialDetailTableName,
  "Gate": gateDetailTableName
};

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
  "GateCredential": "출입권한",
  "Gate": "출입문"
};
