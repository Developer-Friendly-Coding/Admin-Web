import 'package:clean_arch/common/constants/mapper/cu_dialog_mapper.dart';
import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/provider/base_table_provider.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/repo/impl/base_table_repo_impl.dart';
import 'package:clean_arch/common/util/class_builder.dart';

class BaseTableProvider<M extends Base> extends ChangeNotifier
    implements IBaseTableProvider {
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

  List<int> multiCuDialogSelectedIndexList = [];

  late List<TextEditingController> _updateButtonTECList;
  @override
  List<TextEditingController> get updateButtonTECList => _updateButtonTECList;

  late List<TextEditingController> _addButtonTECList;
  @override
  List<TextEditingController> get addButtonTECList => _addButtonTECList;

  Map<int, Enum> _createEnumValuesMapper = {};
  @override
  Map<int, Enum> get createEnumValuesMapper => _createEnumValuesMapper;

  Map<int, Enum> _updateEnumValuesMapper = {};
  @override
  Map<int, Enum> get updateEnumValuesMapper => _updateEnumValuesMapper;

  @override
  bool initCreateEnumValue(Enum value, int idx) {
    createEnumValuesMapper[idx] = value;
    addButtonTECList[idx].text = value.toString();
    return true;
  }

  @override
  bool setCreateEnumValue(Enum value, int idx) {
    createEnumValuesMapper[idx] = value;
    notifyListeners();
    return true;
  }

  @override
  bool initUpdateEnumValue(Enum value, int idx) {
    updateEnumValuesMapper[idx] = value;
    updateButtonTECList[idx].text = value.toString();
    return true;
  }

  @override
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
  void initAddButtonTECList() {
    int length = _model.toRow().length;
    _addButtonTECList = [];
    for (int i = 0; i < length; i++) {
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
  Future<List<dynamic>> createTableRow() async {
    try {
      return await _repo.createTableRow(_model.fromTEC(addButtonTECList));
    } finally {}
  }

  @override
  void setCuDialogTEC(Map<int, String> targetMapper,
      BaseTableProvider cuDialogProvider, String mode) {
    switch (mode) {
      case "create":
        targetMapper.forEach((key, value) {
          cuDialogProvider.addButtonTECList[key].text =
              dataList[selectedIndex].getMember(value).toString();
        });
        break;
      case "update":
        targetMapper.forEach((key, value) {
          cuDialogProvider.updateButtonTECList[key].text = value;
        });
        break;
      default:
    }
  }

  @override
  void setMultiCuDialogSelectedIndex(int idx) {
    multiCuDialogSelectedIndexList.contains(idx)
        ? multiCuDialogSelectedIndexList.remove(idx)
        : multiCuDialogSelectedIndexList.add(idx);
    notifyListeners();
  }

  @override
  bool isMultiCuDialogContainIndex(int idx) {
    return multiCuDialogSelectedIndexList.contains(idx) ? true : false;
  }
}
