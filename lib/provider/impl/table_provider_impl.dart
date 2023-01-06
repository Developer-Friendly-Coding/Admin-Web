import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/provider/table_provider.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/repo/impl/base_table_repo_impl.dart';
import 'package:clean_arch/common/util/class_builder.dart';

class TableProvider<M extends Base> extends ChangeNotifier {
  final BaseTableRepository<M> _repo;

  final M _model = ClassBuilder.fromString(M.toString()) as M;

  TableProvider({BaseTableRepository<M>? repo})
      : _repo = repo ?? BaseTableRepository<M>();

  List<M>? _dataList;
  @override
  List<M>? get dataList => _dataList;

  List<M> dataListInCreate = [];

  int _selectedId = -1;
  @override
  int get selectedId => _selectedId;

  List<int> multiCuDialogIdList = [];

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
  M? getDataById(id) {
    M? data;
    dataList!.forEach((element) {
      if (element.getMember("id") == id) {
        data = element;
      }
    });
    return data;
  }

  @override
  Future<List<M>?> getRelatedTableDataById(modelName, id) async {
    try {
      _dataList = await _repo.getRelatedTableDataById(modelName, id);

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
  void setSelectedId(dynamic data) {
    if (data.runtimeType == int) {
      _selectedId = data;
    } else if (data.runtimeType == M) {
      _selectedId = data.getMember("id");
      notifyListeners();
    } else {
      print("id값이나 model data를 입력해주세요");
    }
  }

  @override
  bool isSelectedId(M data) {
    return _selectedId == data.getMember("id") ? true : false;
  }

  @override
  void clearAddButtonTECList() {
    for (int i = 0; i < addButtonTECList.length; i++) {
      addButtonTECList[i].text = "";
    }
  }

  M? tempUpdateData;

  @override
  Future<void> initUpdateButtonTECList() async {
    if (dataList == null) {
      await getTableData();
    }

    tempUpdateData = getDataById(selectedId);

    List<String?> modelMemberList = tempUpdateData!.toRow();
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
      return await _repo.deleteTableRow(selectedId);
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
      TableProvider cuDialogProvider, String mode) async {
    M? data = getDataById(selectedId);
    switch (mode) {
      case "create":
        targetMapper.forEach((key, value) {
          cuDialogProvider.addButtonTECList[key].text =
              data!.getMember(value).toString();
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
  void setMultiCuDialogId(int id) {
    multiCuDialogIdList.contains(id)
        ? multiCuDialogIdList.remove(id)
        : multiCuDialogIdList.add(id);
    notifyListeners();
  }

  @override
  bool isMultiCuDialogContainId(int id) {
    return multiCuDialogIdList.contains(id) ? true : false;
  }

  @override
  void clearMultiCuDialogIndexList() {
    multiCuDialogIdList.clear();
    notifyListeners();
  }
}
