import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:clean_arch/common/constants/mapper/cu_dialog_mapper.dart';
import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/impl/contract.dart';
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

  late M tempDataForCU = _model.getDummy() as M;

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
  M? getDataInDataListById(int id) {
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
  Future<bool> initUpdateButtonTECList() async {
    if (dataList == null) {
      await getTableData();
      ;
    }
    tempDataForCU = getDataInDataListById(selectedId)!;
    if (tempDataForCU == null) {
      return false;
    }
    List<String?> modelMemberList = tempDataForCU.toRow();
    _updateButtonTECList = [];
    List<ColumnAttributes> columnAttributesList =
        columnAttributesMapper[M.toString()]!;
    for (int i = 0; i < modelMemberList.length; i++) {
      updateButtonTECList.add(TextEditingController());
      if (columnAttributesList[i].enumValus != null) {
        initUpdateEnumValue(
            tempDataForCU.getMember(columnAttributesList[i].toJson!), i);
      }

      updateButtonTECList[i].text = modelMemberList[i]!;
    }
    return true;
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
  void clearAddButtonTECList() {
    for (int i = 0; i < addButtonTECList.length; i++) {
      addButtonTECList[i].text = "";
    }
  }

  @override
  void setDataForCreate() {
    List<ColumnAttributes> columnAttributesList =
        columnAttributesMapper[M.toString()]!;
    int lenght = columnAttributesList.length;
    for (int i = 1; i < lenght; i++) {
      if (columnAttributesList[i].isCuDialog == true) {
        continue;
      }

      tempDataForCU.setMember(
          columnAttributesList[i].toJson!, addButtonTECList[i].text);
    }
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

      tempDataForCU.setMember(
          columnAttributesList[i].toJson!, updateButtonTECList[i].text);
    }
  }

  @override
  Future<int?> updateTableRow() async {
    return await _repo.updateTableRow(tempDataForCU);
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
      return await _repo.createTableRow(tempDataForCU);
    } finally {}
  }

  @override
  void setCuDialog(ColumnAttributes columnAttributes, Type fromModel,
      BuildContext context, String mode) {
    TableProvider tableProvider =
        ClassBuilder.getTableProvider(fromModel, false, context)!;

    columnAttributes.cuDialogTextMapper!.forEach((key, value) {
      tableProvider.addButtonTECList[key].text =
          getDataInDataListById(selectedId)!.getMember(value);
    });

    switch (mode) {
      case "create":
        columnAttributes.cuDialogTextMapper!.forEach((key, value) {
          tableProvider.addButtonTECList[key].text =
              getDataInDataListById(selectedId)!.getMember(value);
        });
        break;
      case "update":
        columnAttributes.cuDialogTextMapper!.forEach((key, value) {
          tableProvider.updateButtonTECList[key].text =
              getDataInDataListById(selectedId)!.getMember(value);
        });
        break;
      default:
    }

    columnAttributes.cuDialogJsonMapper!.forEach((key, value) {
      tableProvider.tempDataForCU
          .setMember(key, getDataInDataListById(selectedId)!.getMember(value));
    });
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
