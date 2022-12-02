import 'package:clean_arch/common/constants/enum/gate_credential_status.dart';
import 'package:clean_arch/common/constants/enum/gate_credential_type.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Gate implements Base {
  final int _id;
  final String? _deviceIp;
  final int? _devicePort;
  final String? _description;
  final int? _officeId;
  final bool? _opened;

  Gate({
    int id = -1,
    String? deviceIp,
    int? devicePort,
    String? description,
    int? officeId,
    bool? opened,
  })  : _id = id,
        _deviceIp = deviceIp,
        _devicePort = devicePort,
        _description = description,
        _officeId = officeId,
        _opened = opened;

  @override
  Gate fromJson(Map<String, dynamic> data) {
    return Gate(
      id: data['id'],
      deviceIp: data['deviceIp'],
      devicePort: data['devicePort'],
      description: data['description'],
      officeId: data['officeId'],
      opened: data['endTime'],
    );
  }

  @override
  Gate fromTEC(List<TextEditingController> list) {
    return Gate(
      id: list[0].text == "" ? -1 : int.parse(list[0].text),
      deviceIp: list[1].text == "" ? null : list[1].text,
      devicePort: list[2].text == "" ? null : int.parse(list[2].text),
      description: list[3].text == "" ? null : list[3].text,
      officeId: list[4].text == "" ? null : int.parse(list[4].text),
      opened: list[5].text == "" ? null : list[5].text.toLowerCase() == 'true',
    );
  }

  @override
  Map<String, dynamic> toJson(Gate gateCredential) {
    Map<String, dynamic> json = {
      'deviceIp': gateCredential._deviceIp,
      'devicePort': gateCredential._devicePort,
      'description': gateCredential._description,
      'officeId': gateCredential._officeId,
      'opened': gateCredential._opened,
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _deviceIp.toString(),
      _devicePort.toString(),
      _description.toString(),
      _officeId.toString(),
      _opened.toString(),
    ];
  }

  @override
  int getId() {
    return _id;
  }
}
