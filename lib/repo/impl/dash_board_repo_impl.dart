import 'package:clean_arch/common/constants/uri_provider.dart';
import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:clean_arch/repo/dash_board_repo.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class DashBoardRepository implements IDashBoardRepository {
  final Client _client;

  DashBoardRepository({Client? client}) : _client = client ?? Client();

  @override
  Future<List<OfficeBranch>?> getOfficeBranchData() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    UriProvider.setGetTablePath<OfficeBranch>();
    UriProvider.setQuery({});
    UriProvider.setUri();
    Uri url = UriProvider.getUri();

    try {
      Response res = await _client.get(url, headers: headers);

      if (res.statusCode != 200) {
        debugPrint("지점데이터 가져오기 statusCode가 200이 아님");
        return null;
      } else {
        Map<String, dynamic> body = jsonDecode(res.body);

        Map<String, dynamic> data = body['data'];
        List<Map<String, dynamic>> rows =
            data['rows'].cast<Map<String, dynamic>>();

        return rows
            .map((el) => OfficeBranch().fromJson(el))
            .cast<OfficeBranch>()
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  @override
  Future<List<dynamic>?> getHumiditySensorValuesByOfficeBranchId(id) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    Map<String, dynamic> sensorQueryParameters = {};
    sensorQueryParameters["officeBranchId"] = "${id}";
    sensorQueryParameters["type"] = "HUMIDITY";
    UriProvider.setDashBoardSensorPath();
    UriProvider.setQuery(sensorQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();

    try {
      Response res = await _client.get(url, headers: headers);

      if (res.statusCode != 200) {
        debugPrint("습도 센서값 리스트 가져오기 statusCode가 200이 아님");
        return null;
      } else {
        Map<String, dynamic> body = jsonDecode(res.body);

        Map<String, dynamic>? data = body['data'];
        if (data == null) {
          return null;
        }

        return [
          double.parse(data["minValue"].toStringAsFixed(1)),
          double.parse(data["maxValue"].toStringAsFixed(1)),
          double.parse(data["avgValue"].toStringAsFixed(1)),
          data['officeList'].cast<Map<String, dynamic>>()
        ];
      }
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  @override
  Future<List<dynamic>?> getTemperatureSensorValuesByOfficeBranchId(id) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    Map<String, dynamic> sensorQueryParameters = {};
    sensorQueryParameters["officeBranchId"] = id;
    sensorQueryParameters["type"] = "TEMPERATURE";
    UriProvider.setDashBoardSensorPath();
    UriProvider.setQuery(sensorQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();
    print(url);
    try {
      Response res = await _client.get(url, headers: headers);

      if (res.statusCode != 200) {
        debugPrint("온도 센서값 리스트 가져오기 statusCode가 200이 아님");
        return null;
      } else {
        Map<String, dynamic> body = jsonDecode(res.body);

        Map<String, dynamic> data = body['data'];

        return [
          double.parse(data["minValue"].toStringAsFixed(1)),
          double.parse(data["maxValue"].toStringAsFixed(1)),
          double.parse(data["avgValue"].toStringAsFixed(1)),
          data['officeList'].cast<Map<String, dynamic>>()
        ];
      }
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }
}
