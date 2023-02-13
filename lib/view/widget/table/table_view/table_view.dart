import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/gate.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/sensor.dart';
import 'package:clean_arch/view/page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view_row.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view_column.dart';
import 'package:recase/recase.dart';
import 'package:go_router/go_router.dart';

class TableView<M extends Base> extends StatelessWidget {
  final double widthRate;
  final double heightRate;
  final double rowHeight;
  final bool test;
  final Color color;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;
  final List<Type> havingDescriptionModelList = [
    Contract,
    Customer,
    Office,
    CustomerMember,
    Sensor,
    Gate
  ];
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();
  TableProvider? cuDialogProvider;
  Map<String, dynamic>? targetMapper;
  TableView(
      {this.widthRate = 1,
      this.heightRate = 0.35,
      this.rowHeight = 64,
      this.color = Colors.white,
      this.test = false,
      super.key});

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
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(fontSize: 15),
            ),
          );
        } else if (snapshot.data == false) {
          return const Center(
            child: Text(
              'Fail',
              style: TextStyle(fontSize: 15),
            ),
          );
        } else {
          return Container(
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
                          ? (MediaQuery.of(context).size.width - 295 >
                                  (columnAttributesList[columnAttributesList.length - 2]
                                          .leftMargin +
                                      columnAttributesList[columnAttributesList.length - 2]
                                          .width +
                                      50)
                              ? MediaQuery.of(context).size.width - 295
                              : columnAttributesList[columnAttributesList.length - 2]
                                      .leftMargin +
                                  columnAttributesList[columnAttributesList.length - 2]
                                      .width +
                                  50)
                          : (MediaQuery.of(context).size.width - 295 >
                                  (columnAttributesList[columnAttributesList.length - 1]
                                          .leftMargin +
                                      columnAttributesList[columnAttributesList.length - 1]
                                          .width +
                                      50)
                              ? MediaQuery.of(context).size.width - 295
                              : columnAttributesList[columnAttributesList.length - 1]
                                      .leftMargin +
                                  columnAttributesList[columnAttributesList.length - 1]
                                      .width +
                                  50),
                      child: provider.dataList!.isEmpty
                          ? const Center(
                              child: Text(
                                "No Result",
                                style: snapShotSensorStyle,
                              ),
                            )
                          : Column(
                              children: [
                                Container(
                                    height: 64,
                                    color: const Color(0xffE6E6E6),
                                    child: TableViewColumn<M>(
                                      havingDescriptionModelList:
                                          havingDescriptionModelList,
                                    )),
                                Consumer<TableProvider<M>>(
                                  builder: (context, provider, child) {
                                    return Expanded(
                                      child: Scrollbar(
                                        controller: _vertical,
                                        child: ListView.builder(
                                          controller: _vertical,
                                          scrollDirection: Axis.vertical,
                                          itemCount: provider.dataList!.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                provider.setSelectedId(provider
                                                    .dataList![index]
                                                    .getMember("id"));
                                                context.push(
                                                  "/${ReCase(M.toString()).camelCase}/${provider.selectedId}",
                                                );
                                              },
                                              child: Container(
                                                color: provider.isChecked(index)
                                                    ? const Color(0xFFf0f8ff)
                                                    : null,
                                                height: rowHeight,
                                                child: TableViewRow<M>(
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

          ///////////////////////
        }
      },
    );
  }
}
