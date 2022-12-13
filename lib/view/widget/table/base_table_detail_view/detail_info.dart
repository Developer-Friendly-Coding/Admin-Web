import 'package:clean_arch/common/constants/enum/business_type.dart';
import 'package:clean_arch/common/constants/table/table_column_attributes_mapper.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/common/constants/table/detail_table_mapper.dart';
import 'package:web_date_picker/web_date_picker.dart';

//ignore: must_be_immutable
class DetailInfo<M extends Base> extends StatefulWidget {
  int selectedId;
  final double widthRate;
  final double height;
  Color color;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;
  DetailInfo(
      {required this.selectedId,
      required this.widthRate,
      required this.height,
      required this.color,
      super.key});

  @override
  State<DetailInfo<M>> createState() => _DetailInfoState<M>();
}

class _DetailInfoState<M extends Base> extends State<DetailInfo<M>> {
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;

  List<Widget> detailComponentList(BaseTableProvider<M> providerRead) {
    providerRead.initDetailUpdateButtonTECList();
    List<Widget> result = [];

    for (int i = 1; i < columnAttributesList.length; i++) {
      Container component = Container(
        color: widget.color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 100,
                child: Text(
                  columnAttributesList[i].columnName,
                  style: detailInfoStyle,
                )),
            SizedBox(
                width: 170,
                height: 50,
                child: columnAttributesList[i].enumValus != null
                    ? (providerRead.initUpdateEnumValue(
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
                                builder: (context, provider, child) {
                                  return DropdownButton(
                                    value: provider.updateEnumValuesMapper[i],
                                    items:
                                        columnAttributesList[i].enumValus!.map(
                                      (value) {
                                        return DropdownMenuItem(
                                            value: value,
                                            child: Text(value.toString()));
                                      },
                                    ).toList(),
                                    onChanged: ((value) {
                                      provider.setUpdateEnumValue(value!, i);
                                      providerRead.updateButtonTECList[i].text =
                                          value.toString();
                                    }),
                                  );
                                },
                              ),
                            ),
                          )
                        : null)
                    : columnAttributesList[i].type == DateTime
                        ? WebDatePicker(
                            onChange: (value) {
                              providerRead.updateButtonTECList[i].text =
                                  DateFormat("yyyy-MM-dd hh:mm:ss")
                                      .format(value!);
                            },
                          )
                        : TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: columnAttributesList[i].validator,
                            controller: providerRead.updateButtonTECList[i],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          )),
          ],
        ),
      );
      result.add(component);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    BaseTableProvider<M> providerRead =
        Provider.of<BaseTableProvider<M>>(context, listen: false);
    return FutureBuilder(
      future: providerRead.getDetailRowDataById(widget.selectedId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
              child: Text(
            "Error!...",
            style: snapShotStyle,
          ));
        } else if (snapshot.hasData == false) {
          return const Center(
              child: Text(
            "Loading...",
            style: snapShotStyle,
          ));
        } else {
          List<Widget> detailCL = detailComponentList(providerRead);

          return Container(
            width: MediaQuery.of(context).size.width * widget.widthRate,
            color: widget.color,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    "id=${widget.selectedId}",
                    style: idInfoStyle,
                  ),
                  height: 40,
                ),
                Container(
                  height: widget.height,
                  child: GridView.builder(
                    itemCount: detailCL.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                      childAspectRatio: 4.5 / 1, //가로 대 세로 비율
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return detailCL[index];
                    },
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 30),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(100, 50)),
                    ),
                    child: Text("수정"),
                    onPressed: (() async {
                      try {
                        int? statusCode = await providerRead.updateTableRow();
                        if (statusCode == 200) {
                          await providerRead.getTableData();
                          Fluttertoast.showToast(
                              msg: "수정 성공!",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 35.0);
                        } else {
                          Fluttertoast.showToast(
                              msg: "수정 실페...",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 35.0);
                        }
                      } catch (e) {
                        debugPrint(e.toString());
                        return null;
                      }
                    }),
                  ),
                ),
                Container(
                  height: 50,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
