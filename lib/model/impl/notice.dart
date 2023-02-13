import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/sub_model/officeBranch_sub.dart';
import 'package:clean_arch/model/sub_model/service_provider.dart';

class Notice implements Base {
  int _id; //
  ServiceProviderSub _provider;
  OfficeBranchSub? _branch; //
  String _title;
  String _content; //
  String? _imageUrl; //

  Notice({
    required int id,
    required ServiceProviderSub provider,
    OfficeBranchSub? branch,
    required String title,
    required String content,
    String? imageUrl,
  })  : _id = id,
        _provider = provider,
        _branch = branch,
        _title = title,
        _content = content,
        _imageUrl = imageUrl;

  factory Notice.fromJson(Map<String, dynamic> data) {
    return Notice(
      id: data['id'],
      provider: ServiceProviderSub.fromJson(data['serviceProvider']),
      branch: data['branch'] == null
          ? null
          : OfficeBranchSub.fromJson(data['officeBranch']),
      title: data['title'],
      content: data['content'],
      imageUrl: data['imageUrl'],
    );
  }

  @override
  Map<String, dynamic> toJsonForCreate() {
    Map<String, dynamic> json = {
      'serviceProviderId': _provider.id,
      'officeBranchId': _branch?.id,
      'title': _title,
      'content': _content,
      'imageUrl': _imageUrl,
    };
    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate() {
    Map<String, dynamic> json = {
      'serviceProviderId': _provider.id,
      'officeBranchId': _branch?.id,
      'title': _title,
      'content': _content,
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
      _title,
      _content,
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
      case "title":
        return _title;
      case "content":
        return _content;
      case "imageUrl":
        return _imageUrl;

      default:
    }
  }

  @override
  void setMemberByText(String member, String text) {
    switch (member) {
      case "title":
        _title = text;
        break;
      case "content":
        _content = text;
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
