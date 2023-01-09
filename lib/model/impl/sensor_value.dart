import 'package:clean_arch/common/constants/enum/measure_unit.dart';
import 'package:clean_arch/common/constants/enum/sensor_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class SensorValue implements Base {
  int _id; //
  SensorInSensorValue _sensor; //
  DateTime? _dateTime; //낫널
  double _measureValue; //낫널

  SensorValue({
    int id = -1,
    DateTime? dateTime,
    double measureValue = 0.0,
    SensorInSensorValue? sensor,
  })  : _id = id,
        _sensor = sensor ?? SensorInSensorValue(),
        _dateTime = dateTime,
        _measureValue = measureValue;
  @override
  SensorValue getDummy() {
    return SensorValue();
  }

  @override
  SensorValue fromJson(Map<String, dynamic> data) {
    return SensorValue(
      id: data['id'],
      sensor: SensorInSensorValue.fromJson(data['sensor']),
      dateTime:
          data['dateTime'] == null ? null : DateTime.parse(data['dateTime']),
      measureValue: data['measureValue'],
    );
  }

  @override
  Map<String, dynamic> toJsonForCreate(SensorValue sensorValue) {
    Map<String, dynamic> json = {
      'sensorId': sensorValue.getMember("sensorId"),
      'dateTime': DateFormat("yyyy-MM-dd hh:mm:ss")
          .format(sensorValue.getMember("dateTime")),
      'measureValue': sensorValue.getMember("measureValue"),
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate(SensorValue sensorValue) {
    Map<String, dynamic> json = {
      'sensorId': sensorValue.getMember("sensorId"),
      'dateTime': DateFormat("yyyy-MM-dd hh:mm:ss")
          .format(sensorValue.getMember("dateTime")),
      'measureValue': sensorValue.getMember("measureValue"),
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _dateTime == null
          ? null.toString()
          : DateFormat('yyyy-MM-dd').format(_dateTime!),
      _measureValue.toString(),
      _sensor.name.toString(),
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "sensor":
        return _sensor;
      case "sensorId":
        return _sensor.id;
      case "sensorName":
        return _sensor.name;
      case "measureValue":
        return _measureValue;
      case "dateTime":
        return _dateTime;

      default:
    }
  }

  @override
  void setMember(String member, dynamic value) {
    switch (member) {
      case "id":
        _id = value;
        break;
      case "sensor":
        _sensor = value;
        break;
      case "sensorId":
        _sensor.id = value;
        break;
      case "sensorName":
        _sensor.name = value;
        break;
      case "measureValue":
        _measureValue = double.parse(value);
        break;
      case "dateTime":
        _dateTime = DateTime.parse(value);
        break;

      default:
    }
  }
}

class SensorInSensorValue {
  int id; //
  SensorType? type; //낫널
  MeasureUnit? valueUnit; //낫널
  int? measureInterval;
  String? description; // final String? interval;
  String? modelName; //
  String? name; //
  String hejhomeId;
  String? token;

  SensorInSensorValue({
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

  factory SensorInSensorValue.fromJson(Map<String, dynamic> data) {
    return SensorInSensorValue(
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
