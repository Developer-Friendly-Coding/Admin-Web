import 'package:clean_arch/common/constants/enum/event_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/sub_model/officeBranch_sub.dart';
import 'package:clean_arch/model/sub_model/service_provider.dart';
import 'package:intl/intl.dart';

class Event implements Base {
  int _id;
  ServiceProviderSub _provider;
  OfficeBranchSub? _branch; //
  EventType _type;
  String _title;
  String _content; //
  DateTime? _startDatetime;
  DateTime? _endDatetime;
  String? _imageUrl;

  Event({
    required int id,
    required ServiceProviderSub provider,
    OfficeBranchSub? branch,
    required EventType type,
    required String title,
    required String content,
    DateTime? startDatetime,
    DateTime? endDatetime,
    String? imageUrl,
  })  : _id = id,
        _provider = provider,
        _branch = branch,
        _type = type,
        _title = title,
        _content = content,
        _startDatetime = startDatetime,
        _endDatetime = endDatetime,
        _imageUrl = imageUrl;

  factory Event.fromJson(Map<String, dynamic> data) {
    return Event(
      id: data['id'],
      provider: ServiceProviderSub.fromJson(data['serviceProvider']),
      branch: data['branch'] == null
          ? null
          : OfficeBranchSub.fromJson(data['officeBranch']),
      type: EventType.values.byName(data["type"]),
      title: data['title'],
      content: data['content'],
      startDatetime: data['startDatetime'] == null
          ? null
          : DateTime.tryParse(data['startDatetime']),
      endDatetime: data['endDatetime'] == null
          ? null
          : DateTime.tryParse(data['endDatetime']),
      imageUrl: data['imageUrl'],
    );
  }

  @override
  Map<String, dynamic> toJsonForCreate() {
    Map<String, dynamic> json = {
      'serviceProviderId': _provider.id,
      'officeBranchId': _branch?.id,
      'type': _type.name,
      'title': _title,
      'content': _content,
      'startDatetime': _startDatetime == null
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(_startDatetime!),
      'endDatetime': _endDatetime == null
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(_endDatetime!),
      'imageUrl': _imageUrl,
    };
    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate() {
    Map<String, dynamic> json = {
      'serviceProviderId': _provider.id,
      'officeBranchId': _branch?.id,
      'type': _type.name,
      'title': _title,
      'content': _content,
      'startDatetime': _startDatetime == null
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(_startDatetime!),
      'endDatetime': _endDatetime == null
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(_endDatetime!),
      'imageUrl': _imageUrl,
    };
    return json;
  }

  @override
  List<String> toRow() {
    return [
      _id.toString(),
      _provider.name,
      _branch == null ? "없음" : _branch!.name,
      _type.toString(),
      _title,
      _content,
      _startDatetime == null
          ? "없음"
          : DateFormat('yyyy-MM-dd').format(_startDatetime!),
      _endDatetime == null
          ? "없음"
          : DateFormat('yyyy-MM-dd').format(_endDatetime!),
      _imageUrl ?? "없음",
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "providerId":
        return _provider.id;
      case "providerName":
        return _provider.name;
      case "branchId":
        return _branch?.id;
      case "branchName":
        return _branch?.name;
      case "type":
        return _type;
      case "title":
        return _title;
      case "content":
        return _content;
      case "startDatetime":
        return _startDatetime;
      case "endDatetime":
        return _endDatetime;
      case "imageUrl":
        return _imageUrl;

      default:
    }
  }

  @override
  void setMemberByText(String member, String text) {
    switch (member) {
      case "type":
        _type = EventType.fromString(text);
        break;
      case "title":
        _title = text;
        break;
      case "content":
        _content = text;
        break;
      case "startDatetime":
        _startDatetime = (text == "") ? null : DateTime.parse(text);
        break;
      case "endDatetime":
        _endDatetime = (text == "") ? null : DateTime.parse(text);
        break;
      case "imageUrl":
        _imageUrl = (text == "") ? null : text;
        break;
      default:
    }
  }

  @override
  void setMemberById(String member, int id) {
    switch (member) {
      case "providerId":
        _provider.id = id;
        break;
      case "branchId":
        _branch == null ? _branch = OfficeBranchSub() : null;
        _branch!.id = id;
        break;
      default:
    }
  }
}
