import 'package:clean_arch/common/constants/enum/measure_unit.dart';
import 'package:clean_arch/common/constants/enum/sensor_type.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
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
  // "id": 2050,
  //               "type": "TEMPERATUREANDHUMIDITY",
  //               "valueUnit": "PERCENT",
  //               "measureInterval": 100,
  //               "description": "",
  //               "modelName": "SensorTh2",
  //               "name": "firstSensor",
  //               "hejhomeId": "eb80a274e513acf4abwbph",
  //               "officeId": 650
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
  })  : _id = id,
        _officeId = officeId,
        _type = type,
        _valueUnit = valueUnit,
        _measureInterval = measureInterval,
        _description = description,
        _modelName = modelName,
        _name = name,
        _hejhomeId = hejhomeId;

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
        hejhomeId: data['hejhomeId']);
  }

  @override
  Sensor fromTEC(List<TextEditingController> list) {
    return Sensor(
      id: list[0].text == "" ? -1 : int.parse(list[0].text),
      officeId: int.parse(list[1].text),
      type: SensorType.fromString(list[2].text),
      valueUnit: MeasureUnit.fromString(list[3].text),
      measureInterval: list[4].text == "" ? null : int.parse(list[4].text),
      description: list[5].text == "" ? null : list[5].text,
      modelName: list[6].text == "" ? null : list[6].text,
      name: list[7].text == "" ? null : list[7].text,
      hejhomeId: list[8].text,
    );
  }

  @override
  Map<String, dynamic> toJson(Sensor sensor) {
    Map<String, dynamic> json = {
      'officeId': sensor._officeId,
      'type': sensor._type!.name,
      'unit': sensor._valueUnit!.name,
      'measureInterval': sensor._measureInterval,
      'description': sensor._description,
      'modelName': sensor._modelName,
      'name': sensor._name,
      'hejhomeId': sensor._hejhomeId,
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _officeId.toString(),
      _name,
      _type.toString(),
      _valueUnit.toString(),
      _measureInterval.toString(),
      _description.toString(),
      _modelName.toString(),
      _name.toString(),
      _hejhomeId.toString(),
    ];
  }

  @override
  int getId() {
    return _id;
  }
}
