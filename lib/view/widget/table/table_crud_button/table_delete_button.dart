import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TableDeleteButton<M extends Base> extends StatelessWidget {
  final double alertWidth;
  final double alertHeight;
  final bool isFromRelatedTable;
  final Future<bool> Function()? getRelatedDataById;
  const TableDeleteButton(
      {this.alertWidth = 900,
      this.alertHeight = 370,
      this.isFromRelatedTable = false,
      this.getRelatedDataById,
      super.key});

  @override
  Widget build(BuildContext context) {
    TableProvider<M> providerRead =
        Provider.of<TableProvider<M>>(context, listen: false);

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            fixedSize: Size(73, 44),
            backgroundColor: Colors.red),
        onPressed: () {
          providerRead.selectedId == -1
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
                              Map<String, dynamic>
                                  statusAndErrorAndErrorContext =
                                  await providerRead.deleteTableRow();
                              if (statusAndErrorAndErrorContext["statusCode"] ==
                                  200) {
                                isFromRelatedTable
                                    ? await getRelatedDataById!()
                                    : await providerRead.getData();
                                Navigator.pop(context);
                                Fluttertoast.showToast(
                                    msg: "삭제 성공!",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 35.0);
                              } else {
                                Navigator.of(context).pop();
                                errorDialog(
                                    context,
                                    statusAndErrorAndErrorContext["statusCode"],
                                    statusAndErrorAndErrorContext["error"]!,
                                    statusAndErrorAndErrorContext[
                                        "errorContext"]);
                              }
                            } catch (e) {
                              Navigator.of(context).pop();
                              errorDialog(context, null, e.toString(), null);
                            }
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('삭제', style: deleteButtonTextStyle),
          ],
        ));
  }
}
