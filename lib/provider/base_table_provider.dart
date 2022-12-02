import 'package:clean_arch/common/constants/enum/search.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';
import 'package:flutter/material.dart';

abstract class IBaseTableProvider<M extends Base> extends ChangeNotifier {
  List<M>? get dataList;
  int get selectedIndex;
  M? get selectedRow;
  List<TextEditingController> get updateButtonTECList;
  List<TextEditingController> get addButtonTECList;
  Search get searched;

  void resetFilterQueryParameters();
  Future<M?> getDetailRowDataById(int id);
  Future<List<M>?> getTableData();
  Future<List<M>?> getDetailTableDataById(String modelName, int id);
  Future<List<M>?> getTableDataBySearchBar(
      String memberName, String queryValue);
  Future<List<M>?> getTableDataByRadioBox(String memberName, Enum queryValue);
  Future<List<M>?> getTableDateByRange(
    String startMemberName,
    String startQueryValue,
    String endMemberName,
    String endQueryValue,
  );

  void changeSelectedIndex(index);
  void setDetailUpdateButtonTECList();
  void setUpdateButtonTECList();
  void setAddButtonTECList();
  void clearAddButtonTECList();

  Future<int?> updateTableRow();
  Future<int?> deleteTableRow();
  Future<int?> createTableRow();
}
