class OfficeBranchSub {
  int id;
  String name;
  String location;
  double longitude;
  double latitude;

  OfficeBranchSub({
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

  factory OfficeBranchSub.fromJson(Map<String, dynamic> data) {
    return OfficeBranchSub(
      id: data['id'],
      name: data['name'],
      location: data['location'],
      longitude: data['longitude'],
      latitude: data['latitude'],
    );
  }
}
