import 'package:clean_arch/model/impl/office_branch.dart';

abstract class IDashBoardRepository {
  Future<List<OfficeBranch>?> getOfficeBranchList();
  Future<Map<String, dynamic>?> getHumiditySensorValuesByOfficeBranchId(
      int id, int duration);
  Future<Map<String, dynamic>?> getTemperatureSensorValuesByOfficeBranchId(
      int id, int idurationd);
}
