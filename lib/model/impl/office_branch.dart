import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/sub_model/service_provider.dart';

class OfficeBranch implements Base {
  final int _id;
  String _name;
  ServiceProviderSub _serviceProvider;
  String? _location;
  double? _latitude;
  double? _longitude;

  OfficeBranch({
    required int id,
    required String name,
    required ServiceProviderSub serviceProvider,
    String? location,
    double? latitude,
    double? longitude,
  })  : _id = id,
        _name = name,
        _serviceProvider = serviceProvider,
        _location = location,
        _latitude = latitude,
        _longitude = longitude;

  factory OfficeBranch.fromJson(Map<String, dynamic> data) {
    return OfficeBranch(
        id: data['id'],
        name: data['name'],
        serviceProvider: ServiceProviderSub.fromJson(data['serviceProvider']),
        location: data['location'],
        latitude: data['latitude'],
        longitude: data['longitude']);
  }

  @override
  Map<String, dynamic> toJsonForCreate() {
    Map<String, dynamic> json = {
      'name': _name,
      'serviceProviderId': _serviceProvider.id,
      'location': _location,
      'latitude': _latitude,
      'longitude': _longitude,
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate() {
    Map<String, dynamic> json = {
      'name': _name,
      'serviceProviderId': _serviceProvider.id,
      'location': _location,
      'latitude': _latitude,
      'longitude': _longitude,
    };

    return json;
  }

  @override
  List<String> toRow() {
    return [
      _id.toString(),
      _name,
      _serviceProvider.name,
      _location ?? "없음",
      _latitude == null ? "없음" : _latitude.toString(),
      _longitude == null ? "없음" : _longitude.toString(),
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
  void setMemberByText(String member, String text) {
    switch (member) {
      // case "serviceProviderName":
      //   _serviceProvider.name = text;
      //   break;
      case "name":
        _name = text;
        break;
      case "location":
        _location = (text == "") ? null : text;
        break;
      case "latitude":
        _latitude = (text == "") ? null : double.parse(text);
        break;
      case "longitude":
        _longitude = (text == "") ? null : double.parse(text);
        break;
      default:
    }
  }

  @override
  void setMemberById(String member, int id) {
    switch (member) {
      case "serviceProviderId":
        _serviceProvider.id = id;
        break;
      default:
    }
  }
}
