import 'package:clean_arch/common/constants/enum/search.dart';
import 'package:clean_arch/common/constants/table/table_column_attributes_mapper.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/provider/base_table_provider.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/repo/impl/base_table_repo_impl.dart';

import 'package:clean_arch/common/util/class_builder.dart';

class BaseTableProvider<M extends Base> extends ChangeNotifier
    implements IBaseTableProvider {
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;

  final BaseTableRepository<M> _repo;

  final M _model = ClassBuilder.fromString(M.toString()) as M;

  BaseTableProvider({BaseTableRepository<M>? repo})
      : _repo = repo ?? BaseTableRepository<M>();

  List<M>? _dataList;
  @override
  List<M> get dataList => _dataList!;

  M? _selectedRow;
  @override
  M get selectedRow => _selectedRow!;

  int _selectedIndex = -1;
  @override
  int get selectedIndex => _selectedIndex;

  late List<TextEditingController> _updateButtonTECList;
  @override
  List<TextEditingController> get updateButtonTECList => _updateButtonTECList;

  late List<TextEditingController> _addButtonTECList;
  @override
  List<TextEditingController> get addButtonTECList => _addButtonTECList;

  Map<int, Enum> createEnumValuesMapper = {};
  bool initCreateEnumValue(Enum value, int idx) {
    createEnumValuesMapper[idx] = value;
    addButtonTECList[idx].text = value.toString();
    return true;
  }

  bool setCreateEnumValue(Enum value, int idx) {
    createEnumValuesMapper[idx] = value;
    notifyListeners();
    return true;
  }

  Map<int, Enum> updateEnumValuesMapper = {};
  bool initUpdateEnumValue(Enum value, int idx) {
    updateEnumValuesMapper[idx] = value;
    updateButtonTECList[idx].text = value.toString();
    return true;
  }

  bool setUpdateEnumValue(Enum value, int idx) {
    updateEnumValuesMapper[idx] = value;
    notifyListeners();
    return true;
  }

  @override
  Future<List<M>?> getTableData() async {
    try {
      _dataList = await _repo.getTableData();

      return dataList;
    } catch (e) {
      debugPrint(e.toString());

      return null;
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<M?> getDetailRowDataById(id) async {
    try {
      _selectedRow = await _repo.getDetailRowDataById(id);

      return _selectedRow;
    } catch (e) {
      debugPrint(e.toString());

      return null;
    } finally {}
  }

  @override
  Future<List<M>?> getDetailTableDataById(modelName, id) async {
    try {
      _dataList = await _repo.getDetailTableDataById(modelName, id);

      return dataList;
    } catch (e) {
      debugPrint(e.toString());

      return null;
    } finally {}
  }

  @override
  Future<List<M>?> getTableDataBySearchBar(
      String memberName, String queryValue) async {
    try {
      _dataList = await _repo.getTableDataBySearchBar(memberName, queryValue);

      return dataList;
    } catch (e) {
      debugPrint(e.toString());

      return null;
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<List<M>?> getTableDataByRadioBox(
      String memberName, Enum queryValue) async {
    try {
      _dataList = await _repo.getTableDataByRadioBox(memberName, queryValue);

      return dataList;
    } catch (e) {
      debugPrint(e.toString());

      return null;
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<List<M>?> getTableDateByRange(
    String startMemberName,
    String startQueryValue,
    String endMemberName,
    String endQueryValue,
  ) async {
    try {
      _dataList = await _repo.getTableDateByRange(
          startMemberName, startQueryValue, endMemberName, endQueryValue);

      return dataList;
    } catch (e) {
      debugPrint(e.toString());

      return null;
    } finally {
      notifyListeners();
    }
  }

  @override
  void changeSelectedIndex(index) {
    _selectedIndex = index;
    notifyListeners();
  }

  @override
  void clearAddButtonTECList() {
    for (int i = 0; i < addButtonTECList.length; i++) {
      addButtonTECList[i].text = "";
    }
  }

  @override
  void initUpdateButtonTECList() {
    List<String?> modelMemberList = dataList[selectedIndex].toRow();
    _updateButtonTECList = [];
    for (int i = 0; i < modelMemberList.length; i++) {
      updateButtonTECList.add(TextEditingController());
      updateButtonTECList[i].text = modelMemberList[i]!;
    }
  }

  @override
  void initDetailUpdateButtonTECList() {
    try {
      List<String?> modelMemberList = selectedRow.toRow();
      _updateButtonTECList = [];
      for (int i = 0; i < modelMemberList.length; i++) {
        updateButtonTECList.add(TextEditingController());
        updateButtonTECList[i].text = modelMemberList[i]!;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {}
  }

  @override
  void initAddButtonTECList() {
    print('ee');
    List<String?> modelMemberList = dataList[0].toRow();
    _addButtonTECList = [];
    for (int i = 0; i < modelMemberList.length; i++) {
      addButtonTECList.add(TextEditingController());
      addButtonTECList[i].text = "";
    }
  }

  @override
  Future<int?> updateTableRow() async {
    return await _repo.updateTableRow(_model.fromTEC(updateButtonTECList));
  }

  @override
  Future<int?> deleteTableRow() async {
    try {
      return await _repo.deleteTableRow(dataList[selectedIndex]);
    } finally {}
  }

  @override
  Future<int?> createTableRow() async {
    try {
      addButtonTECList.forEach((tec) => print(tec.text));
      return await _repo.createTableRow(_model.fromTEC(addButtonTECList));
    } finally {}
  }
}
