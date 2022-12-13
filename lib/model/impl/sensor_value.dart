import 'package:clean_arch/common/constants/enum/measure_unit.dart';
import 'package:clean_arch/common/constants/enum/sensor_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class SensorValue implements Base {
  final int _id; //
  final int _sensorId; //
  final DateTime? _dateTime; //낫널
  final double _measureValue; //낫널

  SensorValue({
    int id = -1,
    int sensorId = -1,
    DateTime? dateTime,
    double measureValue = 0.0,
  })  : _id = id,
        _sensorId = sensorId,
        _dateTime = dateTime,
        _measureValue = measureValue;

  get measureValue => _measureValue;
  get dateTime => _dateTime;

  @override
  SensorValue fromJson(Map<String, dynamic> data) {
    return SensorValue(
      id: data['id'],
      sensorId: data['sensorId'],
      dateTime: data['dateTime'],
      measureValue: data['measureValue'],
    );
  }

  @override
  SensorValue fromTEC(List<TextEditingController> list) {
    return SensorValue(
      id: list[0].text == "" ? -1 : int.parse(list[0].text),
      sensorId: int.parse(list[1].text),
      dateTime: DateTime.parse(list[2].text),
      measureValue: double.parse(list[1].text),
    );
  }

  @override
  Map<String, dynamic> toJson(SensorValue sensorValue) {
    Map<String, dynamic> json = {
      'id': sensorValue._id,
      'sensorId': sensorValue._sensorId,
      'dateTime':
          DateFormat("yyyy-MM-dd hh:mm:ss").format(sensorValue._dateTime!),
      'measureValue': sensorValue._measureValue,
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _sensorId.toString(),
      DateFormat('yyyy-MM-dd').format(_dateTime!),
      _measureValue.toString(),
    ];
  }

  @override
  int getId() {
    return _id;
  }
}
