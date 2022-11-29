import 'package:clean_arch/model(DTO)/impl/contract.dart';
import 'package:clean_arch/model(DTO)/impl/customer.dart';
import 'package:clean_arch/view/widget/table/base_table_detail_view/detail__table_view.dart';

List<DetailTableView>? detailTableMapper(String modelName, int id) {
  switch (modelName) {
    case 'Contract':
      return [
        DetailTableView<Contract>(
          id: id,
          modelName: modelName,
        ),
        DetailTableView<Customer>(
          id: id,
          modelName: modelName,
        )
      ];
    case 'Customer':
      return [
        DetailTableView<Contract>(
          id: id,
          modelName: modelName,
        ),
        DetailTableView<Customer>(
          id: id,
          modelName: modelName,
        )
      ];

    default:
      return null;
  }
}

List<String> contractDetailTableName = ["계약", "고객"];
List<String> customerDetailTableName = ["계약", "호갱"];

Map<String, List<String>> detailTableNameMapper = {
  "Customer": customerDetailTableName,
  "Contract": contractDetailTableName
};
