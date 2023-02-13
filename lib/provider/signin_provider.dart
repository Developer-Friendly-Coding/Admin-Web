import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_login/flutter_login.dart';

abstract class ISignInProvider extends ChangeNotifier {
  bool get isLogin;

  void changeLoginState();
  Future<String?> loadSignIn(LoginData data);
  Future<String?> loadSignUp(SignupData data);
  Future<int?> loadSignOut();

  Future<String?> recoverPassword(String name);
  Future<bool> isLogined();
}
