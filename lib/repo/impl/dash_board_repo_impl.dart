import 'package:clean_arch/common/constants/uri_provider.dart';
import 'package:clean_arch/common/util/class_builder.dart';
import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:clean_arch/repo/dash_board_repo.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class DashBoardRepository implements IDashBoardRepository {
  final Client _client;
  DashBoardRepository({Client? client}) : _client = client ?? Client();
  Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  @override
  Future<List<OfficeBranch>?> getOfficeBranchList() async {
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
        Map<String, dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));
        Map<String, dynamic> data = body['data'];
        List<Map<String, dynamic>> rows =
            data['rows'].cast<Map<String, dynamic>>();
        if (rows.isEmpty) {
          return [];
        }
        return rows
            .map((el) => ClassBuilder.getModelFromJson(OfficeBranch, el))
            .cast<OfficeBranch>()
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> getHumiditySensorValuesByOfficeBranchId(
      id, duration) async {
    Map<String, dynamic> sensorQueryParameters = {};
    sensorQueryParameters["officeBranchId"] = "$id";
    sensorQueryParameters["type"] = "HUMIDITY";
    sensorQueryParameters["duration"] = "$duration";
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
        Map<String, dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));
        Map<String, dynamic>? data = body['data'];
        if (data == null) {
          return {};
        }
        return {
          "minValue": double.parse(data["minValue"].toStringAsFixed(1)),
          "maxValue": double.parse(data["maxValue"].toStringAsFixed(1)),
          "avgValue": double.parse(data["avgValue"].toStringAsFixed(1)),
        };
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> getTemperatureSensorValuesByOfficeBranchId(
      id, duration) async {
    Map<String, dynamic> sensorQueryParameters = {};
    sensorQueryParameters["officeBranchId"] = "$id";
    sensorQueryParameters["type"] = "TEMPERATURE";
    sensorQueryParameters["duration"] = "$duration";
    UriProvider.setDashBoardSensorPath();
    UriProvider.setQuery(sensorQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();

    try {
      Response res = await _client.get(url, headers: headers);

      if (res.statusCode != 200) {
        debugPrint("온도 센서값 리스트 가져오기 statusCode가 200이 아님");
        return null;
      } else {
        Map<String, dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));

        Map<String, dynamic>? data = body['data'];
        if (data == null) {
          return {};
        }
        return {
          "minValue": double.parse(data["minValue"].toStringAsFixed(1)),
          "maxValue": double.parse(data["maxValue"].toStringAsFixed(1)),
          "avgValue": double.parse(data["avgValue"].toStringAsFixed(1)),
        };
      }
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }
}
