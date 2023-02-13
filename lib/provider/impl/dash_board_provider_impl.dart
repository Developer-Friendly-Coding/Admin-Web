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
  List<OfficeBranch>? get officeBranchList => _officeBranchList!;

  OfficeBranch? _officeBranch;
  @override
  OfficeBranch? get officeBranch => _officeBranch;

  late List<Map<String, dynamic>>? _humidityOfficeList;
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
    notifyListeners();
  }

  @override
  Future<List<OfficeBranch>?> getOfficeBranchList() async {
    try {
      _officeBranchList = await _repo.getOfficeBranchList();
      if (_officeBranchList == null) {
        _officeBranch = null;
        return officeBranchList;
      } else if (officeBranchList!.isEmpty) {
        _officeBranch = null;
        return [];
      }
      _officeBranch = officeBranchList![0];
      return _officeBranchList;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<String?> getHumiditySensorValuesByOfficeBranchId() async {
    try {
      Map<String, dynamic>? tempHumiditySensorValues =
          await _repo.getHumiditySensorValuesByOfficeBranchId(
              officeBranch!.getMember("id"), duration);
      if (tempHumiditySensorValues == null) {
        _minHumidityMeasureValue = 0;
        _maxHumidityMeasureValue = 0;
        _avgHumidityMeasureValue = 0;
        _humidityOfficeList == null;
        return "센서값 가져오기 실패";
      } else if (tempHumiditySensorValues.isEmpty) {
        _minHumidityMeasureValue = 0;
        _maxHumidityMeasureValue = 0;
        _avgHumidityMeasureValue = 0;
        _humidityOfficeList = [];
        return "센서값이 없음";
      }
      _minHumidityMeasureValue = tempHumiditySensorValues["minValue"];
      _maxHumidityMeasureValue = tempHumiditySensorValues["maxValue"];
      _avgHumidityMeasureValue = tempHumiditySensorValues["avgValue"];
      _humidityOfficeList = tempHumiditySensorValues["officeList"];
      return "센서값 가져오기 성공";
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<String?> getTemperatureSensorValuesByOfficeBranchId() async {
    try {
      Map<String, dynamic>? tempTemperatureSensorValues =
          await _repo.getHumiditySensorValuesByOfficeBranchId(
              officeBranch!.getMember("id"), duration);
      if (tempTemperatureSensorValues == null) {
        return "센서값 가져오기 실패";
      } else if (tempTemperatureSensorValues.isEmpty) {
        return "센서값이 없음";
      }
      _minTemperatureMeasureValue = tempTemperatureSensorValues["minValue"];
      _maxTemperatureMeasureValue = tempTemperatureSensorValues["maxValue"];
      _avgTemperatureMeasureValue = tempTemperatureSensorValues["avgValue"];
      _temperatureOfficeList = tempTemperatureSensorValues["officeList"];
      return "success";
    } catch (e) {
      debugPrint(e.toString());

      return null;
    } finally {
      notifyListeners();
    }
  }
}
