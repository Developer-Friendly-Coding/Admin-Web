import 'package:clean_arch/common/constants/enum/office_type.dart';

class OfficeSub {
  int id;
  OfficeType? type;
  int capacity;
  String description;
  String name;

  OfficeSub({
    int id = -1,
    OfficeType? type,
    int capacity = -1,
    String description = "",
    String name = "",
  })  : id = id,
        type = type,
        capacity = capacity,
        description = description,
        name = name;

  factory OfficeSub.fromJson(Map<String, dynamic> data) {
    return OfficeSub(
      id: data['id'],
      type: OfficeType.values.byName(data['type']),
      capacity: data['capacity'],
      description: data['description'],
      name: data['name'],
    );
  }
}
