import 'package:clean_arch/common/constants/enum/channel.dart';
import 'package:clean_arch/common/constants/enum/deep_link_target.dart';
import 'package:clean_arch/common/constants/enum/message_status.dart';
import 'package:clean_arch/common/constants/enum/message_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/sub_model/contract_sub.dart';
import 'package:clean_arch/model/sub_model/customer_member_sub.dart';

class LogMessage implements Base {
  int _id;
  ContractSub _contract;
  CustomerMemberSub _member;
  String? _phoneNumber;
  Channel _channel;
  int? _messageId;
  MessageType _type;
  MessageStatus _status;
  String? _title;
  String? _content;
  DeepLinkTarget _deepLinkTarget;
  int? _deepLinkId;
  bool? _isRead;
  bool? _isSendMessage;

  LogMessage({
    required int id,
    required ContractSub contract,
    required CustomerMemberSub member,
    String? phoneNumber,
    required Channel channel,
    int? messageId,
    required MessageType type,
    required MessageStatus status,
    String? title,
    String? content,
    required DeepLinkTarget deepLinkTarget,
    int? deepLinkId,
    bool? isRead,
    bool? isSendMessage,
  })  : _id = id,
        _contract = contract,
        _member = member,
        _phoneNumber = phoneNumber,
        _channel = channel,
        _messageId = messageId,
        _type = type,
        _status = status,
        _title = title,
        _content = content,
        _deepLinkTarget = deepLinkTarget,
        _deepLinkId = deepLinkId,
        _isRead = isRead,
        _isSendMessage = isSendMessage;

  factory LogMessage.fromJson(Map<String, dynamic> data) {
    return LogMessage(
      id: data['id'],
      contract: ContractSub.fromJson(data['contract']),
      member: CustomerMemberSub.fromJson(data['member']),
      phoneNumber: data['phoneNumber'],
      channel: Channel.values.byName(data['channel']),
      messageId: data['messageId'],
      type: MessageType.values.byName(data['type']),
      status: MessageStatus.values.byName(data['status']),
      title: data['title'],
      content: data['content'],
      deepLinkTarget: DeepLinkTarget.values.byName(data['deepLinkTarget']),
      deepLinkId: data['deepLinkId'],
      isRead: data['isRead'],
      isSendMessage: data['isSendMessage'],
    );
  }

  @override
  Map<String, dynamic> toJsonForCreate() {
    Map<String, dynamic> json = {
      'contractId': _contract.id,
      'memberId': _member.id,
      'phoneNumber': _phoneNumber,
      'channel': _channel.name,
      'messageId': _messageId,
      'type': _type.name,
      'status': _status.name,
      'title': _title,
      'content': _content,
      'deepLinkTarget': _deepLinkTarget.name,
      'deepLinkId': _deepLinkId,
      'isRead': _isRead,
      'isSendMessage': _isSendMessage,
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate() {
    Map<String, dynamic> json = {
      'contractId': _contract.id,
      'memberId': _member.id,
      'phoneNumber': _phoneNumber,
      'channel': _channel.name,
      'messageId': _messageId,
      'type': _type.name,
      'status': _status.name,
      'title': _title,
      'content': _content,
      'deepLinkTarget': _deepLinkTarget.name,
      'deepLinkId': _deepLinkId,
      'isRead': _isRead,
      'isSendMessage': _isSendMessage,
    };

    return json;
  }

  @override
  List<String> toRow() {
    return [
      _id.toString(),
      _contract.description ?? "계약은존재하나 계약설명 없음",
      _member.name,
      _phoneNumber ?? "없음",
      _channel.toString(),
      _messageId == null ? "없음" : _messageId.toString(),
      _type.toString(),
      _status.toString(),
      _title ?? "없음",
      _content ?? "없음",
      _deepLinkTarget.toString(),
      _deepLinkId == null ? "없음" : _deepLinkId.toString(),
      _isRead == null
          ? "없음"
          : _isRead!
              ? "수신됨"
              : "수신되지 않음",
      _isSendMessage == null
          ? "없음"
          : _isSendMessage!
              ? "발송됨"
              : "발송되지 않음",
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "contractId":
        return _contract.id;
      case "contractDescription":
        return _contract.description;
      case "memberId":
        return _member.id;
      case "memberName":
        return _member.name;
      case "phoneNumber":
        return _phoneNumber;
      case "channel":
        return _channel;
      case "messageId":
        return _messageId;
      case "type":
        return _type;
      case "status":
        return _status;
      case "title":
        return _title;
      case "content":
        return _content;
      case "deepLinkTarget":
        return _deepLinkTarget;
      case "deepLinkId":
        return _deepLinkId;
      case "isRead":
        return _isRead;
      case "isSendMessage":
        return _isSendMessage;
      default:
    }
  }

  @override
  void setMemberByText(String member, String text) {
    switch (member) {
      case "phoneNumber":
        _phoneNumber = (text == "") ? null : text;
        break;
      case "channel":
        _channel = Channel.fromString(text);
        break;
      case "messageId":
        _messageId = (text == "") ? null : int.parse(text);
        break;
      case "type":
        _type = MessageType.fromString(text);
        break;
      case "status":
        _status = MessageStatus.fromString(text);
        break;
      case "title":
        _title = (text == "") ? null : text;
        break;
      case "content":
        _content = (text == "") ? null : text;
        break;
      case "deepLinkTarget":
        _deepLinkTarget = DeepLinkTarget.fromString(text);
        break;
      case "deepLinkId":
        _deepLinkId = (text == "") ? null : int.parse(text);
        break;
      case "isRead":
        _isRead = (text == "") ? null : parseBool(text);
        break;
      case "isSendMessage":
        _isSendMessage = (text == "") ? null : parseBool(text);
        break;
      default:
    }
  }

  @override
  void setMemberById(String member, int id) {
    switch (member) {
      case "memberId":
        _member.id = id;
        break;
      case "contractId":
        _contract.id = id;
        break;
      default:
    }
  }
}

bool parseBool(String text) {
  if (text.toLowerCase() == 'true') {
    return true;
  } else if (text.toLowerCase() == 'false') {
    return false;
  }

  throw '"$text" can not be parsed to boolean.';
}
