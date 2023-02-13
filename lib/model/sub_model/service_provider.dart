class ServiceProviderSub {
  int id;
  String name;
  String registrationNumber;
  String companyRegistrationNumber;
  String hejhomeToken;

  ServiceProviderSub({
    int id = -1,
    String name = "",
    String registrationNumber = "",
    String companyRegistrationNumber = "",
    String hejhomeToken = "",
  })  : id = id,
        name = name,
        registrationNumber = registrationNumber,
        companyRegistrationNumber = companyRegistrationNumber,
        hejhomeToken = hejhomeToken;

  factory ServiceProviderSub.fromJson(Map<String, dynamic> data) {
    return ServiceProviderSub(
      id: data['id'],
      name: data['name'],
      registrationNumber: data['registrationNumber'],
      companyRegistrationNumber: data['companyRegistrationNumber'],
      hejhomeToken: data['hejhomeToken'],
    );
  }
}
