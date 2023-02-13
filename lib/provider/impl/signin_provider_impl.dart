import 'package:clean_arch/provider/signin_provider.dart';
import 'package:clean_arch/repo/impl/signin_repo_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';
import 'package:clean_arch/common/constants/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignInProvider extends ChangeNotifier implements ISignInProvider {
  late bool _isLogin;
  @override
  bool get isLogin => _isLogin;

  final SigninRepository _repo;

  SignInProvider({SigninRepository? repo}) : _repo = repo ?? SigninRepository();

  @override
  void changeLoginState() {
    _isLogin = !isLogin;
    notifyListeners();
  }

  @override
  Future<String?> loadSignIn(LoginData data) async {
    Duration loginTime = Duration(milliseconds: timeDilation.ceil() * 50);
    String username = data.name;
    String password = data.password;

    int? statusCode = await _repo.signIn(username, password);
    return Future.delayed(loginTime).then((_) {
      if (statusCode == 200) {
        changeLoginState();
        return null;
      } else {
        return '로그인에실패했습니다. 입력정보를 확인해주세요';
      }
    });
  }

  @override
  Future<String?> loadSignUp(SignupData data) async {
    Duration loginTime = Duration(milliseconds: timeDilation.ceil() * 50);
    String? username = data.name;
    String? password = data.password;
    late String email;
    late String phoneNumber;
    late String name;

    data.additionalSignupData?.forEach((key, value) {
      if (key == 'email') {
        email = value;
      } else if (key == 'phoneNumber') {
        phoneNumber = value;
      } else if (key == 'name') {
        name = value;
      }
    });

    int? statusCode =
        await _repo.signUp(username!, password!, email, phoneNumber, name);

    return Future.delayed(loginTime).then((_) {
      //여기다가 실패 띄우면됨
      if (statusCode == 200) {
        return null;
      } else {
        return '회원가입에 실패하였습니다.';
      }
    });
  }

  @override
  Future<int?> loadSignOut() async {
    return await _repo.signOut();
  }

  @override
  Future<String?> recoverPassword(name) {
    Duration loginTime = Duration(milliseconds: timeDilation.ceil() * 50);
    return Future.delayed(loginTime).then((_) {
      return '기능준비중';
    });
    //   if (!users.containsKey(name)) {
    //     return 'User not exists';
    //   }
    //   return '';
    // });
  }

  @override
  Future<bool> isLogined() async {
    FlutterSecureStorage storage = SecureStorage.storage;
    String? value = await storage.read(key: 'admin');
    _isLogin = (value == null);

    return isLogin;
  }
}
