import 'package:clean_arch/common/constants/table/table_column_attributes_mapper.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:web_date_picker/web_date_picker.dart';

class BaseTableCreateButton<M extends Base> extends StatefulWidget {
  final double alertWidth;
  final double alertHeight;
  final double componentNameWidth;
  final double componentInputWidth;

  const BaseTableCreateButton(
      {this.alertWidth = 900,
      this.alertHeight = 300,
      this.componentNameWidth = 100,
      this.componentInputWidth = 170,
      super.key});

  @override
  State<BaseTableCreateButton<M>> createState() =>
      _BaseTableCreateButtonState<M>();
}

class _BaseTableCreateButtonState<M extends Base>
    extends State<BaseTableCreateButton<M>> {
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;

  final _formKey = GlobalKey<FormState>();

  List<Widget> alertComponentList(BaseTableProvider<M> providerRead) {
    //   key: _formKey,

    List<Widget> result = [];

    for (int i = 1; i < columnAttributesList.length; i++) {
      Row component = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: widget.componentNameWidth,
              child: Text(
                columnAttributesList[i].columnName,
                style: detailInfoStyle,
              )),
          SizedBox(
            width: widget.componentInputWidth,
            height: 50,
            child: columnAttributesList[i].enumValus != null
                ? (providerRead.initCreateEnumValue(
                        columnAttributesList[i].enumValus![0], i)
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: 0.3),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: Consumer<BaseTableProvider<M>>(
                            builder: ((ctx, provider, child) {
                              return DropdownButton(
                                value: provider.createEnumValuesMapper[i],
                                items: columnAttributesList[i].enumValus!.map(
                                  (value) {
                                    return DropdownMenuItem(
                                        value: value,
                                        child: Text(value.toString()));
                                  },
                                ).toList(),
                                onChanged: ((value) {
                                  provider.setCreateEnumValue(value!, i);
                                  provider.addButtonTECList[i].text =
                                      value.toString();
                                }),
                              );
                            }),
                          ),
                        ),
                      )
                    : null)
                : columnAttributesList[i].type == DateTime
                    ? WebDatePicker(
                        onChange: (value) {
                          providerRead.addButtonTECList[i].text =
                              DateFormat("yyyy-MM-dd hh:mm:ss").format(value!);
                        },
                      )
                    : TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: columnAttributesList[i].validator,
                        controller: providerRead.addButtonTECList[i],
                        onChanged: (value) {
                          // providerRead.setAddButtonTECList(i, value);
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
          ),
        ],
      );

      result.add(component);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext ctx) {
                //  Form(

                BaseTableProvider<M> providerRead =
                    Provider.of<BaseTableProvider<M>>(ctx, listen: false);
                List<Widget> tableCL = alertComponentList(providerRead);

                return AlertDialog(
                  actionsPadding: const EdgeInsets.only(bottom: 50, right: 50),
                  contentPadding: const EdgeInsets.only(top: 50),
                  title: const Text('테이블 열 추가'),
                  content: SizedBox(
                    width: widget.alertWidth,
                    height: widget.alertHeight,
                    child: GridView.builder(
                      itemCount: tableCL.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                        childAspectRatio: 4.5 / 1, //가로 대 세로 비율
                      ),
                      itemBuilder: (BuildContext _, int index) {
                        return tableCL[index];
                      },
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        // if (_formKey.currentState?.validate() ?? false) {
                        try {
                          Provider.of<BaseTableProvider<M>>(ctx, listen: false)
                              .addButtonTECList
                              .forEach((tec) => print(tec.text));
                          int? statusCode = await providerRead.createTableRow();
                          if (statusCode == 200) {
                            await providerRead.getTableData();
                            Fluttertoast.showToast(
                                msg: "추가 성공!",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 35.0);
                          } else {
                            Fluttertoast.showToast(
                                msg: "추가 실페...",
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
                        // } //

                        // else {
                        //   Fluttertoast.showToast(
                        //       msg: "모든 유효성을 통과하세요",
                        //       toastLength: Toast.LENGTH_LONG,
                        //       gravity: ToastGravity.CENTER,
                        //       timeInSecForIosWeb: 1,
                        //       backgroundColor: Colors.red,
                        //       textColor: Colors.white,
                        //       fontSize: 35.0);
                        // }
                      },
                      child: const Text(
                        '확인',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Consumer<BaseTableProvider<M>>(
                      builder: (context, provider, child) {
                        return TextButton(
                          onPressed: () {
                            provider.clearAddButtonTECList();
                            Navigator.of(context).pop();
                          },
                          child: const Text('취소',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold)),
                        );
                      },
                    ),
                  ],
                );
                // ),
              });
        },
        child: const Text('추가'));
  }
}
