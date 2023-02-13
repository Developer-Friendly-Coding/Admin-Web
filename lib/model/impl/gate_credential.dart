import 'package:clean_arch/common/constants/enum/gate_credential_status.dart';
import 'package:clean_arch/common/constants/enum/gate_credential_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/sub_model/customer_member_sub.dart';
import 'package:clean_arch/model/sub_model/gate_sub.dart';
import 'package:intl/intl.dart';

class GateCredential implements Base {
  final int _id;
  GateSub _gate;
  int _csnCardData;
  GateCredentialType _type;
  GateCredentialStatus _status;
  DateTime _endTime;
  CustomerMemberSub _customerMember;

  GateCredential({
    required int id,
    required GateSub gate,
    required int csnCardData,
    required GateCredentialType type,
    required GateCredentialStatus status,
    required DateTime endTime,
    required CustomerMemberSub customerMember,
  })  : _id = id,
        _gate = gate,
        _csnCardData = csnCardData,
        _type = type,
        _status = status,
        _endTime = endTime,
        _customerMember = customerMember;

  factory GateCredential.fromJson(Map<String, dynamic> data) {
    return GateCredential(
      id: data['id'],
      gate: GateSub.fromJson(data['gate']),
      csnCardData: data['csnCardData'],
      type: GateCredentialType.values.byName(data['type']),
      status: GateCredentialStatus.values.byName(data['status']),
      endTime: DateTime.parse(data['endTime']),
      customerMember: CustomerMemberSub.fromJson(data['customerMember']),
    );
  }

  @override
  Map<String, dynamic> toJsonForCreate() {
    Map<String, dynamic> json = {
      'gateId': _gate.id,
      'csnCardData': _csnCardData,
      'type': _type.name,
      'status': _status.name,
      'endTime': DateFormat("yyyy-MM-dd hh:mm:ss").format(_endTime),
      'customerMemberId': _customerMember.id,
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate() {
    Map<String, dynamic> json = {
      'gateId': _gate.id,
      'csnCardData': _csnCardData,
      'type': _type.name,
      'status': _status.name,
      'endTime': DateFormat("yyyy-MM-dd hh:mm:ss").format(_endTime),
      'customerMemberId': _customerMember.id,
    };

    return json;
  }

  @override
  List<String> toRow() {
    return [
      _id.toString(),
      _gate.deviceIp ?? "Ip등록안됨",
      _csnCardData.toString(),
      _type.toString(),
      _status.toString(),
      DateFormat('yyyy-MM-dd hh:mm:ss').format(_endTime),
      _customerMember.name,
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "gateId":
        return _gate.id;
      case "gateIp":
        return _gate.deviceIp;
      case "csnCardData":
        return _csnCardData;
      case "type":
        return _type;
      case "status":
        return _status;
      case "endTime":
        return _endTime;
      case "customerMemberId":
        return _customerMember.id;
      case "customerMemberName":
        return _customerMember.name;
      default:
    }
  }

  @override
  void setMemberByText(String member, String text) {
    switch (member) {
      case "csnCardData":
        _csnCardData = int.parse(text);
        break;
      case "type":
        _type = GateCredentialType.fromString(text);
        break;
      case "status":
        _status = GateCredentialStatus.fromString(text);
        break;
      case "endTime":
        _endTime = DateTime.parse(text);
        break;
      default:
    }
  }

  @override
  void setMemberById(String member, int id) {
    switch (member) {
      case "gateId":
        _gate.id = id;
        break;
      case "customerMemberId":
        _customerMember.id = id;
        break;
      default:
    }
  }
}
