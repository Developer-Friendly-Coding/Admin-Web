import 'package:clean_arch/common/constants/enum/office_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';

class Office implements Base {
  final int _id; //
  final OfficeType? _type;
  final int _capacity; //
  final String? _description;
  final String _name; //
  final int _officeBranchId; //

  Office({
    int id = -1,
    OfficeType? type,
    int capacity = -1,
    String? description,
    String name = "",
    int officeBranchId = -1,
  })  : _id = id,
        _type = type,
        _capacity = capacity,
        _description = description,
        _name = name,
        _officeBranchId = officeBranchId;

  @override
  Office fromJson(Map<String, dynamic> data) {
    return Office(
        id: data['id'],
        type: OfficeType.values.byName(data['type']),
        capacity: data['capacity'],
        description: data['description'],
        name: data['name'],
        officeBranchId: data['officeBranchId']);
  }

  @override
  Office fromTEC(List<TextEditingController> list) {
    return Office(
      id: list[0].text == "" ? -1 : int.parse(list[0].text),
      officeBranchId: int.parse(list[1].text),
      name: list[2].text,
      capacity: int.parse(list[3].text),
      type: OfficeType.fromString(list[4].text),
      description: list[5].text == "" ? null : list[5].text,
    );
  }

  @override
  Map<String, dynamic> toJson(Office office) {
    Map<String, dynamic> json = {
      'type': office._type!.name,
      'capacity': office._capacity,
      'description': office._description,
      'name': office._name,
      'officeBranchId': office._officeBranchId,
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _officeBranchId.toString(),
      _name,
      _capacity.toString(),
      _type.toString(),
      _description.toString(),
    ];
  }

  @override
  int getId() {
    return _id;
  }
}
