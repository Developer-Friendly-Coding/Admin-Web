import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/material.dart';

abstract class IBaseTableProvider<M extends Base> extends ChangeNotifier {
  List<M> get dataList;
  int get selectedIndex;
  M get selectedRow;
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

  ///M모델명에 테이블의 id를 파라미터로 넣어주면,
  ///넣어준 id를 가진 하나의 데이터를 json으로 가져와서
  /// M타입으로 변환해 selectedRow변수에 넣어주는 함수
  Future<M?> getDetailRowDataById(int id);

  ///M모델명에 테이블의 데이터를 json으로 가져와서
  ///M타입 리스트로 변환해 dataList변수에 넣어주는 함수
  Future<List<M>?> getTableData();

  /// M모델명에 테이블에서
  /// (modelName아이디=id)인 테이블의 데이터를 json으로가져와서
  /// M타입 리스트로 변환해 dataList변수에 넣어주는 함수
  Future<List<M>?> getDetailTableDataById(String modelName, int id);

  ///M모델명에 테이블에서 (memberName = queryValue) 에 해당하는 데이터를 json으로 가져와서
  ///M타입 리스트로 변환해 dataList변수에 넣어주는 함수
  Future<List<M>?> getTableDataBySearchBar(
      String memberName, String queryValue);

  ///M모델명에 테이블에서 (memberName = queryValue) 에 해당하는 데이터를 json으로 가져와서
  ///M타입 리스트로 변환해 dataList변수에 넣어주는 함수
  Future<List<M>?> getTableDataByRadioBox(String memberName, Enum queryValue);

  ///M모델명에 테이블에서 (startMemberName = startQueryValue 이고 endMemberName = endQueryValue )에 해당하는 데이터를 json으로 가져와서
  ///M타입 리스트로 변환해 dataList변수에 넣어주는 함수
  Future<List<M>?> getTableDateByRange(
    String startMemberName,
    String startQueryValue,
    String endMemberName,
    String endQueryValue,
  );

  ///selectedIndex변수에 index를 대입하는 함수
  void changeSelectedIndex(index);

  ///_updateButtonTECList 변수를 생성하고,원클릭이든 더블클릭이든 선택한 테이블의 row에 정보들을 String화 시켜서
  ///_updateButtonTECList.text에다가 넣어주는 함수
  void initUpdateButtonTECList();

  ///_addButtonTECList 변수를 생성하고, 그 변수에다
  ///_addButtonTECList.text=""로 모두 초기화 해주는 함수
  void initAddButtonTECList();

  ///_addButtonTECList.text=""로 모두 초기화 해주는 함수
  void clearAddButtonTECList();

  ///_updateButtonTECList 변수를 사용해 테이블의 특정열을 최신화시키는 함수
  ///_updateButtonTECList 변수는 고유한 식별키를 포함해  테이블 모델의 모든 멤버들을 가지고있다.
  Future<int?> updateTableRow();

  ///dataList[selectedIndex]를 이용해 테이블의 특정열을 삭제시키는 함수
  ///삭제할때는 id만 필요하므로 repo에서 id만 가져오는 로직을 거친다.
  Future<int?> deleteTableRow();

  ///_addButtonTECList 변수를 사용해 새로운 열을 추가하는 함수
  ///_addButtonTECList 변수는 고유한 식별키를 포함해 테이블 모델의 모든 멤버들을 가지고있다.
  ///리턴값의 형태는 [ res.statusCode, error명, error내용 ] 이다.
  Future<List<dynamic>> createTableRow();
}
