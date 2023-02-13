import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/common/constants/mapper/table_name_mapper.dart';
import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/gate.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/sensor.dart';
import 'package:clean_arch/view/widget/table/table_cu_dialog/table_view_for_cuDialog_row.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view_column.dart';
import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:go_router/go_router.dart';
import 'package:recase/recase.dart';

class TableViewForCuDialog<M extends Base> extends StatelessWidget {
  final double rowHeight;
  final bool test;
  final Color color;
  final TextStyle? columnStyle;
  final TextStyle? rowStyle;
  final ColumnAttributes columnAttributes;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;
  late Type fromModel;
  late String cuMode;
  final TextEditingController? controller;
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();
  final List<Type> havingDescriptionModelList = [
    Contract,
    Customer,
    Office,
    CustomerMember,
    Sensor,
    Gate
  ];
  TableViewForCuDialog(
      {this.controller,
      this.rowHeight = 40,
      this.color = Colors.white,
      this.test = false,
      this.columnStyle,
      this.rowStyle,
      required this.columnAttributes,
      super.key});

  void setFromAndMode(Type from, String mode) {
    fromModel = from;
    cuMode = mode;
  }

  @override
  Widget build(BuildContext context) {
    TableProvider<M> providerRead =
        Provider.of<TableProvider<M>>(context, listen: false);

    return FutureBuilder(
        future: providerRead.getCuDialogData(),
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
            return Container(
              height: 330,
              color: color,
              child: Scrollbar(
                controller: _horizontal,
                child: SingleChildScrollView(
                  controller: _horizontal,
                  scrollDirection: Axis.horizontal,
                  child: Consumer<TableProvider<M>>(
                    builder: (context, provider, child) {
                      return SizedBox(
                        width: havingDescriptionModelList.contains(M)
                            ? columnAttributesList[
                                        columnAttributesList.length - 2]
                                    .leftMargin +
                                columnAttributesList[
                                        columnAttributesList.length - 2]
                                    .width +
                                50
                            : columnAttributesList[
                                        columnAttributesList.length - 1]
                                    .leftMargin +
                                columnAttributesList[
                                        columnAttributesList.length - 1]
                                    .width +
                                50,
                        child: provider.cuDialogDataList!.isEmpty
                            ? const Center(
                                child: Text(
                                  "No Result",
                                  style: snapShotSensorStyle,
                                ),
                              )
                            : Column(
                                children: [
                                  Container(
                                    height: 40,
                                    color: const Color(0xffE6E6E6),
                                    child: TableViewColumn<M>(
                                      havingDescriptionModelList:
                                          havingDescriptionModelList,
                                    ),
                                  ),
                                  Consumer<TableProvider<M>>(
                                    builder: (context, provider, child) {
                                      return Expanded(
                                        child: Scrollbar(
                                          controller: _vertical,
                                          child: ListView.builder(
                                            controller: _vertical,
                                            scrollDirection: Axis.vertical,
                                            itemCount: provider
                                                .cuDialogDataList!.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                onTap: () {
                                                  provider.setSelectedId(
                                                      provider
                                                          .cuDialogDataList![
                                                              index]
                                                          .getMember("id"));

                                                  provider.setCuDialog(
                                                      columnAttributes,
                                                      fromModel,
                                                      context,
                                                      cuMode,
                                                      controller);

                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  color: provider
                                                          .isChecked(index)
                                                      ? const Color(0xFFf0f8ff)
                                                      : null,
                                                  height: rowHeight,
                                                  child:
                                                      TableViewForCuDialogRow<
                                                          M>(
                                                    havingDescriptionModelList:
                                                        havingDescriptionModelList,
                                                    index: index,
                                                    test: test,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                      );
                    },
                  ),
                ),
              ),
            );
          }
        });
  }
}
