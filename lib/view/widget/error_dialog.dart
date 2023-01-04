import 'package:clean_arch/common/constants/text_style.dart';
import 'package:flutter/material.dart';

void errorDialog(
    BuildContext context, int? statusCode, String error, String? errorContext) {
  showDialog(
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.3),
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        var buttonStyle = TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size.zero,
            foregroundColor: const Color(0xff808080));
        return Material(
          color: Colors.transparent,
          // Button for pop context when pressing rest of screen
          child: MaterialButton(
              padding: EdgeInsets.zero,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              enableFeedback: false,
              onPressed: () {
                Navigator.pop(context);
              },
              // can be Center, Column, etc..
              child: Center(
                // edit position where you want

                child: MaterialButton(
                  onPressed: () {},
                  child: Container(
                      width: 500,
                      height: errorContext == null ? 300 : 450,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                            child: Text("테이블 추가 실패", style: unifiedSearchStyle),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Text("오류 코드: ${statusCode ?? "없음"}"),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Text("오류"),
                          ),
                          Container(
                            child: Text(error),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          errorContext != null
                              ? Container(
                                  child: Text("오류 내용"),
                                )
                              : SizedBox(),
                          errorContext != null
                              ? Container(
                                  child: Text(errorContext),
                                )
                              : SizedBox(),
                          SizedBox(height: 50),
                          SizedBox(
                            child: Text("해당 오류를 캡처해 담당 개발자에게 문의하세요",
                                style: unifiedSearchStyle),
                          ),
                        ],
                      )),
                ),
              )),
        );
      });
}
