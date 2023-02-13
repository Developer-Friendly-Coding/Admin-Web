import 'package:clean_arch/common/constants/enum/guide_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/sub_model/officeBranch_sub.dart';
import 'package:clean_arch/model/sub_model/service_provider.dart';

class Guide implements Base {
  int _id;
  ServiceProviderSub _provider;
  OfficeBranchSub? _branch; //
  GuideType _type;
  String? _title;
  String? _content; //

  Guide({
    required int id,
    required ServiceProviderSub provider,
    OfficeBranchSub? branch,
    required GuideType type,
    String? title,
    String? content,
  })  : _id = id,
        _provider = provider,
        _branch = branch,
        _type = type,
        _title = title,
        _content = content;

  factory Guide.fromJson(Map<String, dynamic> data) {
    return Guide(
      id: data['id'],
      provider: ServiceProviderSub.fromJson(data['serviceProvider']),
      branch: data['branch'] == null
          ? null
          : OfficeBranchSub.fromJson(data['officeBranch']),
      type: GuideType.values.byName(data["type"]),
      title: data['title'],
      content: data['content'],
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
      _title ?? "없음",
      _content ?? "없음",
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
      default:
    }
  }

  @override
  void setMemberByText(String member, String text) {
    switch (member) {
      case "type":
        _type = GuideType.fromString(text);
        break;
      case "title":
        _title = (text == "") ? "없음" : text;
        break;
      case "content":
        _content = (text == "") ? "없음" : text;
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
