import 'package:clean_arch/model/base_model.dart';

abstract class IBaseTableRepository<M extends Base> {
  Future<List<M>?> getTableData();
  Future<List<M>?> getTableDataBySearchBar(
      String memberName, String queryValue);
  Future<M?> getDataById(int id);
  Future<List<M>?> getRelatedTableDataById(String modelName, int id);
  Future<List<M>?> getTableDataByRadioBox(String memberName, Enum queryValue);
  Future<List<M>?> getTableDateByRange(
    String startMemberName,
    String startQueryValue,
    String endMemberName,
    String endQueryValue,
  );
  Future<int?> updateTableRow(M selectedTableRow);
  Future<int?> deleteTableRow(M selectedTableRow);
  Future<List<dynamic>> createTableRow(M addedTableRow);
}
