import 'package:clean_arch/model/base_model.dart';

abstract class IBaseTableRepository<M extends Base> {
  Future<List<M>?> getTableData();
  Future<M?> getDataById(int id);
  Future<List<M>?> getRelatedTableDataById(
      String modelName, int id, String relation);

  Future<List<M>?> getTableDataBySearchBar(
      String memberName, String queryValue);
  Future<List<M>?> getTableDataByRadioBox(String memberName, Enum queryValue);
  Future<List<M>?> getTableDateByRange(
    String startMemberName,
    String startQueryValue,
    String endMemberName,
    String endQueryValue,
  );
  Future<Map<String, dynamic>> updateTableRow(M dataForUpdate);
  Future<Map<String, dynamic>> deleteTableRow(int id);
  Future<Map<String, dynamic>> createTableRow(M dataForCreate);
  Future<Map<String, dynamic>> getBoadrViewDataById(int id);
}
