import 'package:clean_arch/common/constants/enum/measure_unit.dart';
import 'package:clean_arch/common/constants/enum/sensor_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/sub_model/office_sub.dart';

class Sensor implements Base {
  int _id; //
  OfficeSub _office; //
  SensorType _type; //낫널
  MeasureUnit _valueUnit; //낫널
  int? _measureInterval;
  String? _description; // final String? interval;
  String? _modelName; //
  String? _name; //
  String _hejhomeId;
  String? _token;

  Sensor({
    required int id,
    required OfficeSub office,
    required SensorType type,
    required MeasureUnit valueUnit,
    int? measureInterval,
    String? description,
    String? modelName, //
    String? name,
    required String hejhomeId,
    String? token,
  })  : _id = id,
        _office = office,
        _type = type,
        _valueUnit = valueUnit,
        _measureInterval = measureInterval,
        _description = description,
        _modelName = modelName,
        _name = name,
        _hejhomeId = hejhomeId,
        _token = token;

  factory Sensor.fromJson(Map<String, dynamic> data) {
    return Sensor(
        id: data['id'],
        office: OfficeSub.fromJson(data['office']),
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
  Map<String, dynamic> toJsonForCreate() {
    Map<String, dynamic> json = {
      'officeId': _office.id,
      'type': _type.name,
      'valueUnit': _valueUnit.name,
      'measureInterval': _measureInterval,
      'description': _description,
      'modelName': _modelName,
      'name': _name,
      'hejhomeId': _hejhomeId,
      'token': _token,
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate() {
    Map<String, dynamic> json = {
      'officeId': _office.id,
      'type': _type.name,
      'valueUnit': _valueUnit.name,
      'measureInterval': _measureInterval,
      'description': _description,
      'modelName': _modelName,
      'name': _name,
      'hejhomeId': _hejhomeId,
      'token': _token,
    };

    return json;
  }

  @override
  List<String> toRow() {
    return [
      _id.toString(),
      _office.name,
      _name ?? "없음",
      _type.toString(),
      _valueUnit.toString(),
      _measureInterval == null ? "없음" : _measureInterval.toString(),
      _modelName ?? "없음",
      _hejhomeId,
      _token ?? "없음",
      _description ?? "없음",
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
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
  void setMemberByText(String member, String text) {
    switch (member) {
      // case "officeName":
      //   _office.name = text;
      //   break;
      case "name":
        _name = (text == "") ? null : text;
        break;
      case "type":
        _type = SensorType.fromString(text);
        break;
      case "valueUnit":
        _valueUnit = MeasureUnit.fromString(text);
        break;
      case "measureInterval":
        _measureInterval = (text == "") ? null : int.parse(text);
        break;
      case "description":
        _description = (text == "") ? null : text;
        break;
      case "modelName":
        _modelName = (text == "") ? null : text;
        break;
      case "hejhomeId":
        _hejhomeId = text;
        break;
      case "token":
        _token = (text == "") ? null : text;
        break;

      default:
    }
  }

  @override
  void setMemberById(String member, int id) {
    switch (member) {
      case "officeId":
        _office.id = id;
        break;
      default:
    }
  }
}
