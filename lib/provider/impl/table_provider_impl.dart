import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/common/constants/mapper/table_name_mapper.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/provider/table_provider.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/repo/impl/base_table_repo_impl.dart';
import 'package:clean_arch/common/util/class_builder.dart';
import 'package:recase/recase.dart';

class TableProvider<M extends Base> extends ChangeNotifier {
  final BaseTableRepository<M> _repo;

  TableProvider({BaseTableRepository<M>? repo})
      : _repo = repo ?? BaseTableRepository<M>();

  List<M>? _dataList;
  @override
  List<M>? get dataList => _dataList;

  List<M>? _relatedDataList;
  @override
  List<M>? get relatedDataList => _relatedDataList;

  List<M>? _cuDialogDataList;
  @override
  List<M>? get cuDialogDataList => _cuDialogDataList;

  M? _dataForCU = modelNameToModelConstructor[ReCase(M.toString()).camelCase];
  @override
  M? get dataForCU => _dataForCU;

  List<M> _tempDataListInCreate = [];
  @override
  List<M> get tempDataListInCreate => _tempDataListInCreate;

  int _selectedId = -1;
  @override
  int get selectedId => _selectedId;

  List<int> _multiCuDialogIdList = [];
  @override
  List<int> get multiCuDialogIdList => _multiCuDialogIdList;

  late List<TextEditingController> _updateButtonTECList;
  @override
  List<TextEditingController> get updateButtonTECList => _updateButtonTECList;

  late List<TextEditingController> _addButtonTECList;
  @override
  List<TextEditingController> get addButtonTECList => _addButtonTECList;
///////////////////////////////////////////////////////
//////////////////////////////////////////////////////
  Map<String, String> _queryParameters = {};
  @override
  Map<String, String> get queryParameters => _queryParameters;
  @override
  bool setQueryParameters(String name, String value) {
    queryParameters[name] = value;
    return true;
  }

  @override
  bool removeQueryParameters(String name) {
    queryParameters.removeWhere((key, value) => key == name);
    return true;
  }

///////////////////////////////////////////////////////
//////////////////////////////////////////////////////
  Map<int, String> _searchStringValuesMapper = {};
  @override
  Map<int, String> get searchStringValuesMapper => _searchStringValuesMapper;

  @override
  bool setSearchStringValue(value, idx) {
    searchStringValuesMapper[idx] = value;
    return true;
  }

  @override
  bool clearSearchStringValue() {
    searchStringValuesMapper.clear();
    return true;
  }

///////////////////////////////////////////////////////
//////////////////////////////////////////////////////
  @override
  void clearGetAPiQuery() {
    _repo.clearFilterQueryParameters();
  }

///////////////////////////////////////////////////////
//////////////////////////////////////////////////////

  Map<int, bool> _isCheckedListMapper = {};
  @override
  Map<int, bool> get isCheckedListMapper => _isCheckedListMapper;

  @override
  void setCheck(int index) {
    if (isCheckedListMapper[index] == null) {
      isCheckedListMapper.clear();
      isCheckedListMapper[index] = true;
    } else {
      (isCheckedListMapper[index] = !isCheckedListMapper[index]!);
    }
    isCheckedListMapper[index] == true
        ? setSelectedId(dataList![index].getMember("id"))
        : setSelectedId(-1);
    notifyListeners();
  }

  @override
  bool isChecked(int index) {
    return isCheckedListMapper[index] ?? false;
  }
///////////////////////////////////////////////////////
//////////////////////////////////////////////////////

  @override
  Future<bool> getData() async {
    try {
      _dataList = await _repo.getTableData();
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<bool> getCuDialogData() async {
    try {
      _cuDialogDataList = await _repo.getTableData();

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    } finally {
      notifyListeners();
    }
  }

  @override
  M? getDataInDataListById(id) {
    M? data;

    dataList!.forEach((element) {
      if (element.getMember("id") == id) {
        data = element;
      }
    });
    return data;
  }

  @override
  M? getDataInCuDataListById(id) {
    M? data;

    cuDialogDataList!.forEach((element) {
      if (element.getMember("id") == id) {
        data = element;
      }
    });

    return data;
  }

  @override
  Future<M?> getDataById(id) async {
    M? data = await _repo.getDataById(id);
    return data;
  }

  @override
  Future<bool> getDataClearFilter() async {
    try {
      _queryParameters = {};
      _dataList = await _repo.getTableDataByClearFilter();

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<bool> getDataClearFilterForCuDialog() async {
    try {
      _queryParameters = {};
      _cuDialogDataList = await _repo.getTableDataByClearFilter();
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<bool> getDataBySearchFilter() async {
    try {
      _dataList = await _repo.getTableDataBySearchFilter(queryParameters);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<bool> getDataBySearchFilterForCuDialog() async {
    try {
      _cuDialogDataList =
          await _repo.getTableDataBySearchFilter(queryParameters);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<bool> getRelatedDataById(modelName, id, relation) async {
    try {
      _relatedDataList =
          await _repo.getRelatedTableDataById(modelName, id, relation);

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<bool> getDataBySearchBar(memberName, queryValue) async {
    try {
      _dataList = await _repo.getTableDataBySearchBar(memberName, queryValue);

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<bool> getDataByRadioBox(memberName, queryValue) async {
    try {
      _dataList = await _repo.getTableDataByRadioBox(memberName, queryValue);

      return true;
    } catch (e) {
      debugPrint(e.toString());

      return false;
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<bool> getDateByRange(
    String startMemberName,
    String startQueryValue,
    String endMemberName,
    String endQueryValue,
  ) async {
    try {
      _dataList = await _repo.getTableDateByRange(
          startMemberName, startQueryValue, endMemberName, endQueryValue);

      return true;
    } catch (e) {
      debugPrint(e.toString());

      return false;
    } finally {
      notifyListeners();
    }
  }

  @override
  void setSelectedId(int id) {
    _selectedId = id;
    notifyListeners();
  }

  @override
  Future<bool> initDataForCuAndUpdateTextList(int selectedId) async {
    _selectedId = selectedId;
    _dataForCU = await _repo.getDataById(selectedId);
    if (dataForCU == null) {
      return false;
    }
    List<String> modelMemberList = dataForCU!.toRow();

    _updateButtonTECList = [];
    List<ColumnAttributes> columnAttributesList =
        columnAttributesMapper[M.toString()]!;

    for (int i = 0; i < modelMemberList.length; i++) {
      updateButtonTECList.add(TextEditingController());
      if (columnAttributesList[i].enumValus != null) {}

      updateButtonTECList[i].text = modelMemberList[i];
    }
    notifyListeners();
    return true;
  }

  @override
  void initAddTextList() {
    print(123);
    _dataForCU = modelNameToModelConstructor[ReCase(M.toString()).camelCase];
    int length = dataForCU!.toRow().length;
    _addButtonTECList = [];
    for (int i = 0; i < length; i++) {
      addButtonTECList.add(TextEditingController());
      addButtonTECList[i].text = "";
    }
  }

  @override
  void clearAddTextList() {
    for (int i = 0; i < addButtonTECList.length; i++) {
      addButtonTECList[i].text = "";
    }
  }

  @override
  void setDataForCreate() {
    List<ColumnAttributes> columnAttributesList =
        columnAttributesMapper[M.toString()]!;
    print(999);
    int lenght = columnAttributesList.length;
    for (int i = 1; i < lenght; i++) {
      if (columnAttributesList[i].isCuDialog == true) {
        continue;
      }

      dataForCU!.setMemberByText(
          columnAttributesList[i].toJson!, addButtonTECList[i].text);
    }
    print(333);
  }

  @override
  void setDataForUpdate() {
    List<ColumnAttributes> columnAttributesList =
        columnAttributesMapper[M.toString()]!;
    int lenght = columnAttributesList.length;
    for (int i = 1; i < lenght; i++) {
      if (columnAttributesList[i].isCuDialog == true) {
        continue;
      }

      dataForCU!.setMemberByText(
          columnAttributesList[i].toJson!, updateButtonTECList[i].text);
    }
    print(dataForCU!.toRow());
  }

  @override
  Future<Map<String, dynamic>> updateTableRow() async {
    try {
      return await _repo.updateTableRow(dataForCU!);
    } finally {}
  }

  @override
  Future<Map<String, dynamic>> deleteTableRow() async {
    try {
      Map<String, dynamic> result = await _repo.deleteTableRow(selectedId);
      return result;
    } finally {}
  }

  @override
  Future<Map<String, dynamic>> createTableRow() async {
    try {
      return await _repo.createTableRow(dataForCU!);
    } finally {}
  }

  @override
  void setCuDialog(columnAttributes, fromModel, context, mode, controller) {
    TableProvider tableProvider =
        ClassBuilder.getTableProvider(fromModel, false, context)!;
    if (mode == 'search') {
      controller!.text = getDataInCuDataListById(selectedId)!
          .getMember(columnAttributes.cuDialogSearchTextTarget!);

      tableProvider.setQueryParameters(
          columnAttributes.cuDialogSearchQueryTarget!, selectedId.toString());
      return;
    } else {
      switch (mode) {
        case "create":
          columnAttributes.cuDialogTextMapper!.forEach((key, value) {
            tableProvider.addButtonTECList[key].text =
                getDataInCuDataListById(selectedId)!.getMember(value);
            controller!.text = getDataInCuDataListById(selectedId)!
                .getMember(value)
                .toString();
            print(tableProvider.addButtonTECList[key].text);
            print(controller.text);
          });
          break;
        case "update":
          columnAttributes.cuDialogTextMapper!.forEach((key, value) {
            tableProvider.updateButtonTECList[key].text =
                getDataInCuDataListById(selectedId)!
                    .getMember(value)
                    .toString();

            controller!.text = getDataInCuDataListById(selectedId)!
                .getMember(value)
                .toString();
          });
          break;
        default:
      }

      columnAttributes.cuDialogJsonMapper!.forEach((key, value) {
        tableProvider.dataForCU!.setMemberById(
            key, getDataInCuDataListById(selectedId)!.getMember(value));
      });
    }
    notifyListeners();
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

  @override
  Future<Map<String, dynamic>> getBoadrViewDataById(int id) async {
    Map<String, dynamic> data = await _repo.getBoadrViewDataById(id);
    return data;
  }

  @override
  Future<void> addTempDataListInCreate() async {
    int length = multiCuDialogIdList.length;
    for (int i = 0; i < length; i++) {
      M? temp = await getDataById(multiCuDialogIdList[i]);
      tempDataListInCreate.add(temp!);
    }

    notifyListeners();
  }

  @override
  void removeTempDataListInCreate(int index) {
    tempDataListInCreate.removeAt(index);
    notifyListeners();
  }

  @override
  void clearTempDataListInCreate() {
    tempDataListInCreate.clear();
    notifyListeners();
  }

  Map<int, bool> isSelectedRelatedTableMapper = {0: true};
  int selectedRelatedTableindex = 0;
  @override
  bool isSelectedRelatedTable(int index) {
    return isSelectedRelatedTableMapper[index] ?? false;
  }

  @override
  void setIsSelectedRelatedTable(int index) {
    if (isSelectedRelatedTableMapper[index] == null) {
      isSelectedRelatedTableMapper.clear();
      isSelectedRelatedTableMapper[index] = true;
    }
    selectedRelatedTableindex = index;
    notifyListeners();
  }
}
