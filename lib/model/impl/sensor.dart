import 'package:clean_arch/common/constants/enum/measure_unit.dart';
import 'package:clean_arch/common/constants/enum/office_type.dart';
import 'package:clean_arch/common/constants/enum/sensor_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:flutter/widgets.dart';

class Sensor implements Base {
  int _id; //
  OfficeInSensor _office; //
  SensorType? _type; //낫널
  MeasureUnit? _valueUnit; //낫널
  int? _measureInterval;
  String? _description; // final String? interval;
  String? _modelName; //
  String? _name; //
  String _hejhomeId;
  String? _token;

  Sensor({
    int id = -1,
    OfficeInSensor? office,
    SensorType? type,
    MeasureUnit? valueUnit,
    int? measureInterval,
    String? description,
    String? modelName, //
    String? name,
    String hejhomeId = "",
    String? token,
  })  : _id = id,
        _office = office ?? OfficeInSensor(),
        _type = type,
        _valueUnit = valueUnit,
        _measureInterval = measureInterval,
        _description = description,
        _modelName = modelName,
        _name = name,
        _hejhomeId = hejhomeId,
        _token = token;
  @override
  Sensor getDummy() {
    return Sensor();
  }

  @override
  Sensor fromJson(Map<String, dynamic> data) {
    return Sensor(
        id: data['id'],
        office: OfficeInSensor.fromJson(data['office']),
        type: SensorType.values.byName(data['type']),
        valueUnit: MeasureUnit.values.byName(data['valueUnit']),
        measureInterval: data['measureInterval'],
        description: data['description'],
        modelName: data['modelName'],
        name: data['name'],
        hejhomeId: data['hejhomeId'],
        token: data['token']);
  }

  @override
  Map<String, dynamic> toJsonForCreate(Sensor sensor) {
    Map<String, dynamic> json = {
      'officeId': sensor.getMember("officeId"),
      'type': sensor.getMember("type"),
      'valueUnit': sensor.getMember("valueUnit"),
      'measureInterval': sensor.getMember("measureInterval"),
      'description': sensor.getMember("description"),
      'modelName': sensor.getMember("modelName"),
      'name': sensor.getMember("name"),
      'hejhomeId': sensor.getMember("hejhomeId"),
      'token': sensor.getMember("token"),
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate(Sensor sensor) {
    Map<String, dynamic> json = {
      'officeId': sensor.getMember("officeId"),
      'type': sensor.getMember("type"),
      'valueUnit': sensor.getMember("valueUnit"),
      'measureInterval': sensor.getMember("measureInterval"),
      'description': sensor.getMember("description"),
      'modelName': sensor.getMember("modelName"),
      'name': sensor.getMember("name"),
      'hejhomeId': sensor.getMember("hejhomeId"),
      'token': sensor.getMember("token"),
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _office.id.toString(),
      _name.toString(),
      _type.toString(),
      _valueUnit.toString(),
      _measureInterval.toString(),
      _description.toString(),
      _modelName.toString(),
      _hejhomeId.toString(),
      _token.toString(),
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "office":
        return _office;
      case "officeId":
        return _office.id;
      case "officeName":
        return _office.name;
      case "name":
        return _name;
      case "type":
        return _type;
      case "valueUnit":
        return _valueUnit;
      case "measureInterval":
        return _measureInterval;
      case "description":
        return _description;
      case "modelName":
        return _modelName;
      case "hejhomeId":
        return _hejhomeId;
      case "token":
        return _token;

      default:
    }
  }

  @override
  void setMember(String member, dynamic value) {
    switch (member) {
      case "id":
        _id = value;
        break;
      case "office":
        _office = value;
        break;
      case "officeId":
        _office.id = value;
        break;
      case "officeName":
        _office.name = value;
        break;
      case "name":
        _name = value;
        break;
      case "type":
        _type = value;
        break;
      case "valueUnit":
        _valueUnit = value;
        break;
      case "measureInterval":
        _measureInterval = value;
        break;
      case "description":
        _description = value;
        break;
      case "modelName":
        _modelName = value;
        break;
      case "hejhomeId":
        _hejhomeId = value;
        break;
      case "token":
        _token = value;
        break;

      default:
    }
  }
}

class OfficeInSensor {
  int id;
  OfficeType? type;
  int capacity;
  String description;
  String name;

  OfficeInSensor({
    int id = -1,
    OfficeType? type,
    int capacity = -1,
    String description = "",
    String name = "",
  })  : id = id,
        type = type,
        capacity = capacity,
        description = description,
        name = name;

  factory OfficeInSensor.fromJson(Map<String, dynamic> data) {
    return OfficeInSensor(
      id: data['id'],
      type: OfficeType.values.byName(data['type']),
      capacity: data['capacity'],
      description: data['description'],
      name: data['name'],
    );
  }
}
