import 'package:clean_arch/common/constants/enum/business_type.dart';
import 'package:clean_arch/common/constants/table/table_column_attributes_mapper.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
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

  final String tableName = tableNameMapper[M.toString()]!;

  List<Widget> detailComponentList(BaseTableProvider<M> providerRead) {
    providerRead.setDetailUpdateButtonTECList();
    List<Widget> result = [];

    for (int i = 1; i < columnAttributesList.length; i++) {
      Container component = Container(
        color: widget.color,
        child: Row(
          children: [
            SizedBox(width: 30),
            Container(
                width: 55,
                child: Text(
                  columnAttributesList[i].columnName,
                  style: detailInfoStyle,
                )),
            SizedBox(
                width: 180,
                child: columnAttributesList[i].enumValus != null
                    ? DropdownButton(
                        value: columnAttributesList[i].enumValus![0],
                        items: columnAttributesList[i].enumValus!.map(
                          (value) {
                            return DropdownMenuItem(
                                value: value, child: Text(value.toString()));
                          },
                        ).toList(),
                        onChanged: ((value) {
                          providerRead.updateButtonTECList[i].text =
                              value.toString();
                        }),
                      )
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
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    "id=${widget.selectedId}",
                    style: idInfoStyle,
                  ),
                  height: 40,
                  width: MediaQuery.of(context).size.width * widget.widthRate,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * widget.widthRate,
                  height: widget.height,
                  child: GridView.builder(
                    itemCount: detailCL.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                            childAspectRatio: 4 / 1, //가로 대 세로 비율
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return detailCL[index];
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 600, right: 100),
                  height: 50,
                  width: MediaQuery.of(context).size.width * widget.widthRate,
                  child: ElevatedButton(
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
