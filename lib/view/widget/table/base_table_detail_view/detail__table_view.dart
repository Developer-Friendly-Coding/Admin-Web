import 'package:clean_arch/common/constants/table/table_column_attributes_mapper.dart';
import 'package:clean_arch/view/page/detail_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_view_row.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_view_column.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';

class DetailTableView<M extends Base> extends StatelessWidget {
  final int id;
  final String modelName;
  final double widthRate;
  final double height;
  final double rowHeight;
  final bool test;
  final Color color;
  final TextStyle? columnStyle;
  final TextStyle? rowStyle;

  const DetailTableView(
      {required this.id,
      required this.modelName,
      this.widthRate = 0.65,
      this.height = 400,
      this.rowHeight = 50,
      this.color = Colors.white,
      this.test = false,
      this.columnStyle,
      this.rowStyle,
      super.key});

  @override
  Widget build(BuildContext context) {
    BaseTableProvider<M> providerRead =
        Provider.of<BaseTableProvider<M>>(context, listen: false);

    return FutureBuilder(
        future: providerRead.getDetailTableDataById(modelName, id),
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
            return Container(
              height: height,
              width: MediaQuery.of(context).size.width * widthRate,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  BaseTableViewColumn<M>(columnStyle: columnStyle),
                  const SizedBox(height: 30),

                  Expanded(
                    child: ListView.separated(
                        controller: ScrollController(),
                        //itemcount는 rebuild되면서 변해야하므로 listen 에 true가 맞다.
                        itemCount: Provider.of<BaseTableProvider<M>>(context)
                            .dataList!
                            .length,
                        separatorBuilder: (context, index) => const Divider(
                              thickness: 1,
                            ),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              providerRead.changeSelectedIndex(index);
                              providerRead.setUpdateButtonTECList();
                            },
                            onDoubleTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => (DetailPage<M>(
                                    selectedId:
                                        providerRead.dataList![index].getId(),
                                  )),
                                ),
                              );
                            },
                            child: Container(
                              color: providerRead.selectedIndex == index
                                  ? const Color(0xFFf0f8ff)
                                  : null,
                              height: rowHeight,
                              child: BaseTableViewRow<M>(
                                rowStyle: rowStyle,
                                index: index,
                                test: test,
                              ),
                            ),
                          );
                        }),
                  ),

                  ////
                ],
              ),
            );
          }
        });
  }
}
