import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:clean_arch/repo/signin_repo.dart';
import 'package:clean_arch/common/constants/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SigninRepository implements ISigninRepository {
  final Client _client;

  SigninRepository({Client? client}) : _client = client ?? Client();

  @override
  Future<int?> signIn(username, password) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    Uri url =
        Uri.parse('http://untact-api-dev.pathfinder.camp:8080/auth/signIn');
    Map<String, dynamic> request = {
      "username": username,
      "password": password,
    };
    try {
      Response res =
          await _client.post(url, headers: headers, body: jsonEncode(request));
      if (res.statusCode != 200) {
        debugPrint("sigin함수 statusCode가 200이 아닙니다");
        return res.statusCode;
      } else {
        Map<String, String> body = jsonDecode(res.body);
        String? accessToken = body['accessToken'];
        String? refreshToken = body['refreshToken'];
        String idJsonString = '"username": "$username"';
        String pwJsonString = '"password": "$password"';
        String accessTokenJsonString = '"accessToken": "$accessToken"';
        String refreshTokenJsonString = '"refreshToken": "$refreshToken"';

        String storageValueJsonString = '''
              {     
              $idJsonString,
              $pwJsonString, 
              $accessTokenJsonString,
              $refreshTokenJsonString
              }
          ''';
        FlutterSecureStorage storage = SecureStorage.storage;
        await storage.write(key: 'admin', value: storageValueJsonString);
        Map<String, String> allValues = await storage.readAll();
        debugPrint(allValues.toString());

        return res.statusCode;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<int?> signUp(username, password, email, phoneNumber, name) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    // 'Access-Control-Allow-Origin': "*"
    Uri url =
        Uri.parse('http://untact-api-dev.pathfinder.camp:8080/auth/signUp');
    Map<String, dynamic> request = {
      "username": username,
      "password": password,
      "email": email,
      "phoneNumber": phoneNumber,
      "name": name,
    };
    try {
      Response res =
          await _client.post(url, headers: headers, body: jsonEncode(request));
      if (res.statusCode != 200) {
        debugPrint("signUp함수 statusCode가 200이 아닙니다");
        return res.statusCode;
      } else {
        Map<String, String> body = jsonDecode(res.body);
        String? accessToken = body['accessToken'];
        String? refreshToken = body['refreshToken'];
        String idJsonString = '"username": "$username"';
        String pwJsonString = '"password": "$password"';
        String emailJsonString = '"email": "$email"';
        String phoneNumberJsonString = '"phoneNumber": "$phoneNumber"';
        String nameJsonString = '"name": "$name"';
        String accessTokenJsonString = '"accessToken": "$accessToken"';
        String refreshTokenJsonString = '"refreshToken": "$refreshToken"';

        String storageValueJsonString = '''
              {     
              $idJsonString,
              $pwJsonString, 
              $emailJsonString, 
              $phoneNumberJsonString, 
              $nameJsonString,
              $accessTokenJsonString,
              $refreshTokenJsonString
              }
          ''';
        FlutterSecureStorage storage = SecureStorage.storage;
        await storage.write(key: 'admin', value: storageValueJsonString);
        Map<String, String> allValues = await storage.readAll();
        debugPrint(allValues.toString());

        return res.statusCode;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<int?> signOut() async {
    FlutterSecureStorage storage = SecureStorage.storage;
    String? storageValueJsonString = await storage.read(key: 'admin');
    debugPrint(storageValueJsonString);
    Map<String, dynamic> storageValueJson = jsonDecode(storageValueJsonString!);
    String accessToken = storageValueJson["accessToken"];
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    Uri url =
        Uri.parse('http://untact-api-dev.pathfinder.camp:8080/auth/signOut');

    try {
      Response res = await _client.post(url, headers: headers);
      if (res.statusCode != 200) {
        debugPrint("signOut api statusCode isn't 200");
        return res.statusCode;
      } else {
        await storage.delete(key: 'admin');
        Map<String, String> allValues = await storage.readAll();
        debugPrint(allValues.toString());
        return res.statusCode;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
