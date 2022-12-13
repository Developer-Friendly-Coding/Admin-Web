import 'package:clean_arch/common/constants/enum/search.dart';
import 'package:clean_arch/common/constants/table/table_column_attributes_mapper.dart';
import 'package:clean_arch/view/page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_view_row.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_view_column.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';

class BaseTableView<M extends Base> extends StatelessWidget {
  // final double widthRate;
  final double height;
  final double rowHeight;
  final bool test;
  final Color color;
  final TextStyle? columnStyle;
  final TextStyle? rowStyle;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;

  BaseTableView(
      {
      // this.widthRate = 0.65,
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
      future: providerRead.getTableData(),
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
          providerRead.dataList.isEmpty
              ? null
              : providerRead.initAddButtonTECList();
          return Container(
            height: height,
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
                  child: Consumer<BaseTableProvider<M>>(
                    builder: (context, provider, child) {
                      return provider.dataList.isEmpty
                          ? Center(
                              child: Text(
                                "No Result",
                                style: snapShotSensorStyle,
                              ),
                            )
                          : ListView.separated(
                              controller: ScrollController(),
                              //itemcount는 rebuild되면서 변해야하므로 listen 에 true가 맞다.
                              itemCount: provider.dataList.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                thickness: 1,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    provider.changeSelectedIndex(index);
                                    provider.initUpdateButtonTECList();
                                  },
                                  onDoubleTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => (DetailPage<M>(
                                          selectedId:
                                              provider.dataList[index].getId(),
                                        )),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    color: provider.selectedIndex == index
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
                              },
                            );
                    },
                  ),
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
