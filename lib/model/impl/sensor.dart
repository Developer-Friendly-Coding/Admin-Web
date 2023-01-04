import 'package:clean_arch/common/constants/enum/measure_unit.dart';
import 'package:clean_arch/common/constants/enum/sensor_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';

class Sensor implements Base {
  final int _id; //
  final int _officeId; //
  final SensorType? _type; //낫널
  final MeasureUnit? _valueUnit; //낫널
  final int? _measureInterval;
  final String? _description; // final String? interval;
  final String? _modelName; //
  final String? _name; //
  final String _hejhomeId;
  final String? _token;

  Sensor({
    int id = -1,
    int officeId = -1,
    SensorType? type,
    MeasureUnit? valueUnit,
    int? measureInterval,
    String? description,
    String? modelName, //
    String? name,
    String hejhomeId = "",
    String? token,
  })  : _id = id,
        _officeId = officeId,
        _type = type,
        _valueUnit = valueUnit,
        _measureInterval = measureInterval,
        _description = description,
        _modelName = modelName,
        _name = name,
        _hejhomeId = hejhomeId,
        _token = token;

  @override
  Sensor fromJson(Map<String, dynamic> data) {
    return Sensor(
        id: data['id'],
        officeId: data['officeId'],
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
  Sensor fromTEC(List<TextEditingController> list) {
    return Sensor(
      id: list[0].text == "" ? -1 : int.parse(list[0].text),
      officeId: int.parse(list[1].text),
      name: list[2].text == "" ? null : list[2].text,
      type: SensorType.fromString(list[3].text),
      valueUnit: MeasureUnit.fromString(list[4].text),
      measureInterval: list[5].text == "" ? null : int.parse(list[5].text),
      description: list[6].text == "" ? null : list[6].text,
      modelName: list[7].text == "" ? null : list[7].text,
      hejhomeId: list[8].text,
      token: list[9].text == "" ? null : list[9].text,
    );
  }

  @override
  Map<String, dynamic> toJson(Sensor sensor) {
    Map<String, dynamic> json = {
      'officeId': sensor._officeId,
      'type': sensor._type!.name,
      'valueUnit': sensor._valueUnit!.name,
      'measureInterval': sensor._measureInterval,
      'description': sensor._description,
      'modelName': sensor._modelName,
      'name': sensor._name,
      'hejhomeId': sensor._hejhomeId,
      'token': sensor._token
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _officeId.toString(),
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
      case "officeId":
        return _officeId;
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
}
