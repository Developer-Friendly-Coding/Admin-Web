import 'package:clean_arch/common/constants/enum/office_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';

class Office implements Base {
  int _id; //
  OfficeType? _type;
  int _capacity; //
  String? _description;
  String _name; //
  OfficeBranchInOffice _officeBranch; //

  Office({
    int id = -1,
    OfficeType? type,
    int capacity = -1,
    String? description,
    String name = "",
    OfficeBranchInOffice? officeBranch,
  })  : _id = id,
        _type = type,
        _capacity = capacity,
        _description = description,
        _name = name,
        _officeBranch = officeBranch ?? OfficeBranchInOffice();
  @override
  Office getDummy() {
    return Office();
  }

  @override
  Office fromJson(Map<String, dynamic> data) {
    return Office(
        id: data['id'],
        type: OfficeType.values.byName(data['type']),
        capacity: data['capacity'],
        description: data['description'],
        name: data['name'],
        officeBranch: OfficeBranchInOffice.fromJson(data['officeBranch']));
  }

  @override
  Map<String, dynamic> toJsonForCreate(Office office) {
    print(office.getMember("capacity"));
    OfficeType type = office.getMember("type");
    Map<String, dynamic> json = {
      'type': type.name,
      'capacity': office.getMember("capacity"),
      'description': office.getMember("description"),
      'name': office.getMember("name"),
      'officeBranchId': office.getMember("officeBranchId"),
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate(Office office) {
    OfficeType type = office.getMember("type");
    Map<String, dynamic> json = {
      'type': type.name,
      'capacity': office.getMember("capacity"),
      'description': office.getMember("description"),
      'name': office.getMember("name"),
      'officeBranchId': office.getMember("officeBranchId"),
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _officeBranch.name,
      _name,
      _capacity.toString(),
      _type.toString(),
      _description.toString(),
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "officeBranch":
        return _officeBranch;
      case "officeBranchId":
        return _officeBranch.id;
      case "officeBranchName":
        return _officeBranch.name;
      case "name":
        return _name;
      case "capacity":
        return _capacity;
      case "type":
        return _type;
      case "description":
        return _description;

      default:
    }
  }

  @override
  void setMember(String member, dynamic value) {
    switch (member) {
      case "id":
        _id = value;
        break;
      case "officeBranch":
        _officeBranch = value;
        break;
      case "officeBranchId":
        _officeBranch.id = value;
        break;
      case "officeBranchrName":
        _officeBranch.name = value;
        break;
      case "name":
        _name = value;
        break;
      case "capacity":
        _capacity = int.parse(value);
        break;
      case "type":
        _type = OfficeType.fromString(value);
        break;
      case "description":
        _description = value;
        break;

      default:
    }
  }
}

class OfficeBranchInOffice {
  int id;
  String name;
  String location;
  double longitude;
  double latitude;

  OfficeBranchInOffice({
    int id = -1,
    String name = "",
    String location = "",
    double longitude = -1.0,
    double latitude = -1.0,
  })  : id = id,
        name = name,
        location = location,
        longitude = longitude,
        latitude = latitude;

  factory OfficeBranchInOffice.fromJson(Map<String, dynamic> data) {
    return OfficeBranchInOffice(
      id: data['id'],
      name: data['name'],
      location: data['location'],
      longitude: data['longitude'],
      latitude: data['latitude'],
    );
  }
}
