import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/common/constants/mapper/table_name_mapper.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/common/util/class_builder.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/manager.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:clean_arch/model/impl/sensor.dart';
import 'package:clean_arch/model/impl/sensor_value.dart';
import 'package:clean_arch/model/impl/service_provider.dart';
import 'package:clean_arch/model/impl/tax_bill.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:clean_arch/view/widget/error_dialog.dart';
import 'package:clean_arch/view/widget/table/table_search/table_cu_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

//ignore: must_be_immutable l
class TableCreateInfo<M extends Base> extends StatefulWidget {
  Color color;

  TableCreateInfo({this.color = Colors.white, super.key});

  @override
  State<TableCreateInfo<M>> createState() => _TableCreateInfoState<M>();
}

class _TableCreateInfoState<M extends Base> extends State<TableCreateInfo<M>> {
  final List<Type> disableModelList = [Contract, TaxBill, Sensor, SensorValue];
  final List<Type> havingNameModelList = [
    Customer,
    CustomerMember,
    Office,
    OfficeBranch,
    Manager,
    ServiceProvider,
    Sensor
  ];

  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;
  final _formKey = GlobalKey<FormState>();
  final controller = ScrollController();
  late List<Widget> createFieldList;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    createFieldList =
        setField(context, ClassBuilder.getTableProvider(M, false, context)!);
    ClassBuilder.getTableProvider(M, false, context)!.initAddTextList();
  }

  SizedBox dateTimeSearchBox(int i, TableProvider providerRead) {
    return SizedBox(
      width: 137,
      child: TextFormField(
        validator: columnAttributesList[i].validator,
        minLines: 1,
        maxLines: 100,
        controller: providerRead.addButtonTECList[i],
        readOnly: true,
        style: searchTextStyle,
        decoration: InputDecoration(
          labelText: columnAttributesList[i].name,
          labelStyle: searchTextStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(width: 1, color: Color(0xffC8C8CB)),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              _selectDate(context, providerRead, i);
            },
            icon: const Icon(Icons.calendar_month),
          ),
        ),
      ),
    );
  }

  SizedBox textSearchBox(int i, TableProvider providerRead) {
    return SizedBox(
      width: 137,
      child: TextFormField(
        validator: columnAttributesList[i].validator,
        minLines: 1,
        maxLines: 100,
        onChanged: (value) {
          providerRead.addButtonTECList[i].text = value;
        },
        controller: providerRead.addButtonTECList[i],
        style: searchTextStyle,
        decoration: InputDecoration(
          isDense: true,
          labelText: columnAttributesList[i].name,
          labelStyle: searchTextStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(width: 1, color: Color(0xffC8C8CB)),
          ),
        ),
      ),
    );
  }

  TableCUDialog cuDialog(int i, TableProvider providerRead) {
    return TableCUDialog<M>(
      isSearch: false,
      mode: "create",
      controller: providerRead.addButtonTECList[i],
      columnAttributes: columnAttributesList[i],
      border: const OutlineInputBorder(),
    );
  }

  List<Widget> setField(BuildContext context, TableProvider providerRead) {
    List<Widget> result = [];
    for (int i = 0; i < columnAttributesList.length; i++) {
      Container component;
      if (i == 0) {
        result.add(Container(width: 137, child: Text('기입불가')));
        continue;
      }
      component = Container(
          child: columnAttributesList[i].enumValus != null
              ? (providerRead.setSearchStringValue(
                      columnAttributesList[i].enumValus![0].toString(), i)
                  ? Container(
                      width: 137,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xffC8C8CB),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: Consumer<TableProvider<M>>(
                          builder: (context, provider, child) {
                            List<String> items = [];
                            columnAttributesList[i]
                                .enumValus!
                                .forEach((element) {
                              items.add(element.toString());
                            });
                            return DropdownButton(
                              value: provider.searchStringValuesMapper[i],
                              items: items.map(
                                (value) {
                                  return DropdownMenuItem(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: searchTextStyle,
                                      ));
                                },
                              ).toList(),
                              onChanged: ((value) {
                                provider.setSearchStringValue(value, i);
                                providerRead.addButtonTECList[i].text = value!;
                              }),
                            );
                          },
                        ),
                      ),
                    )
                  : const SizedBox())
              : columnAttributesList[i].type == DateTime
                  ? dateTimeSearchBox(i, providerRead)
                  : columnAttributesList[i].isCuDialog == true
                      ? cuDialog(i, providerRead)
                      : textSearchBox(i, providerRead));
      result.add(component);
    }

    return result;
  }

  _selectDate(
      BuildContext context, TableProvider providerRead, int index) async {
    DateTime selecedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null && picked != selecedDate) {
      selecedDate = picked;
      providerRead.addButtonTECList[index].text =
          DateFormat('yyyy-MM-dd').format(selecedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    TableProvider<M> providerRead =
        Provider.of<TableProvider<M>>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: widget.color,
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          "${tableNameMapper[M.toString()]!} 추가",
                          style: detailInfoTitleTextStyle,
                        ),
                      ),
                      width: 180,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(87, 44)),
                            child: Text("추가"),
                            onPressed: () async {
                              try {
                                print(777);
                                providerRead.setDataForCreate();
                                print(888);
                                Map<String, dynamic>
                                    statusAndErrorAndErrorContext =
                                    await providerRead.createTableRow();
                                if (statusAndErrorAndErrorContext[
                                        "statusCode"] ==
                                    200) {
                                  await providerRead.getData();

                                  Fluttertoast.showToast(
                                      msg: "추가 성공!",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 35.0);
                                  Navigator.of(context).pop();
                                } else {
                                  errorDialog(
                                      context,
                                      statusAndErrorAndErrorContext[
                                          "statusCode"],
                                      statusAndErrorAndErrorContext["error"]!,
                                      statusAndErrorAndErrorContext[
                                          "errorContext"]);
                                }
                              } catch (e) {
                                Navigator.of(context).pop();
                                errorDialog(context, null, e.toString(), null);
                              }
                            }),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Divider(
                  color: Color(0xffE7E7E7),
                  height: 1,
                  thickness: 1,
                ),
                SizedBox(height: 24),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Scrollbar(
                      controller: controller,
                      child: ListView.separated(
                        controller: controller,
                        itemCount: columnAttributesList.length,
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: Color(0xffE7E7E7),
                            height: 1,
                            thickness: 1,
                          );
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              children: [
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 120,
                                            child: Text(
                                              columnAttributesList[index].name,
                                              style: detailInfoNameTextStyle,
                                            )),
                                      ],
                                    ),
                                    SizedBox(width: 20),
                                    createFieldList[index]
                                  ],
                                ),
                                SizedBox(height: 16),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 24),
        ],
      ),
    );

    /////
  }

////////////////
}
