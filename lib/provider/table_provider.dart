import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/material.dart';

abstract class ITableProvider<M extends Base> extends ChangeNotifier {
  List<M>? get dataList;
  int get selectedId;
  M? get dataForCU;
  List<M> get tempDataListInCreate;
  List<int> get multiCuDialogIdList;
  List<TextEditingController> get updateButtonTECList;
  List<TextEditingController> get addButtonTECList;
  Map<int, Enum> get createEnumValuesMapper;
  Map<int, Enum> get updateEnumValuesMapper;

  ///테이블 열 추가 페이지에서 enum 값들은 dropDownMenu로 나타내는데, 처음 페이지 접속시 각각의 dropDownMenu가 enum.values[0] 으로 초기화되고,
  ///그걸  map의 value로 가지고, index 를 key값으로 가지고있는 createEnumValuesMapper 를 초기화하는 함수
  bool initCreateEnumValue(Enum value, int idx);

  ///createEnumValuesMapper에서 특정 index를 키값으로 가지고있는 enum의 value를 바꾸는 함수
  bool setCreateEnumValue(Enum value, int idx);

  ///테이블 열 수정 페이지에서 enum 값들은 dropDownMenu로 나타내는데, 처음 페이지 접속시 각각의 dropDownMenu가 enum.values[0] 으로 초기화되고,
  ///그걸  map의 value로 가지고, index 를 key값으로 가지고있는 updateEnumValuesMapper 를 초기화하는 함수
  bool initUpdateEnumValue(Enum value, int idx);

  ///updateEnumValuesMapper 특정 index를 키값으로 가지고있는 enum의 value를 바꾸는 함수
  bool setUpdateEnumValue(Enum value, int idx);

  void setSelectedId(int id);
  bool isChecked(int id);
  Future<bool> initDataForCuAndUpdateTextList(int selectedId);
  void initAddTextList();
  void clearAddTextList();
  void setDataForCreate();
  void setDataForUpdate();
  void setCuDialog(ColumnAttributes columnAttributes, Type fromModel,
      BuildContext context, String mode, TextEditingController? controller);
  void setMultiCuDialogId(int id);
  bool isMultiCuDialogContainId(int id);
  void clearMultiCuDialogIndexList();
  Future<Map<String, dynamic>> getBoadrViewDataById(int id);
  Future<void> addTempDataListInCreate();
  void removeTempDataListInCreate(int index);
  void clearTempDataListInCreate();
  Future<Map<String, dynamic>> updateTableRow();
  Future<Map<String, dynamic>> deleteTableRow();
  Future<Map<String, dynamic>> createTableRow();
  Future<bool> getData();
  M? getDataInDataListById(int id);
  Future<M?> getDataById(int id);
  Future<bool> getRelatedDataById(String modelName, int id, String relation);
  Future<bool> getDataBySearchBar(String memberName, String queryValue);
  Future<bool> getDataByRadioBox(String memberName, Enum? queryValue);
  Future<bool> getDateByRange(
    String startMemberName,
    String startQueryValue,
    String endMemberName,
    String endQueryValue,
  );
}
