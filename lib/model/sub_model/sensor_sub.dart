import 'package:clean_arch/common/constants/enum/measure_unit.dart';
import 'package:clean_arch/common/constants/enum/sensor_type.dart';

class SensorSub {
  int id; //
  SensorType? type; //낫널
  MeasureUnit? valueUnit; //낫널
  int? measureInterval;
  String? description; // final String? interval;
  String? modelName; //
  String? name; //
  String hejhomeId;
  String? token;

  SensorSub({
    int id = -1,
    SensorType? type,
    MeasureUnit? valueUnit,
    int? measureInterval = -1,
    String? description = "",
    String? modelName = "",
    String? name = "",
    String hejhomeId = "",
    String? token = "",
  })  : id = id,
        type = type,
        valueUnit = valueUnit,
        measureInterval = measureInterval,
        description = description,
        modelName = modelName,
        name = name,
        hejhomeId = hejhomeId,
        token = token;

  factory SensorSub.fromJson(Map<String, dynamic> data) {
    return SensorSub(
        id: data['id'],
        type: SensorType.values.byName(data['type']),
        valueUnit: MeasureUnit.values.byName(data['valueUnit']),
        measureInterval: data['measureInterval'],
        description: data['description'],
        modelName: data['modelName'],
        name: data['name'],
        hejhomeId: data['hejhomeId'],
        token: data['token']);
  }
}
