import 'package:flutter/material.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BaseTableDeleteButton<M extends Base> extends StatelessWidget {
  final double alertWidth;
  final double alertHeight;

  const BaseTableDeleteButton(
      {this.alertWidth = 900, this.alertHeight = 370, super.key});

  @override
  Widget build(BuildContext context) {
    BaseTableProvider<M> providerRead =
        Provider.of<BaseTableProvider<M>>(context, listen: false);

    return ElevatedButton(
        onPressed: () {
          providerRead.selectedIndex == -1
              ? Fluttertoast.showToast(
                  msg: "먼저 삭제할 열을 선택해 주세요",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0)
              : showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    actionsPadding:
                        const EdgeInsets.only(bottom: 50, right: 50),
                    contentPadding: const EdgeInsets.only(top: 50),
                    title: const Text('테이블 열 삭제'),
                    content: Container(
                      constraints:
                          const BoxConstraints(maxWidth: 1050, maxHeight: 500),
                      width: alertWidth,
                      // provider(context, listen: false).tablewidthRate,
                      height: alertHeight,
                      child: const Center(
                        child: Text(
                          "정말로 삭제하시겠습니까?",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () async {
                            try {
                              int? statusCode =
                                  await providerRead.deleteTableRow();
                              if (statusCode == 200) {
                                await providerRead.getTableData();
                                Fluttertoast.showToast(
                                    msg: "삭제 성공!",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 35.0);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "삭제 실페...",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 35.0);
                              }
                            } catch (e) {
                              debugPrint(e.toString());
                            }
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            '확인',
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          )),
                      TextButton(
                        onPressed: () {
                          // 암것도안함
                          Navigator.of(context).pop();
                        },
                        child: const Text('취소',
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                );
        },
        child: const Text('삭제'));
  }
}
