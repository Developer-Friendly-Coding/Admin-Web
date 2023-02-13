import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:flutter/material.dart';

abstract class IDashBoardProvider extends ChangeNotifier {
  OfficeBranch? get officeBranch;
  List<OfficeBranch>? get officeBranchList;
  List<Map<String, dynamic>>? get humidityOfficeList;
  List<Map<String, dynamic>>? get temperatureOfficeList;
  double get minHumidityMeasureValue;
  double get maxHumidityMeasureValue;
  double get avgHumidityMeasureValue;
  double get minTemperatureMeasureValue;
  double get maxTemperatureMeasureValue;
  double get avgTemperatureMeasureValue;
  int get duration;
  void setOfficeBranch(OfficeBranch officeBranch);
  Future<List<OfficeBranch>?> getOfficeBranchList();
  Future<void> getHumiditySensorValuesByOfficeBranchId();
  Future<void> getTemperatureSensorValuesByOfficeBranchId();
}
