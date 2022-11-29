import 'package:clean_arch/provider/impl/signin_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:clean_arch/common/constants/secure_storage.dart';

import 'package:clean_arch/common/constants/text_style.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;

    SignInProvider providerRead =
        Provider.of<SignInProvider>(context, listen: false);

    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.0525,
        height: MediaQuery.of(context).size.width * 0.026,
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.031,
            right: MediaQuery.of(context).size.width * 0.031),
        child: ElevatedButton(
          child: Text(
            "로그아웃",
            style: currentWidth < 1920
                ? loginButtonTextStyleLapTop
                : loginButtonTextStyle,
          ),
          style: ElevatedButton.styleFrom(padding: EdgeInsets.all(0)),
          onPressed: () async {
            int? statusCode = await providerRead.loadSignOut();
            if (statusCode == 200) {
              Fluttertoast.showToast(
                  msg: "성공적으로 로그아웃을 하였습니다!",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 3,
                  backgroundColor: Colors.blueAccent,
                  textColor: Colors.white,
                  fontSize: 16.0);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            } else {
              Fluttertoast.showToast(
                  msg: "로그아웃 실패!",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 3,
                  backgroundColor: Colors.blueAccent,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
        ),
      ),
    );
  }
}
