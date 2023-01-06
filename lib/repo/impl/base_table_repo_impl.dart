import 'package:clean_arch/common/constants/uri_provider.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/util/class_builder.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/repo/base_table_repo.dart';
import 'package:recase/recase.dart';

class BaseTableRepository<M extends Base> {
  final Client _client;
  final M _model = ClassBuilder.fromString(M.toString()) as M;
  Map<String, dynamic> _queryParameters = {"size": "100"};
  Map<String, dynamic> _filterQueryParameters = {"size": "100"};

  BaseTableRepository({Client? client}) : _client = client ?? Client();

  @override
  Future<List<M>?> getTableData() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    UriProvider.setGetTablePath<M>();
    UriProvider.setQuery(_queryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();

    try {
      Response res = await _client.get(url, headers: headers);

      if (res.statusCode != 200) {
        debugPrint("테이블 가져오기 statusCode가 200이 아님");
        return null;
      } else {
        Map<String, dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));

        Map<String, dynamic> data = body['data'];
        List<Map<String, dynamic>> rows =
            data['rows'].cast<Map<String, dynamic>>();

        return rows.map((el) => _model.fromJson(el)).cast<M>().toList();
      }
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  @override
  Future<List<M>?> getTableDataBySearchBar(memberName, queryValue) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    _filterQueryParameters[memberName] = queryValue;
    UriProvider.setGetTablePath<M>();
    UriProvider.setQuery(_filterQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();
    print(url);
    try {
      Response res = await _client.get(url, headers: headers);
      if (res.statusCode != 200) {
        debugPrint("검색바 필터 테이블 가져오기 statusCode가 200이 아님");
        return null;
      } else {
        Map<String, dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));

        Map<String, dynamic> data = body['data'];
        List<Map<String, dynamic>> rows =
            data['rows'].cast<Map<String, dynamic>>();

        return rows.map((el) => _model.fromJson(el)).cast<M>().toList();
      }
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  @override
  Future<M?> getDataById(int id) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    Map<String, dynamic> detailQueryParameters = {};
    detailQueryParameters["id"] = "${id}";
    UriProvider.setGetTablePath<M>();
    UriProvider.setQuery(detailQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();

    try {
      Response res = await _client.get(url, headers: headers);
      if (res.statusCode != 200) {
        debugPrint("id로 테이블특정로우 가져오기 statusCode가 200이 아님");
        return null;
      } else {
        Map<String, dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));

        Map<String, dynamic> data = body['data'];
        List<Map<String, dynamic>> rows =
            data['rows'].cast<Map<String, dynamic>>();

        return _model.fromJson(rows[0]) as M;
      }
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  @override
  Future<List<M>?> getRelatedTableDataById(String modelName, int id) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    Map<String, dynamic> detailQueryParameters = {"size": "100"};
    detailQueryParameters[ReCase(modelName).camelCase + "Id"] = "${id}";
    UriProvider.setGetTablePath<M>();
    UriProvider.setQuery(detailQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();

    try {
      Response res = await _client.get(url, headers: headers);
      if (res.statusCode != 200) {
        debugPrint("id로 관련테이블 가져오기 statusCode가 200이 아님");
        return null;
      } else {
        Map<String, dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));

        Map<String, dynamic> data = body['data'];
        List<Map<String, dynamic>> rows =
            data['rows'].cast<Map<String, dynamic>>();

        return rows.map((el) => _model.fromJson(el)).cast<M>().toList();
      }
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  @override
  Future<List<M>?> getTableDataByRadioBox(
      String memberName, Enum queryValue) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    _filterQueryParameters[memberName] = queryValue.name;
    UriProvider.setGetTablePath<M>();
    UriProvider.setQuery(_filterQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();

    try {
      Response res = await _client.get(url, headers: headers);
      if (res.statusCode != 200) {
        debugPrint("라디오박스 필터 테이블 가져오기 statusCode가 200이 아님");
        return null;
      } else {
        Map<String, dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));

        Map<String, dynamic> data = body['data'];
        List<Map<String, dynamic>> rows =
            data['rows'].cast<Map<String, dynamic>>();

        return rows.map((el) => _model.fromJson(el)).cast<M>().toList();
      }
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  @override
  Future<List<M>?> getTableDateByRange(
    String startMemberName,
    String startQueryValue,
    String endMemberName,
    String endQueryValue,
  ) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    if (startMemberName == endMemberName) {
      startMemberName += "From";
      endMemberName += "To";
    }

    _filterQueryParameters[startMemberName] = startQueryValue;
    _filterQueryParameters[endMemberName] = endQueryValue;
    UriProvider.setGetTablePath<M>();
    UriProvider.setQuery(_filterQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();

    try {
      Response res = await _client.get(url, headers: headers);
      if (res.statusCode != 200) {
        debugPrint("범위 필터 테이블 가져오기 statusCode가 200이 아님");
        return null;
      } else {
        Map<String, dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));

        Map<String, dynamic> data = body['data'];
        List<Map<String, dynamic>> rows =
            data['rows'].cast<Map<String, dynamic>>();

        return rows.map((el) => _model.fromJson(el)).cast<M>().toList();
      }
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  @override
  Future<int?> updateTableRow(selectedTableRow) async {
    // FlutterSecureStorage storage = SecureStorage.storage;
    // String? storageValueJsonString = await storage.read(key: 'admin');
    // Map<String, dynamic> storageValueJson = jsonDecode(storageValueJsonString!);
    // String accessToken = storageValueJson["accessToken"];
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $accessToken',
    };

    Map<String, dynamic> request = _model.toJson(selectedTableRow);

    UriProvider.setUpdateTablePath<M>();
    Map<String, dynamic> updateQueryParameters = {
      "id": selectedTableRow.getMember("id").toString()
    };
    UriProvider.setQuery(updateQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();

    try {
      Response res =
          await _client.post(url, headers: headers, body: jsonEncode(request));
      if (res.statusCode == 200) {
        return res.statusCode;
      } else {
        debugPrint("테이블 열 업데이트 statusCode가 200이아님");
        return res.statusCode;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<int?> deleteTableRow(int id) async {
    // FlutterSecureStorage storage = SecureStorage.storage;
    // String? storageValueJsonString = await storage.read(key: 'admin');
    // Map<String, dynamic> storageValueJson = jsonDecode(storageValueJsonString!);
    // String accessToken = storageValueJson["accessToken"];
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $accessToken',
    };

    UriProvider.setDeleteTablePath<M>();
    Map<String, dynamic> deleteQueryParameters = {"id": id.toString()};
    UriProvider.setQuery(deleteQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();

    try {
      Response res = await _client.delete(url, headers: headers);
      if (res.statusCode == 200) {
        return res.statusCode;
      } else {
        debugPrint("테이블 열 삭제 statusCode가 200이아님");
        return res.statusCode;
      }
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  @override
  Future<List<dynamic>> createTableRow(addedTableRow) async {
    // FlutterSecureStorage storage = SecureStorage.storage;
    // String? storageValueJsonString = await storage.read(key: 'admin');
    // Map<String, dynamic> storageValueJson = jsonDecode(storageValueJsonString!);
    // String accessToken = storageValueJson["accessToken"];
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $accessToken',
    };

    Map<String, dynamic> request = _model.toJson(addedTableRow);

    UriProvider.setCreateTablePath<M>();
    Map<String, dynamic>? addQueryParameters;
    UriProvider.setQuery(addQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();

    try {
      Response res =
          await _client.post(url, headers: headers, body: jsonEncode(request));
      if (res.statusCode == 200) {
        return [res.statusCode, null, null];
      } else {
        Map<String, dynamic> body = jsonDecode(res.body);
        return [res.statusCode, body["code"], body["message"]];
      }
    } catch (e) {
      return [null, e.toString(), null];
    }
  }
}
