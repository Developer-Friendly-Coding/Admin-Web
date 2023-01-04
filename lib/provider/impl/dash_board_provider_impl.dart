import 'package:clean_arch/common/constants/enum/search.dart';
import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:clean_arch/provider/dash_board_provider.dart';
import 'package:clean_arch/repo/impl/dash_board_repo_impl.dart';
import 'package:flutter/material.dart';

class DashBoardProvider extends ChangeNotifier implements IDashBoardProvider {
  final DashBoardRepository _repo;

  DashBoardProvider({DashBoardRepository? repo})
      : _repo = repo ?? DashBoardRepository();

  List<OfficeBranch>? _officeBranchList;
  @override
  List<OfficeBranch> get officeBranchList => _officeBranchList!;

  late OfficeBranch _officeBranch;
  @override
  OfficeBranch get officeBranch => _officeBranch;

  List<Map<String, dynamic>>? _humidityOfficeList;
  @override
  List<Map<String, dynamic>>? get humidityOfficeList => _humidityOfficeList;

  List<Map<String, dynamic>>? _temperatureOfficeList;
  @override
  List<Map<String, dynamic>>? get temperatureOfficeList =>
      _temperatureOfficeList;

  late double _minHumidityMeasureValue;
  @override
  double get minHumidityMeasureValue => _minHumidityMeasureValue;

  late double _maxHumidityMeasureValue;
  @override
  double get maxHumidityMeasureValue => _maxHumidityMeasureValue;

  late double _avgHumidityMeasureValue;
  @override
  double get avgHumidityMeasureValue => _avgHumidityMeasureValue;

  late double _minTemperatureMeasureValue;
  @override
  double get minTemperatureMeasureValue => _minTemperatureMeasureValue;

  late double _maxTemperatureMeasureValue;
  @override
  double get maxTemperatureMeasureValue => _maxTemperatureMeasureValue;

  late double _avgTemperatureMeasureValue;
  @override
  double get avgTemperatureMeasureValue => _avgTemperatureMeasureValue;

  int _duration = 8;
  @override
  int get duration => _duration;

  @override
  void setOfficeBranch(OfficeBranch officeBranch) {
    _officeBranch = officeBranch;
    //이친구가 노티해주니까 리빌드 되긴하니까 (구독안하)
    notifyListeners();
  }

  @override
  Future<List<OfficeBranch>?> getOfficeBranchData() async {
    try {
      _officeBranchList = await _repo.getOfficeBranchData();
      _officeBranch = officeBranchList[0];

      return _officeBranchList;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<String?> getHumiditySensorValuesByOfficeBranchId() async {
    try {
      List<dynamic>? temp = await _repo.getHumiditySensorValuesByOfficeBranchId(
          officeBranch.getMember("id"), duration);
      if (temp == null) {
        return "fail";
      }

      _minHumidityMeasureValue = temp[0];
      _maxHumidityMeasureValue = temp[1];
      _avgHumidityMeasureValue = temp[2];
      _humidityOfficeList = temp[3];
      return "success";
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<String?> getTemperatureSensorValuesByOfficeBranchId() async {
    try {
      List<dynamic>? temp =
          await _repo.getTemperatureSensorValuesByOfficeBranchId(
              officeBranch.getMember("id"), duration);

      if (temp == null) {
        return "fail";
      }

      _minTemperatureMeasureValue = temp[0];
      _maxTemperatureMeasureValue = temp[1];
      _avgTemperatureMeasureValue = temp[2];
      _temperatureOfficeList = temp[3];
      return "success";
    } catch (e) {
      debugPrint(e.toString());

      return null;
    } finally {
      notifyListeners();
    }
  }
}
