import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/common/constants/validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:provider/provider.dart';
import 'package:clean_arch/provider/impl/signin_provider_impl.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 50);
  @override
  Widget build(BuildContext context) {
    SignInProvider providerRead =
        Provider.of<SignInProvider>(context, listen: false);

    return FutureBuilder(
        future: providerRead.isLogined(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false) {
            return const Text(
              "Loading..",
              style: snapShotStyle,
            );
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(fontSize: 15),
              ),
            );
          }

          if (snapshot.data == false) {
            return Scaffold(
              key: key,
              body: FlutterLogin(
                title: 'Pathfinder Login',
                userValidator: stringNotNullValidor,
                passwordValidator: intNullableValidator,
                // logo: AssetImage('assets/images/ecorp.png'),
                theme: LoginTheme(
                  bodyStyle: const TextStyle(color: Colors.blueGrey),
                  primaryColor: const Color(0x398F89A1),
                  accentColor: Colors.lightBlue,
                  errorColor: Colors.redAccent,
                  titleStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  buttonTheme: const LoginButtonTheme(
                    splashColor: Colors.black,
                    backgroundColor: Colors.cyan,
                  ),
                ),
                onLogin: providerRead.loadSignIn,
                onSignup: providerRead.loadSignUp,
                messages: LoginMessages(
                    signUpSuccess: "회원가입 성공하셨습니다!",
                    confirmPasswordHint: "비밀번호 확인",
                    confirmPasswordError: "비밀번호가 일치하지 않습니다",
                    loginButton: '로그인',
                    signupButton: '회원가입',
                    userHint: '아이디',
                    passwordHint: '비밀번호',
                    goBackButton: "뒤로가기"),
                onRecoverPassword: providerRead.recoverPassword,
                additionalSignupFields: [
                  UserFormField(
                      icon: const Icon(Icons.alternate_email),
                      keyName: 'email',
                      displayName: '이메일',
                      fieldValidator: phoneNullableValidator),
                  UserFormField(
                      icon: const Icon(Icons.badge),
                      keyName: 'name',
                      displayName: '성함',
                      fieldValidator: phoneNullableValidator),
                  UserFormField(
                      icon: const Icon(Icons.phone),
                      keyName: 'phoneNumber',
                      displayName: '휴대전화',
                      fieldValidator: phoneNullableValidator),
                ],
                initialAuthMode: AuthMode.login,
                scrollable: false,
                hideProvidersTitle: false,
                disableCustomPageTransformer: true,
                onSubmitAnimationCompleted: () {
                  //뭐든지 제출완료되면 호출되는 함수
                  if (providerRead.isLogin == true) {
                    Fluttertoast.showToast(
                        msg: "성공적으로 로그인 하였습니다!",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.blueAccent,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }

                  context.go('/dashBoard');
                },
              ),
            );
          } else {
            Future.microtask(() => context.go('/dashBoard'));

            return const SizedBox();
          }
        });
  }
}
