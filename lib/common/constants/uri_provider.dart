import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recase/recase.dart';

class UriProvider {
  static String? _scheme;
  static String? _host;
  static int? _port;
  static String? _path;
  static Map<String, dynamic>? _queryParameters;
  static late Uri _uri;

  UriProvider() {
    if (kDebugMode) {
      _scheme = dotenv.env["SCHEMEM"];
      _host = dotenv.env["HOST"];
      _port =
          dotenv.env["PORT"] == "null" ? null : int.parse(dotenv.env["PORT"]!);

      _uri = Uri(
        scheme: _scheme,
        host: _host,
        port: _port,
        path: _path,
      );
    } else if (kReleaseMode) {
      debugPrint("it is release mode");
    }
  }

  static void init() {
    UriProvider();
  }

  static void setDashBoardSensorPath<M>() {
    _path = "/api/sensor/dash-board";
  }

  static void setGetTablePath<M>() {
    _path = "/api/${ReCase(M.toString()).camelCase}/list";
  }

  static void setUpdateTablePath<M>() {
    _path = "/api/${ReCase(M.toString()).camelCase}/update";
  }

  static void setCreateTablePath<M>() {
    _path = "/api/${ReCase(M.toString()).camelCase}";
  }

  static void setDeleteTablePath<M>() {
    _path = "/api/${ReCase(M.toString()).camelCase}";
  }

  static void setQuery(Map<String, dynamic>? queryParameters) {
    _queryParameters = queryParameters;
  }

  static void setUri() {
    _uri = Uri(
        scheme: _scheme,
        host: _host,
        port: _port,
        path: _path,
        queryParameters: _queryParameters);
  }

  static Uri getUri() {
    return _uri;
  }
}
