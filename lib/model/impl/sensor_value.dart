import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/sub_model/sensor_sub.dart';
import 'package:intl/intl.dart';

class SensorValue implements Base {
  int _id;
  SensorSub _sensor;
  DateTime _dateTime;
  double _measureValue;

  SensorValue({
    required int id,
    required DateTime dateTime,
    required double measureValue,
    required SensorSub sensor,
  })  : _id = id,
        _sensor = sensor,
        _dateTime = dateTime,
        _measureValue = measureValue;

  factory SensorValue.fromJson(Map<String, dynamic> data) {
    return SensorValue(
      id: data['id'],
      sensor: SensorSub.fromJson(data['sensor']),
      dateTime: DateTime.parse(data['dateTime']),
      measureValue: data['measureValue'],
    );
  }

  @override
  Map<String, dynamic> toJsonForCreate() {
    Map<String, dynamic> json = {
      'sensorId': _sensor.id,
      'dateTime': DateFormat("yyyy-MM-dd hh:mm:ss").format(_dateTime),
      'measureValue': _measureValue,
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate() {
    Map<String, dynamic> json = {
      'sensorId': _sensor.id,
      'dateTime': DateFormat("yyyy-MM-dd hh:mm:ss").format(_dateTime),
      'measureValue': _measureValue,
    };

    return json;
  }

  @override
  List<String> toRow() {
    return [
      _id.toString(),
      DateFormat('yyyy-MM-dd').format(_dateTime),
      _measureValue.toString(),
      _sensor.name ?? "센서이름없음",
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
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
  void setMemberByText(String member, String text) {
    switch (member) {
      // case "sensorName":
      //   _sensor.name = (text == "") ? null : text;
      //   break;
      case "measureValue":
        _measureValue = double.parse(text);
        break;
      case "dateTime":
        _dateTime = DateTime.parse(text);
        break;

      default:
    }
  }

  @override
  void setMemberById(String member, int id) {
    switch (member) {
      case "sensorId":
        _sensor.id = id;
        break;
      default:
    }
  }
}
