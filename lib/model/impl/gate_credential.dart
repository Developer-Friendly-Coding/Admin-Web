import 'package:clean_arch/common/constants/enum/gate_credential_status.dart';
import 'package:clean_arch/common/constants/enum/gate_credential_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class GateCredential implements Base {
  final int _id;
  final int _gateId;
  final int _csnCardData;
  final GateCredentialType? _type;
  final GateCredentialStatus? _status;
  final DateTime? _endTime;
  final int _customerMemberId;

  GateCredential({
    int id = -1,
    int gateId = -1,
    int csnCardData = -1,
    GateCredentialType? type,
    GateCredentialStatus? status,
    DateTime? endTime,
    int customerMemberId = -1,
  })  : _id = id,
        _gateId = gateId,
        _csnCardData = csnCardData,
        _type = type,
        _status = status,
        _endTime = endTime,
        _customerMemberId = customerMemberId;

  @override
  GateCredential fromJson(Map<String, dynamic> data) {
    return GateCredential(
      id: data['id'],
      gateId: data['gateId'],
      csnCardData: data['csnCardData'],
      type: GateCredentialType.values.byName(data['type']),
      status: GateCredentialStatus.values.byName(data['status']),
      endTime: DateTime.parse(data['endTime']),
      customerMemberId: data['customerMemberId'],
    );
  }

  @override
  GateCredential fromTEC(List<TextEditingController> list) {
    return GateCredential(
        id: list[0].text == "" ? -1 : int.parse(list[0].text),
        gateId: int.parse(list[1].text),
        csnCardData: int.parse(list[2].text),
        type: GateCredentialType.fromString(list[3].text),
        status: GateCredentialStatus.fromString(list[4].text),
        endTime: DateTime.parse(list[5].text),
        customerMemberId: int.parse(list[6].text));
  }

  @override
  Map<String, dynamic> toJson(GateCredential gateCredential) {
    Map<String, dynamic> json = {
      'gateId': gateCredential._gateId,
      'csnCardData': gateCredential._csnCardData,
      'type': gateCredential._type!.name,
      'status': gateCredential._status!.name,
      'endTime':
          DateFormat("yyyy-MM-dd hh:mm:ss").format(gateCredential._endTime!),
      'customerMemberId': gateCredential._customerMemberId,
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _gateId.toString(),
      _csnCardData.toString(),
      _type.toString(),
      _status.toString(),
      DateFormat('yyyy-MM-dd hh:mm:ss').format(_endTime!),
      _customerMemberId.toString(),
    ];
  }

  @override
  int getId() {
    return _id;
  }
}
