import 'package:clean_arch/common/constants/mapper/cu_dialog_mapper.dart';
import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:clean_arch/provider/impl/signin_provider_impl.dart';
import 'package:clean_arch/view/widget/error_dialog.dart';
import 'package:clean_arch/view/widget/table/base_table_search/base_table_cu_dialog.dart';
import 'package:clean_arch/view/widget/table/base_table_search/base_table_multi_cu_dialog.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/sidebar_menu.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'dart:core';

class TableCreatePage<M extends Base> extends StatelessWidget {
  TableCreatePage({Key? key}) : super(key: key);
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  List<Widget> detailComponentList(BaseTableProvider<M> providerRead) {
    List<Widget> result = [];

    for (int i = 1; i < columnAttributesList.length; i++) {
      Container component = Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 100,
                child: Text(
                  columnAttributesList[i].name,
                  style: detailInfoStyle,
                )),
            SizedBox(
                width: 170,
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
                                builder: (context, provider, child) {
                                  return DropdownButton(
                                    value: provider.createEnumValuesMapper[i],
                                    items:
                                        columnAttributesList[i].enumValus!.map(
                                      (value) {
                                        return DropdownMenuItem(
                                            value: value,
                                            child: Text(value.toString()));
                                      },
                                    ).toList(),
                                    onChanged: ((value) {
                                      provider.setCreateEnumValue(value!, i);
                                      providerRead.addButtonTECList[i].text =
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
                              providerRead.addButtonTECList[i].text =
                                  DateFormat("yyyy-MM-dd hh:mm:ss")
                                      .format(value!);
                            },
                          )
                        : columnAttributesList[i].isCuDialog == true
                            ? baseTableCUDialog(i, providerRead)
                            : TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: columnAttributesList[i].validator,
                                controller: providerRead.addButtonTECList[i],
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
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

  BaseTableCUDialog<M> baseTableCUDialog(
      int idx, BaseTableProvider<M> providerRead) {
    Map<String, dynamic> mapper = cuDialogMapper[M]![idx]!;
    return BaseTableCUDialog<M>(
        targetMapper: mapper,
        validator: columnAttributesList[idx].validator,
        controller: providerRead.addButtonTECList[idx],
        mode: "create",
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10));
  }

  @override
  Widget build(BuildContext context) {
    SignInProvider providerRead =
        Provider.of<SignInProvider>(context, listen: false);

    return FutureBuilder(
        future: providerRead.isLogined(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false) {
            return const Center(
                child: Text("Loading...", style: snapShotStyle));
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(fontSize: 15),
              ),
            );
          } else {
            if (snapshot.data == true) {
              BaseTableProvider<M> providerRead =
                  Provider.of<BaseTableProvider<M>>(context, listen: false);
              List<Widget> detailCL = detailComponentList(providerRead);

              return Scaffold(
                key: _scaffoldKey,
                body: Container(
                  color: const Color.fromARGB(255, 232, 237, 246),
                  child: Row(
                    children: [
                      const SideBarMenu(),
                      SingleChildScrollView(
                        child: SizedBox(
                          width:
                              MediaQuery.of(context).size.width * 0.8197916667,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Column(
                                  children: [
                                    SizedBox(height: 50),
                                    Container(height: 30, color: Colors.white),
                                    Form(
                                      key: _formKey,
                                      child: Container(
                                        color: Colors.white,
                                        height: 350,
                                        child: GridView.builder(
                                          itemCount: detailCL.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount:
                                                3, //1 개의 행에 보여줄 item 개수
                                            childAspectRatio:
                                                4 / 1, //가로 대 세로 비율
                                          ),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return detailCL[index];
                                          },
                                        ),
                                      ),
                                    ),
                                    // BaseTableMultiCUDialog(
                                    //   model: multipleCuDialogMapper[M]![
                                    //       "targetModel"]!,
                                    // ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    Size(100, 50)),
                                          ),
                                          child: Text("추가"),
                                          onPressed: (() async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              try {
                                                List<dynamic>?
                                                    statusAndErrorAndErrorContext =
                                                    await providerRead
                                                        .createTableRow();
                                                int? statusCode =
                                                    statusAndErrorAndErrorContext[
                                                        0];
                                                String? error =
                                                    statusAndErrorAndErrorContext[
                                                        1];
                                                String? errorContext =
                                                    statusAndErrorAndErrorContext[
                                                        2];

                                                if (statusCode == 200) {
                                                  await providerRead
                                                      .getTableData();
                                                  Navigator.of(context).pop();
                                                  Fluttertoast.showToast(
                                                      msg: "추가 성공!",
                                                      toastLength:
                                                          Toast.LENGTH_LONG,
                                                      gravity:
                                                          ToastGravity.CENTER,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 35.0);
                                                } else {
                                                  Navigator.of(context).pop();
                                                  errorDialog(
                                                      context,
                                                      statusCode,
                                                      error!,
                                                      errorContext);
                                                }
                                              } catch (e) {
                                                Navigator.of(context).pop();
                                                errorDialog(context, null,
                                                    e.toString(), null);
                                              }
                                            } else {}
                                          }),
                                        ),
                                        SizedBox(width: 50),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    Size(100, 50)),
                                          ),
                                          child: Text("취소"),
                                          onPressed: (() {
                                            providerRead
                                                .clearAddButtonTECList();
                                            Navigator.pop(context);
                                          }),
                                        ),
                                        SizedBox(width: 50)
                                      ],
                                    ),
                                    Container(
                                      height: 50,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                  child: Text(
                "Please Login First",
                style: snapShotStyle,
              ));
            }
          }
        });
  }
}