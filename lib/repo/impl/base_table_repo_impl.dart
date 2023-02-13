import 'package:clean_arch/common/constants/uri_provider.dart';
import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/repo/base_table_repo.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/util/class_builder.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:recase/recase.dart';

class BaseTableRepository<M extends Base> implements IBaseTableRepository {
  final Client _client;
  Map<String, dynamic> _filterQueryParameters = {"size": "100"};
  Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  BaseTableRepository({Client? client}) : _client = client ?? Client();

  @override
  void clearFilterQueryParameters() {
    _filterQueryParameters = {"size": "100"};
  }

  @override
  Future<List<M>?> getTableData() async {
    UriProvider.setGetTablePath<M>();
    UriProvider.setQuery(_filterQueryParameters);
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
        return rows
            .map((el) => ClassBuilder.getModelFromJson(M, el))
            .cast<M>()
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  @override
  Future<List<M>?> getTableDataByClearFilter() async {
    _filterQueryParameters = {"size": "100"};
    UriProvider.setGetTablePath<M>();
    UriProvider.setQuery(_filterQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();

    try {
      Response res = await _client.get(url, headers: headers);
      if (res.statusCode != 200) {
        debugPrint("clearFilter 데이타 가져오기 statusCode가 200이 아님");
        return null;
      } else {
        Map<String, dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));
        Map<String, dynamic> data = body['data'];
        List<Map<String, dynamic>> rows =
            data['rows'].cast<Map<String, dynamic>>();

        return rows
            .map((el) => ClassBuilder.getModelFromJson(M, el))
            .cast<M>()
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<M>?> getTableDataBySearchFilter(
      Map<String, String> queryParameters) async {
    _filterQueryParameters = queryParameters;
    UriProvider.setGetTablePath<M>();
    UriProvider.setQuery(_filterQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();

    try {
      Response res = await _client.get(url, headers: headers);
      if (res.statusCode != 200) {
        debugPrint("clearFilter 데이타 가져오기 statusCode가 200이 아님");
        return null;
      } else {
        Map<String, dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));
        Map<String, dynamic> data = body['data'];
        List<Map<String, dynamic>> rows =
            data['rows'].cast<Map<String, dynamic>>();

        return rows
            .map((el) => ClassBuilder.getModelFromJson(M, el))
            .cast<M>()
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<M?> getDataById(int id) async {
    Map<String, dynamic> detailQueryParameters = {};
    detailQueryParameters["id"] = "$id";
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
        if (rows.isEmpty) {
          return null;
        }
        return ClassBuilder.getModelFromJson(M, rows[0]) as M;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<List<M>?> getRelatedTableDataById(modelName, id, relation) async {
    Map<String, dynamic> relatedQueryParameters = {"size": "100"};
    switch (relation) {
      case "1:N":
        relatedQueryParameters[ReCase(modelName).camelCase + "Id"] = "$id";
        break;
      case "N:1":
        relatedQueryParameters["id"] = "$id";
        break;
      default:
    }

    UriProvider.setGetTablePath<M>();
    UriProvider.setQuery(relatedQueryParameters);
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

        return rows
            .map((el) => ClassBuilder.getModelFromJson(M, el))
            .cast<M>()
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  @override
  Future<List<M>?> getTableDataBySearchBar(memberName, queryValue) async {
    if (queryValue == "") {
      _filterQueryParameters.remove(memberName);
    } else {
      _filterQueryParameters[memberName] = queryValue;
    }
    UriProvider.setGetTablePath<M>();
    UriProvider.setQuery(_filterQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();

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

        return rows
            .map((el) => ClassBuilder.getModelFromJson(M, el))
            .cast<M>()
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  @override
  Future<List<M>?> getTableDataByRadioBox(
      String memberName, Enum? queryValue) async {
    if (queryValue == null) {
      _filterQueryParameters.remove(memberName);
    } else {
      _filterQueryParameters[memberName] = queryValue.name;
    }
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

        return rows
            .map((el) => ClassBuilder.getModelFromJson(M, el))
            .cast<M>()
            .toList();
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
    if (startMemberName == endMemberName) {
      startMemberName += "From";
      endMemberName += "To";
    }
    if (startQueryValue == "") {
      _filterQueryParameters.remove(startMemberName);
    } else {
      _filterQueryParameters[startMemberName] = startQueryValue;
    }
    if (endQueryValue == "") {
      _filterQueryParameters.remove(endMemberName);
    } else {
      _filterQueryParameters[endMemberName] = endQueryValue;
    }

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

        return rows
            .map((el) => ClassBuilder.getModelFromJson(M, el))
            .cast<M>()
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  @override
  Future<Map<String, dynamic>> updateTableRow(dataForUpdate) async {
    // FlutterSecureStorage storage = SecureStorage.storage;
    // String? storageValueJsonString = await storage.read(key: 'admin');
    // Map<String, dynamic> storageValueJson = jsonDecode(storageValueJsonString!);
    // String accessToken = storageValueJson["accessToken"];

    Map<String, dynamic> request = dataForUpdate.toJsonForUpdate();

    UriProvider.setUpdateTablePath<M>();
    Map<String, dynamic> updateQueryParameters = {
      "id": dataForUpdate.getMember("id").toString()
    };
    UriProvider.setQuery(updateQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();
    try {
      Response res =
          await _client.post(url, headers: headers, body: jsonEncode(request));
      Map<String, dynamic> body = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return {
          "statusCode": res.statusCode,
          "error": null,
          "errorContext": null,
        };
      } else {
        return {
          "statusCode": res.statusCode,
          "error": body["code"],
          "errorContext": body["message"],
        };
      }
    } catch (e) {
      return {
        "statusCode": null,
        "error": e.toString(),
        "errorContext": null,
      };
    }
  }

  @override
  Future<Map<String, dynamic>> deleteTableRow(int id) async {
    // FlutterSecureStorage storage = SecureStorage.storage;
    // String? storageValueJsonString = await storage.read(key: 'admin');
    // Map<String, dynamic> storageValueJson = jsonDecode(storageValueJsonString!);
    // String accessToken = storageValueJson["accessToken"];
    UriProvider.setDeleteTablePath<M>();
    Map<String, dynamic> deleteQueryParameters = {"id": id.toString()};
    UriProvider.setQuery(deleteQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();

    try {
      Response res = await _client.delete(url, headers: headers);
      Map<String, dynamic> body = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return {
          "statusCode": res.statusCode,
          "error": null,
          "errorContext": null,
        };
      } else {
        return {
          "statusCode": res.statusCode,
          "error": body["code"],
          "errorContext": body["message"],
        };
      }
    } catch (e) {
      return {
        "statusCode": null,
        "error": e.toString(),
        "errorContext": null,
      };
    }
  }

  @override
  Future<Map<String, dynamic>> createTableRow(dataForCreate) async {
    // FlutterSecureStorage storage = SecureStorage.storage;
    // String? storageValueJsonString = await storage.read(key: 'admin');
    // Map<String, dynamic> storageValueJson = jsonDecode(storageValueJsonString!);
    // String accessToken = storageValueJson["accessToken"];

    Map<String, dynamic> request = dataForCreate.toJsonForCreate();
    UriProvider.setCreateTablePath<M>();
    Map<String, dynamic>? createQueryParameters;
    createQueryParameters = (M == Contract) ? {"office-id-list": []} : null;
    UriProvider.setQuery(createQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();
    try {
      Response res =
          await _client.post(url, headers: headers, body: jsonEncode(request));
      if (res.statusCode == 200) {
        return {
          "statusCode": res.statusCode,
          "error": null,
          "errorContext": null,
        };
      } else {
        Map<String, dynamic> body = jsonDecode(res.body);
        return {
          "statusCode": res.statusCode,
          "error": body["code"],
          "errorContext": body["message"],
        };
      }
    } catch (e) {
      return {
        "statusCode": null,
        "error": e.toString(),
        "errorContext": null,
      };
    }
  }

  @override
  Future<Map<String, dynamic>> getBoadrViewDataById(int id) async {
    return {
      // "statusCode": 333,
      // "error": "에러",
      // "message": "에러내용블라블라"

      // "statusCode": 200,
      // "inUse": false,
      // "now": {},
      // "next": {
      //   "name": "찰리",
      //   "customerName": "패스파인더",
      //   "startDateTime": "2018-01-16 13:30:00",
      //   "endDateTime": "2018-01-16 14:30:00"
      // }

      "statusCode": 200,
      "inUse": false,
      "now": {},
      "next": {
        "name": "찰리",
        "customerName": "패스파인더",
        "startDateTime": "2022-01-11 20:30:00",
        "endDateTime": "2022-01-11 20:30:00"
      },
    };

    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    UriProvider.setBoadrViewPath<M>();
    Map<String, dynamic>? boardViewQueryParameters = {"office-id": "$id"};
    UriProvider.setQuery(boardViewQueryParameters);
    UriProvider.setUri();
    Uri url = UriProvider.getUri();

    try {
      Response res = await _client.get(url, headers: headers);
      Map<String, dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));
      Map<String, dynamic> data = body['data'];
      if (res.statusCode == 200) {
        Map<String, dynamic> result = {
          "statusCode": res.statusCode,
          "inUse": data["inUse"],
          "now": data["now"],
          "next": data["next"],
        };
        return result;
      } else {
        Map<String, dynamic> result = {
          "statusCode": res.statusCode,
          "error": body["error"],
          "message": body['message']
        };

        return result;
      }
    } catch (e) {
      Map<String, dynamic> result = {
        "statusCode": null,
        "error": e.toString(),
        "message": null
      };
      return result;
    }
  }
}
