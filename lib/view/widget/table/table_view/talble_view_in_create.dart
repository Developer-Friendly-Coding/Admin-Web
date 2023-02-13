import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/gate.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/sensor.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view_in_create_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view_column.dart';

class TableViewInCreate<M extends Base> extends StatelessWidget {
  // final double widthRate;
  final double height;
  final double rowHeight;
  final bool test;
  final Color color;
  final TextStyle? columnStyle;
  final TextStyle? rowStyle;
  final List<Type> havingDescriptionModelList = [
    Contract,
    Customer,
    Office,
    CustomerMember,
    Sensor,
    Gate
  ];
  TableViewInCreate(
      {
      // this.widthRate = 0.65,
      this.height = 300,
      this.rowHeight = 50,
      this.color = Colors.white,
      this.test = false,
      this.columnStyle,
      this.rowStyle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
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
              return provider.tempDataListInCreate.isEmpty
                  ? Center(
                      child: Text(
                        "No Result",
                        style: snapShotSensorStyle,
                      ),
                    )
                  : Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: provider.tempDataListInCreate.length,
                        separatorBuilder: (context, index) => const Divider(
                          thickness: 1,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: rowHeight,
                            child: TableViewInCreateRow<M>(
                              rowStyle: rowStyle,
                              index: index,
                              test: test,
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
}
