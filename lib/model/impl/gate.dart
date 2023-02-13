import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/sub_model/office_sub.dart';

class Gate implements Base {
  final int _id;
  OfficeSub _office;
  int? _deviceId;
  String? _deviceIp;
  int _devicePort;
  String? _description;

  Gate({
    required int id,
    required OfficeSub office,
    int? deviceId,
    String? deviceIp,
    required int devicePort,
    String? description,
  })  : _id = id,
        _office = office,
        _deviceId = deviceId,
        _deviceIp = deviceIp,
        _devicePort = devicePort,
        _description = description;

  factory Gate.fromJson(Map<String, dynamic> data) {
    return Gate(
      id: data['id'],
      office: OfficeSub.fromJson(data['office']),
      deviceId: data['deviceId'],
      deviceIp: data['deviceIp'],
      devicePort: data['devicePort'],
      description: data['description'],
    );
  }

  @override
  Map<String, dynamic> toJsonForCreate() {
    Map<String, dynamic> json = {
      'officeId': _office.id,
      'deviceId': _deviceId,
      'deviceIp': _deviceIp,
      'devicePort': _devicePort,
      'description': _description,
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate() {
    Map<String, dynamic> json = {
      'officeId': _office.id,
      'deviceId': _deviceId,
      'deviceIp': _deviceIp,
      'devicePort': _devicePort,
      'description': _description,
    };

    return json;
  }

  @override
  List<String> toRow() {
    return [
      _id.toString(),
      _office.name,
      _deviceId == null ? '없음' : _deviceId.toString(),
      _deviceIp ?? "없음",
      _devicePort.toString(),
      _description ?? "없음",
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "deviceId":
        return _deviceId;
      case "deviceIp":
        return _deviceIp;
      case "devicePort":
        return _devicePort;
      case "description":
        return _description;
      case "officeId":
        return _office.id;
      case "officeName":
        return _office.name;
      default:
    }
  }

  @override
  void setMemberByText(String member, String text) {
    switch (member) {
      case "deviceId":
        _deviceId = (text == "") ? null : int.parse(text);
        break;
      case "deviceIp":
        _deviceIp = (text == "") ? null : text;
        break;
      case "devicePort":
        _devicePort = int.parse(text);
        break;
      case "description":
        _description = (text == "") ? null : text;
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
