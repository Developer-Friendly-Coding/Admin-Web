class GateSub {
  int id;
  int? deviceId;
  String? deviceIp;
  int? devicePort;
  String? description;

  GateSub({
    int id = -1,
    int? deviceId,
    String? deviceIp,
    int? devicePort,
    String? description,
  })  : id = id,
        deviceId = deviceId,
        deviceIp = deviceIp,
        devicePort = devicePort,
        description = description;

  @override
  factory GateSub.fromJson(Map<String, dynamic> data) {
    return GateSub(
      id: data['id'],
      deviceIp: data['deviceIp'],
      devicePort: data['devicePort'],
      description: data['description'],
    );
  }
}
