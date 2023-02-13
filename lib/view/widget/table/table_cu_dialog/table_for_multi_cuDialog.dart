import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/gate.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/sensor.dart';
import 'package:clean_arch/view/widget/table/table_cu_dialog/table_view_for_cuDialog_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view_column.dart';

class TableViewForMultiCuDialog<M extends Base> extends StatelessWidget {
  final double height;
  final double rowHeight;
  final bool test;
  final Color color;
  final TextStyle? columnStyle;
  final TextStyle? rowStyle;
  late Type fromModel;
  late String cuMode;
  final List<Type> havingDescriptionModelList = [
    Contract,
    Customer,
    Office,
    CustomerMember,
    Sensor,
    Gate
  ];
  TableViewForMultiCuDialog(
      {this.height = 300,
      this.rowHeight = 50,
      this.color = Colors.white,
      this.test = false,
      this.columnStyle,
      this.rowStyle,
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
      future: providerRead.getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData == false) {
          return const Center(child: Text("Loading...", style: snapShotStyle));
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
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const SizedBox(height: 24),
                TableViewColumn<M>(
                    havingDescriptionModelList: havingDescriptionModelList,
                    columnStyle: columnStyle),
                const SizedBox(height: 30),
                Consumer<TableProvider<M>>(
                  builder: (context, provider, child) {
                    return provider.dataList!.isEmpty
                        ? Center(
                            child: Text(
                              "No Result",
                              style: snapShotSensorStyle,
                            ),
                          )
                        : Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemCount: provider.dataList!.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                thickness: 1,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    provider.setMultiCuDialogId(provider
                                        .dataList![index]
                                        .getMember("id"));
                                  },
                                  child: Container(
                                    color: provider.isMultiCuDialogContainId(
                                            provider.dataList![index]
                                                .getMember("id"))
                                        ? const Color(0xFFf0f8ff)
                                        : null,
                                    height: rowHeight,
                                    child: TableViewForCuDialogRow<M>(
                                      havingDescriptionModelList:
                                          havingDescriptionModelList,
                                      rowStyle: rowStyle,
                                      index: index,
                                      test: test,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                  },
                ),

                ////
              ],
            ),
          );
        }
      },
    );
  }
}
