import 'package:clean_arch/common/constants/enum/office_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';

class OfficeBranch implements Base {
  final int _id;
  final String _name;
  final int _serviceProviderId;
  final String? _location;
  final double? _latitude;
  final double? _longitude;

  OfficeBranch({
    int id = -1,
    String name = "",
    int serviceProviderId = -1,
    String? location,
    double? latitude,
    double? longitude,
  })  : _id = id,
        _name = name,
        _serviceProviderId = serviceProviderId,
        _location = location,
        _latitude = latitude,
        _longitude = longitude;

  @override
  OfficeBranch fromJson(Map<String, dynamic> data) {
    return OfficeBranch(
        id: data['id'],
        name: data['name'],
        serviceProviderId: data['serviceProviderId'],
        location: data['location'],
        latitude: data['latitude'],
        longitude: data['longitude']);
  }

  @override
  OfficeBranch fromTEC(List<TextEditingController> list) {
    return OfficeBranch(
      id: list[0].text == "" ? -1 : int.parse(list[0].text),
      name: list[1].text,
      serviceProviderId: int.parse(list[2].text),
      location: list[3].text == "" ? null : list[3].text,
      latitude: (list[4].text == "") ? null : double.parse(list[4].text),
      longitude: (list[5].text == "") ? null : double.parse(list[5].text),
    );
  }

  @override
  Map<String, dynamic> toJson(OfficeBranch officeBranch) {
    Map<String, dynamic> json = {
      'name': officeBranch._name,
      'serviceProviderId': officeBranch._serviceProviderId,
      'location': officeBranch._location,
      'latitude': officeBranch._latitude,
      'longitude': officeBranch._longitude,
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _name.toString(),
      _serviceProviderId.toString(),
      _location.toString(),
      _latitude.toString(),
      _longitude.toString(),
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "name":
        return _name;
      case "serviceProviderId":
        return _serviceProviderId;
      case "location":
        return _location;
      case "latitude":
        return _latitude;
      case "longitude":
        return _longitude;

      default:
    }
  }
}
