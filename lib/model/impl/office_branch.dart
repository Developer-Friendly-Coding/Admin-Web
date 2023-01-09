import 'package:clean_arch/common/constants/enum/office_type.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';

class OfficeBranch implements Base {
  int _id;
  String _name;
  ServiceProviderInOfficeBranch _serviceProvider;
  String? _location;
  double? _latitude;
  double? _longitude;

  OfficeBranch({
    int id = -1,
    String name = "",
    ServiceProviderInOfficeBranch? serviceProvider,
    String? location,
    double? latitude,
    double? longitude,
  })  : _id = id,
        _name = name,
        _serviceProvider = serviceProvider ?? ServiceProviderInOfficeBranch(),
        _location = location,
        _latitude = latitude,
        _longitude = longitude;
  @override
  OfficeBranch getDummy() {
    return OfficeBranch();
  }

  @override
  OfficeBranch fromJson(Map<String, dynamic> data) {
    return OfficeBranch(
        id: data['id'],
        name: data['name'],
        serviceProvider:
            ServiceProviderInOfficeBranch.fromJson(data['serviceProvider']),
        location: data['location'],
        latitude: data['latitude'],
        longitude: data['longitude']);
  }

  @override
  Map<String, dynamic> toJsonForCreate(OfficeBranch officeBranch) {
    print(officeBranch.getMember("latitude"));
    print(officeBranch.getMember("longitude"));
    Map<String, dynamic> json = {
      'name': officeBranch.getMember("name"),
      'serviceProviderId': officeBranch.getMember("serviceProviderId"),
      'location': officeBranch.getMember("location"),
      'latitude': officeBranch.getMember("latitude"),
      'longitude': officeBranch.getMember("longitude"),
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate(OfficeBranch officeBranch) {
    Map<String, dynamic> json = {
      'name': officeBranch.getMember("name"),
      'serviceProviderId': officeBranch.getMember("serviceProviderId"),
      'location': officeBranch.getMember("location"),
      'latitude': officeBranch.getMember("latitude"),
      'longitude': officeBranch.getMember("longitude")
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _name.toString(),
      _serviceProvider.name,
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
      case "serviceProvider":
        return _serviceProvider;
      case "serviceProviderId":
        return _serviceProvider.id;
      case "serviceProviderName":
        return _serviceProvider.name;
      case "location":
        return _location;
      case "latitude":
        return _latitude;
      case "longitude":
        return _longitude;

      default:
    }
  }

  @override
  void setMember(String member, dynamic value) {
    switch (member) {
      case "id":
        _id = value;
        break;
      case "serviceProvider":
        _serviceProvider = value;
        break;
      case "serviceProviderId":
        _serviceProvider.id = value;
        break;
      case "serviceProviderName":
        _serviceProvider.name = value;
        break;
      case "name":
        _name = value;
        break;
      case "location":
        _location = value;
        break;
      case "latitude":
        _latitude = double.parse(value);
        break;
      case "longitude":
        _longitude = double.parse(value);
        break;
      default:
    }
  }
}

class ServiceProviderInOfficeBranch {
  int id;
  String name;
  String registrationNumber;
  String companyRegistrationNumber;
  String hejhomeToken;

  ServiceProviderInOfficeBranch({
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

  factory ServiceProviderInOfficeBranch.fromJson(Map<String, dynamic> data) {
    return ServiceProviderInOfficeBranch(
      id: data['id'],
      name: data['name'],
      registrationNumber: data['registrationNumber'],
      companyRegistrationNumber: data['companyRegistrationNumber'],
      hejhomeToken: data['hejhomeToken'],
    );
  }
}
