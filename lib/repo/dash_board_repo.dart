import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/impl/office_branch.dart';

abstract class IDashBoardRepository {
  Future<List<OfficeBranch>?> getOfficeBranchData();
  Future<List<dynamic>?> getHumiditySensorValuesByOfficeBranchId(
      int id, int duration);
  Future<List<dynamic>?> getTemperatureSensorValuesByOfficeBranchId(
      int id, int idurationd);
}
